require 'rails_helper'

describe Post do
  let(:author1) do
    FactoryBot.create(:user, name: 'Ariel', photo: 'http/foto.com',
                             bio: 'bio', post_counter: 3)
  end

  describe 'Validation:' do
    it 'title can not be blank' do
      expect(Post.create(title: '', comments_counter: 0, likes_counter: 0,
                         author: author1).valid?).to eq(false)
    end

    it 'title can not have more than 250 characters' do
      expect(Post.create(title: '=Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis bibendum
                                velit ac turpis dignissim malesuada. Donec ac turpis ultricies, volutpat
                                enim vel, tincidunt tortor. Nam sed felis eget mauris dignissim convallis.
                                Quisque feugiat leo et dictum v', comments_counter: 0, likes_counter: 0,
                         author: author1).valid?).to eq(false)
    end

    it 'comments_counter should be positive integer' do
      expect(Post.create(title: 'Inuyasha', comments_counter: 0.7, likes_counter: 100,
                         author: author1).valid?).to eq(false)
    end

    it 'likes_counter should be positive integer' do
      expect(Post.create(title: 'Naruto', comments_counter: 7, likes_counter: -100,
                         author: author1).valid?).to eq(false)
    end
  end

  describe 'method:' do
    before :each do
      @my_post = Post.create(title: 'post_1', author: author1, comments_counter: 0, likes_counter: 0)
    end

    it 'last_comments' do
      comments = FactoryBot.create_list(:comment, 5, author: author1, post: @my_post, text: 'Hello')

      expect(@my_post.last_comments).to eq(comments.sort_by.with_index { |_, i| -i })
    end

    it 'increment_post_counter' do
      author2 = FactoryBot.create(:user, name: 'Author 2', photo: 'http/foto.com', bio: 'bio', post_counter: 0)
      Post.create(title: 'post_2', author: author2, comments_counter: 0, likes_counter: 0)
      
      expect(author2.post_counter).to eq(1)
    end
  end
end
