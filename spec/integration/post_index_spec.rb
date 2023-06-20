require 'rails_helper'

RSpec.describe 'post#index integration test', type: :system do
  let!(:user) { User.create(name: 'Ariel', photo: 'https://robohash.org/1', bio: 'bio', post_counter: 0) }
  let!(:post1) do
    Post.create(title: 'Ruby on rails', text: 'Hello world', author: user, comments_counter: 0, likes_counter: 0)
  end
  let!(:post2) do
    Post.create(title: 'Ruby on rails', text: 'Hello world', author: user, comments_counter: 0, likes_counter: 0)
  end
  let!(:post3) do
    Post.create(title: 'Ruby on rails', text: 'Hello world', author: user, comments_counter: 0, likes_counter: 0)
  end
  let!(:post4) do
    Post.create(title: 'Ruby on rails', text: 'Hello world', author: user, comments_counter: 0, likes_counter: 0)
  end
  let!(:comment_one) { Comment.create(text: 'Nice', author: user, post: post1) }

  it 'should render the user profile picture' do
    visit user_posts_path(user)
    expect(page).to have_css("img[src*='https://robohash.org/1']")
  end

  it 'should render the author of the posts' do
    visit user_posts_path(user)
    expect(page).to have_content(user.name)
  end

  it 'should render the number of posts of a user' do
    visit user_posts_path(user)
    expect(page).to have_content("Number of posts: #{user.post_counter}")
  end
  it 'should the post title' do
    visit user_posts_path(user)
    expect(page).to have_content(post1.title)
  end
  it 'should render some of the content of the post text' do
    visit user_posts_path(user)
    expect(page).to have_content(post1.text)
  end

  it 'Should render the first comments' do
    visit user_posts_path(user)

    expect(page).to have_content(comment_one.text)
  end

  it 'should render the number of comments of the post' do
    visit user_posts_path(user)
    expect(page).to have_content("comments: #{post1.comments_counter}")
  end
  it 'should render the number of likes of the post' do
    visit user_posts_path(user)
    expect(page).to have_content("likes: #{post1.likes_counter}")
  end

  it 'should have the pagination section if there is more than 3 posts' do
    visit user_posts_path(user)

    expect(page).to have_selector('#pagination')
  end

  context 'to click in a post' do
    it 'should redirect to the post detail' do
      visit user_posts_path(user)
      first(:link, 'Show this post').click
      expect(page).to have_current_path(user_post_path(user, post1))
    end
  end
end
