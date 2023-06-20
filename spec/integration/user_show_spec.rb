require 'rails_helper'
RSpec.describe 'User', type: :system do
  describe 'show' do
    let!(:user) { User.create(name: 'Ariel', photo: 'https://robohash.org/1', bio: 'bio', post_counter: 0) }
    let!(:post1) do
      Post.create(title: 'Ruby on rails', text: 'Hello world', author: user, comments_counter: 0, likes_counter: 0)
    end
    let!(:post2) do
      Post.create(title: 'React', text: 'Hello world', author: user, comments_counter: 0, likes_counter: 0)
    end
    let!(:post3) do
      Post.create(title: 'JavaScript', text: 'Hello world', author: user, comments_counter: 0, likes_counter: 0)
    end

    describe 'testing page rendering' do
      it 'should render the user name' do
        visit user_path(user)
        expect(page).to have_content('Ariel')
      end

      it 'should render the user profile picture' do
        visit user_path(user)
        expect(page).to have_css("img[src*='https://robohash.org/1']")
      end

      it 'Should show the number of posts' do
        visit user_path(user)
        expect(page).to have_content('Number of posts: 3')
      end

      it 'should render the bio' do
        visit user_path(user)
        expect(page).to have_content('Bio')
      end

      it 'should render the bio' do
        visit user_path(user)
        expect(page).to have_content('Ruby on rails')
        expect(page).to have_content('React')
        expect(page).to have_content('JavaScript')
      end
    end

    describe 'testing page links' do
      it 'should redirect to post#index' do
        visit user_path(user)
        expect(page).to have_link('See all posts')
      end

      it 'should redirect to post#show' do
        visit user_path(user)
        first(:link, 'Show this post').click
        expect(page).to have_current_path(user_post_path(user, post3))
      end

      it 'should redirect to post#index' do
        visit user_path(user)
        click_link 'See all posts'
        expect(page).to have_current_path(user_posts_path(user))
      end
    end
  end
end
