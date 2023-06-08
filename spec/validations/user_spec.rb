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
end
