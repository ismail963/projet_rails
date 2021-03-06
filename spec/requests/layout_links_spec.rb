# encoding: utf-8
require 'rails_helper'
require 'spec_helper'

describe "LayoutLinks" do

  it "devrait trouver une page Accueil at '/'" do
    get '/'
    response.should be_success
  end

  it "devrait trouver une page Contact a '/contact'" do
    get '/contact'
    response.should be_success
  end

  it "should have an A Propos page a '/about'" do
    get '/about'
    response.should be_success
  end

  it "devrait trouver une page Iade a '/aide'" do
    get '/aide'
    response.should be_success
  end

  describe "quand pas identifié" do
    it "doit avoir un lien de connexion" do
      get root_path
      #response.should have_selector("a", :href => signin_path, :content => "S'identifier")
      assert_response :success
      assert_select "a", {href: cnx_path, text: "Connexion" }
    end
  end

  describe "quand identifié" do
    before(:each) do
      @user = Factory(:user)
      visit cnx_path
      fill_in 'session[email]',    :with => @user.email
      fill_in "Mot de passe", :with => @user.password
      click_button "id_submit"
    end

    it "devrait avoir un lien de déconnxion" do
      get root_path
      #response.should have_selector("a", :href => signout_path, :content => "Déconnexion")
      assert_response :success
      assert_select "a", {href: deconnexion_path}, "Déconnexion"
    end

    it "devrait avoir un lien vers le profil" do
      get root_path
      #response.should have_selector("a", :href => user_path(@user), :content => "Profil")
      assert_response :success
      assert_select "a", {href: user_path(@user)}, "Profil" 
    end
  end

end
