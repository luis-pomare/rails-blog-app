require 'swagger_helper'

RSpec.describe 'api/api', type: :request do
  describe '/api/users/:user_id/posts' do 
    let!(:user) { User.create(name: 'Ariel', photo: 'http/foto.com', bio: 'bio', post_counter: 3, email: 'mail@mail.com', password: 'password') }
    it 'should have a successful status' do 
      get "/api/users/#{user.id}/posts"
      expect(response.status).to be(200)
    end
  end
  describe '/api/posts/:post_id/comments' do 
    let!(:user) { User.create(name: 'Ariel', photo: 'http/foto.com', bio: 'bio', post_counter: 3, email: 'mail@mail.com', password: 'password') }
    let!(:post) { Post.create(title: 'Ruby on rails', author: user, comments_counter: 0, likes_counter: 0) }
    let!(:comment_one) { Comment.create(text: 'Nice', author: user, post: post) }
    it 'should have a successful status' do 
      get "/api/posts/#{post.id}/comments"
      expect(response.status).to be(200)
    end
  end
end
