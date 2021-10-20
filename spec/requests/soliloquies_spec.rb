require 'rails_helper'

RSpec.describe 'Soliloquies', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get '/soliloquies/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/soliloquies/edit'
      expect(response).to have_http_status(:success)
    end
  end
end
