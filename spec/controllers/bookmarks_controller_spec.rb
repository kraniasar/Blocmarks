require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do
  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @topic = FactoryGirl.create(:topic)
    @user.topics << @topic
    @bookmark = FactoryGirl.create(:bookmark)
    @topic.bookmarks << @bookmark
  end


  describe "GET #new" do
    it "returns http success" do
      get :new, {topic_id: @topic.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, {topic_id: @topic.id, id: @bookmark.id}
      expect(response).to have_http_status(:success)
    end
  end

end
