require 'rails_helper'

describe Comment do
  let(:author1) do
    FactoryBot.create(:user, name: 'Ariel', photo: 'http/foto.com',
                             bio: 'bio', post_counter: 3)
  end

  let(:post1) do
    FactoryBot.create(:post, title: 'post_1', author: author1, comments_counter: 0, likes_counter: 0)
  end

  describe 'method:' do
    it 'increment_comment_counter' do
      Comment.create(author: author1, post: post1, text: 'Hi')

      expect(post1.comments_counter).to eq(1)
    end
  end
end
