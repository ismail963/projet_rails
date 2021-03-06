# encoding: utf-8
require 'rails_helper'
require 'spec_helper'

RSpec.describe "FriendlyForwardings", :type => :request do
 describe "FriendlyForwardings" do

  it "devrait rediriger vers la page voulue après identification" do
    user = Factory(:user)
    visit edit_user_path(user)
    # Le test suit automatiquement la redirection vers la page d'identification.
    get cnx_path
    fill_in "Email",    :with => user.email
    fill_in "Mot de passe", :with => user.password
    click_button "id_submit"
    # Le test suit à nouveau la redirection, cette fois vers users/edit.
    response.should render_template('users/edit')
  end
 end
end
