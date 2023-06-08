require 'rails_helper'

describe User do
  describe 'validation:' do
    it 'name can not be blank' do
      expect(User.create(name: '', photo: 'http/foto.com', bio: 'bio', post_counter: 3).valid?).to eq(false)
    end

    it 'post_counter must be an integer greater than or equal to zero' do
      expect(User.create(name: 'Ariel', photo: 'http/foto.com', bio: 'bio', post_counter: -3).valid?).to eq(false)
    end
  end

  describe 'method:' do
    it 'last_post' do
      user = User.create(name: 'Ariel', photo: 'http/foto.com', bio: 'bio', post_counter: 3)
      post1 = FactoryBot.create(:post, title: 'post_1', author: user, comments_counter: 0, likes_counter: 0)
      post2 = FactoryBot.create(:post, title: 'post_2', author: user, comments_counter: 0, likes_counter: 0)
      post3 = FactoryBot.create(:post, title: 'post_3', author: user, comments_counter: 0, likes_counter: 0)

      expect(user.last_posts).to eq([post3, post2, post1])
    end
  end
end
