# encoding: utf-8
require 'rails_helper'
require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'show'" do

    before(:each) do
      @user = Factory(:user)
    end

    it "devrait réussir" do
      get :show, :id => @user
      response.should be_success
    end

    it "devrait trouver le bon utilisateur" do
      get :show, :id => @user
      assigns(:user).should == @user
    end

    it "devrait avoir le bon titre" do
      get :show, :id => @user
      response.should have_selector("title", :text => @user.nom)
    end

    it "devrait inclure le nom de l'utilisateur" do
      get :show, :id => @user
      response.should have_selector("h1", :text => @user.nom)
    end

    it "devrait avoir une image de profil" do
      get :show, :id => @user
      response.should have_selector("h1>img", :class => "gravatar")
    end

  end

  describe "GET 'new'" do
    it "devrait reussir" do
      get 'new'
      response.should be_success
    end

    it "devrait avoir le titre indique" do
      get 'new'
      response.should be_success
    end
  end
end
