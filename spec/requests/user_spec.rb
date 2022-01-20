require 'rails_helper'
RSpec.describe 'USER', type: :request do
  describe 'user#index' do
    before(:each) { get user_index_path }

    it 'server return 200 then server is ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'it shows user#index route and template' do
      expect(response).to render_template(:index)
    end

    it 'user#index content is a h1 tag with index user' do
      expect(response.body).to include('<h1>index user</h1>')
    end
  end

  describe 'GET  user#show' do
    before(:each) { get user_path id: 4 }

    it 'status is successful i.e 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'it shows user#show route and template' do
      expect(response).to render_template(:show)
    end

    it 'user#show content is a h1 tag with show user' do
      expect(response.body).to include('<h1>Show users</h1>')
    end
  end
end
