class BookmarksController < ApplicationController
  before_action :authenticate_user!
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def show
    @bookmarks = Bookmark.all
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.new
    authorize @bookmark
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(params.require(:bookmark).permit(:url))
    @bookmark.user_id = current_user.id
    if @bookmark.save
      flash[:notice] = "Bookmark was created"
      redirect_to topics_path
    else
      flash[:error] = "Error creating bookmark"
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:id])


    if @bookmark.update_attributes(params.require(:bookmark).permit(:url))
      redirect_to topics_path, notice: "Bookmark was updated"
    else
      flash[:error] = "Error updating bookmark"
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark

    if @bookmark.destroy
      flash[:notice] = "Bookmark was deleted successfully."
      redirect_to topics_path
    else
      flash[:error] = "There was an error deleting the bookmark."
      render :show
    end
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || topics_path)
  end
end
