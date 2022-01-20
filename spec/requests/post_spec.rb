require 'rails_helper'

RSpec.describe 'POSTS', type: :request do
  describe 'post#index' do
    before(:each) { get user_posts_path user_id: 3 }

    it 'server return 200 then server is ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'it shows post#index route and template' do
      expect(response).to render_template(:index)
    end

    it 'posts#index content is a h1 tag with index posts' do
      expect(response.body).to include('Index posts')
    end
  end

  describe 'post#show' do
    before(:each) { get user_post_path user_id: 1, post: 'show posts', id: 3 }

    it 'status is successful i.e 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'shows the show template' do
      expect(response).to render_template(:show)
    end

    it 'shows body content of posts show' do
      expect(response.body).to include('show posts')
    end
  end
end
