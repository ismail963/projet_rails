# encoding: utf-8
require 'rails_helper'
require 'spec_helper'

RSpec.describe "Users", :type => :request do
 describe "Users" do

  describe "une inscription" do

    describe "ratée" do

      it "ne devrait pas créer un nouvel utilisateur" do
        lambda do
		visit inscription_path
		fill_in "Nom",          :with => ""
		fill_in "Email",        :with => ""
		fill_in "Mot de passe",     :with => ""
		fill_in "Confirmation", :with => ""
		click_button("id_submit")
	  	get inscription_path
         	assert_template 'users/new'
		assert_select "div", id: "error_explanation"
        end.should_not change(User, :count)
      end
    end

   describe "réussie" do

      it "devrait créer un nouvel utilisateur" do
        lambda do
          visit inscription_path
          fill_in "Nom", :with => "Example User"
          fill_in "Email", :with => "user@example.com"
          fill_in "Mot de passe", :with => "foobar"
          fill_in "Confirmation", :with => "foobar"
          click_button("id_submit")
	  get inscription_path
          assert_template 'users/show'
	  assert_select "div", class:"flash.success"
        end.should change(User, :count).by(1)
      end
    end

  end
 end

 describe "identification/déconnexion" do

    describe "l'échec" do
      it "ne devrait pas identifier l'utilisateur" do
        visit cnx_path
        fill_in 'session[email]',    :with => ""
        fill_in "Mot de passe", :with => ""
        click_button "id_submit"
	page.should have_content "invalide" 
      end
    end

    describe "le succès" do
      it "devrait identifier un utilisateur puis le déconnecter" do
        user = Factory(:user)
        visit cnx_path
        fill_in 'session[email]',    :with => user.email
        fill_in "Mot de passe", :with => user.password
        click_button "id_submit" 
	get 'users' 
        assert_template 'users/show'
    	assert connecter?
        click_link "Déconnexion"
        controller.should_not be_connecter
      end
    end
  end

end
