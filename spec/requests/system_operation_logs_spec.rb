require 'rails_helper'

RSpec.describe "SystemOperationLogs", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/system_operation_logs/create"
      expect(response).to have_http_status(:success)
    end
  end

end
