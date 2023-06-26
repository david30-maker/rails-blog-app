RSpec.describe UsersController, type: :request do
  describe 'GET #index' do
    before { get '/users' }

    it 'returns a successful response' do
      expect(response).to be_successful
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('<h1>all users lists will show here</h1>')
    end
  end

  describe 'GET #show' do
    before { get '/users/1' }

    it 'returns a successful response' do
      expect(response).to be_successful
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('<h1>each user details will show here</h1>')
    end
  end
end
