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


end
