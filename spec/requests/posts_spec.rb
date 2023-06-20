require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET user_posts_path' do
    let!(:user) { User.create(name: 'Ariel', photo: 'http/foto.com', bio: 'bio', post_counter: 3) }
    before :each do
      get user_posts_path(user)
    end

    it 'should have a http status of 200(correct status)' do
      expect(response).to have_http_status(200)
    end

    it 'should render post/index view' do
      expect(response).to render_template('posts/index')
    end

    it 'should include the placeholder text' do
      expect(response.body).to include('Ariel')
    end
  end
end
