require 'rails_helper'

RSpec.describe LikesController, type: :controller do
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
      # post like here
      # check that like was successful
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      # destroy like here
      # check that like was successful
    end
  end

end
