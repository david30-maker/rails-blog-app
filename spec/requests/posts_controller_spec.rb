require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get user_posts_path(user_id: 1)
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get user_posts_path(user_id: 1)
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get user_posts_path(user_id: 1)
      expect(response.body).to include('<h1>all users posts will display here</h1>')
    end
  end

  describe 'GET /show' do
    let(:post) { Post.create(id: 1, title: 'It is good to be here') }

    it 'returns a successful response' do
      get post_path(post.id)
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get post_path(post.id)
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get post_path(post.id)
      expect(response.body).to include('<h1>posts detail will display here</h1>')
    end
  end
end
