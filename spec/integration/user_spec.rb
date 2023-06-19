require 'rails_helper'
RSpec.describe 'User', type: :system do
  describe 'It should render users' do
    let!(:user) { User.create(name: 'Ariel', photo: 'https://robohash.org/2', bio: 'bio', post_counter: 3) }
    let!(:user_two) { User.create(name: 'Jose', photo: 'https://robohash.org/2', bio: 'bio', post_counter: 3) }
    let!(:user_three) { User.create(name: 'Mathias', photo: 'https://robohash.org/2', bio: 'bio', post_counter: 3) }
    it 'should render a user called Ariel' do
      visit users_path
      expect(page).to have_content('Ariel')
    end
    it 'should render a user called Ariel' do
      visit users_path
      expect(page).to have_css("img[src*='https://robohash.org/2']")
    end
  end
end
