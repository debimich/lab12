require 'rails_helper'

RSpec.describe "Values", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/values/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/values/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/values/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
