require 'rails_helper'

RSpec.describe 'Users/show', type: :request do
  describe 'GET /users/:user_id' do
    let!(:user) { User.create(name: 'Ariel', photo: 'http/foto.com', bio: 'bio', post_counter: 3) }
    before :each do
      get user_path(user)
    end

    it 'should have a http status of 200(correct status)' do
      expect(response).to have_http_status(200)
    end

    it 'should render users/show view' do
      expect(response).to render_template('users/show')
    end

    it 'should include the placeholder text' do
      expect(response.body).to include('Ariel')
    end
  end
end
