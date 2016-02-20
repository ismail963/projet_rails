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
		response.should GET('users/new')
		response.should have_selector("div#error_explanation")
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
          response.should have_selector("div.flash.success", :text => "Bienvenue dans l'Application Projet!")
          response.should render_template('users/show')
        end.should change(User, :count).by(1)
      end
    end

  end
 end
end
