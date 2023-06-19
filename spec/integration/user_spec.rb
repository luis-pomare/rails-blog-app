require 'rails_helper'
RSpec.describe 'User', type: :system do
  describe 'Users' do
    let!(:user) { User.create(name: 'Ariel', photo: 'https://robohash.org/1', bio: 'bio', post_counter: 0) }
    let!(:user_two) { User.create(name: 'Jose', photo: 'https://robohash.org/2', bio: 'bio', post_counter: 0) }
    let!(:user_three) { User.create(name: 'Mathias', photo: 'https://robohash.org/3', bio: 'bio', post_counter: 0) }
    let!(:post) { Post.create(title: 'Ruby on rails', author: user, comments_counter: 0, likes_counter: 0) }


    describe 'testing page rendering' do
      it 'should render a users names' do
        visit users_path
        expect(page).to have_content('Ariel')
        expect(page).to have_content('Jose')
        expect(page).to have_content('Mathias')
      end

      it 'should render the users profile pictures' do
        visit users_path
        expect(page).to have_css("img[src*='https://robohash.org/1']")
        expect(page).to have_css("img[src*='https://robohash.org/2']")
        expect(page).to have_css("img[src*='https://robohash.org/3']")
      end

      it 'Should show the number of posts each user has written' do
        visit users_path
        expect(page).to have_content('Number of posts: 0')
        expect(page).to have_content('Number of posts: 1')
      end
    end

  end
end
