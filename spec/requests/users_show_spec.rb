require 'rails_helper'

RSpec.describe 'Users/show', type: :request do
  describe 'GET /users/:user_id' do
    let!(:user) { User.create!(name: 'Ariel', post_counter: 0) }

    it 'should have a http status of 200(correct status)' do
      get '/users/1'
      expect(response).to have_http_status(200)
    end

    # it 'should render users/show view' do
    #   expect(response).to render_template('users/show')
    # end

    # it 'should include the placeholder text' do
    #   expect(response.body).to include('Bio')
    # end
  end
end
