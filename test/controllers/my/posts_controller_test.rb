# frozen_string_literal: true

require 'test_helper'

class My::PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'should redirect to sign in if user not logged in' do
    test_redirect_to_sign_in { get profile_url }
  end

  test 'should get index' do
    sign_in users(:current_user)

    get my_posts_url
    assert_response :success
  end
end
