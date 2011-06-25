require 'spec_helper'

describe UserController do

  describe "GET 'signup'" do
    it "should be successful" do
      get 'signup'
      response.should be_success
    end
  end

  describe "GET 'profile'" do
    it "should be successful" do
      get 'profile'
      response.should be_success
    end
  end

end
