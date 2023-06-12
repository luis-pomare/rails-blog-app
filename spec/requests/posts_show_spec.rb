require 'rails_helper'

RSpec.describe 'Posts/show', type: :request do
  describe 'GET user_post_path' do
    let!(:user) { User.create(name: 'Ariel', post_counter: 0) }
    let!(:post) { Post.create(author: user, title: 'Microverse', comments_counter: 0, likes_counter: 0) }

    before :each do
      get user_post_path(:user, :post)
    end

    it 'should have a http status of 200(correct status)' do
      expect(response).to have_http_status(200)
    end

    it 'should render posts/show view' do
      expect(response).to render_template('posts/show')
    end

    it 'should include the placeholder text' do
      expect(response.body).to include('Post show')
    end
  end
end
