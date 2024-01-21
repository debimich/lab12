require 'rails_helper'

RSpec.describe "Definitions", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/definitions/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/definitions/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /delete" do
    it "returns http success" do
      get "/definitions/delete"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/definitions/show"
      expect(response).to have_http_status(:success)
    end
  end

end
