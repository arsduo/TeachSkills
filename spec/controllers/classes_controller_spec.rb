require 'spec_helper'

describe ClassesController do

  describe "GET 'offer'" do
    it "should be successful" do
      get 'offer'
      response.should be_success
    end
  end

  describe "GET 'browser'" do
    it "should be successful" do
      get 'browser'
      response.should be_success
    end
  end

  describe "GET 'search'" do
    it "should be successful" do
      get 'search'
      response.should be_success
    end
  end

  describe "GET 'take'" do
    it "should be successful" do
      get 'take'
      response.should be_success
    end
  end

end
