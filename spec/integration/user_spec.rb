require 'rails_helper'
RSpec.describe 'User', type: :system do
  describe 'Users' do
    let!(:user) { User.create(name: 'Ariel', photo: 'https://robohash.org/1', bio: 'bio', post_counter: 3) }
    let!(:user_two) { User.create(name: 'Jose', photo: 'https://robohash.org/2', bio: 'bio', post_counter: 3) }
    let!(:user_three) { User.create(name: 'Mathias', photo: 'https://robohash.org/3', bio: 'bio', post_counter: 3) }
    
    describe 'testing page rendering' do
      it 'should render a users names' do
        visit users_path
        expect(page).to have_content('Ariel')
        expect(page).to have_content('Jose')
        expect(page).to have_content('Mathias')
      end

      it 'should render a user called Ariel' do
        visit users_path
        expect(page).to have_css("img[src*='https://robohash.org/1']")
        expect(page).to have_css("img[src*='https://robohash.org/2']")
        expect(page).to have_css("img[src*='https://robohash.org/3']")
      end
    end

  end
end
