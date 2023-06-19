require 'rails_helper'
RSpec.describe 'User', type: :system do
  describe 'show' do
    let!(:user) { User.create(name: 'Ariel', photo: 'https://robohash.org/1', bio: 'bio', post_counter: 0) }
    let!(:post) { Post.create(title: 'Ruby on rails', text: 'Hello world', author: user, comments_counter: 0, likes_counter: 0) }


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
        expect(page).to have_content('Number of posts: 1')
      end
    end
  end
end
