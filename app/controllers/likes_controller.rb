class LikesController < ApplicationController

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)
    @like = like
    authorize like

    if like.save
      flash[:notice] = "Like was created"
    else
      flash[:error] = "Error creating like"
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = Like.find(params[:id])
    authorize like

    if like.destroy
      flash[:notice] = "Like was destroyed"
    else
      flash[:error] = "Error destroying like"
    end

    respond_to do |format|
      format.html
      format.js
    end
  end
end
