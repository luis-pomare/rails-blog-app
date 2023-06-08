require 'rails_helper'

describe Like do
  let(:author1) do
    FactoryBot.create(:user, name: 'Ariel', photo: 'http/foto.com',
                             bio: 'bio', post_counter: 3)
  end

  let(:post1) do
    FactoryBot.create(:post, title: 'post_1', author: author1, comments_counter: 0, likes_counter: 0)
  end

  describe 'method:' do
    it 'increment_likes_counter' do
      Like.create(author: author1, post: post1)
      
      expect(post1.likes_counter).to eq(1)
    end
  end
end
