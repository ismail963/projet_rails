require 'rails_helper'
require 'spec_helper'

describe UsersController do

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
