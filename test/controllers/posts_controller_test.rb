# frozen_string_literal: true

require 'test_helper'

module PostsControllerTest
  class RedirectIfAccessDenied < ActionDispatch::IntegrationTest
    setup do
      @post = posts :one
    end

    test 'new should redirect to sign in' do
      test_redirect_to_sign_in { get new_post_url }
    end

    test 'create should redirect to sign in' do
      test_redirect_to_sign_in { post posts_url }
    end

    test 'edit should redirect to sign in' do
      test_redirect_to_sign_in { get edit_post_url(@post) }
    end

    test 'update should redirect to sign in' do
      test_redirect_to_sign_in { patch post_url(@post) }
    end
  end

  class Actions < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      @current_user = users :current_user
      sign_in @current_user

      @post = posts :one

      @params = {
        title: Faker::Lorem.sentence,
        body: Faker::Lorem.characters(number: 100),
        category_id: categories(:one).id
      }
      @invalid_params = {
        title: nil,
        body: nil,
        category_id: nil
      }
    end

    test 'should get new' do
      get new_post_url
      assert_response :success
    end

    test 'should create post' do
      post posts_url, params: { post: @params }

      post = Post.find_by @params.merge({ creator: @current_user })

      assert { post }
      assert_redirected_to root_url
    end

    test 'should not create post due to validation' do
      post posts_url, params: { post: @invalid_params }

      post = Post.find_by @invalid_params

      assert { post.nil? }
      assert_response :unprocessable_entity
    end

    test 'should show post' do
      get post_url(@post)
      assert_response :success
    end

    test 'should get edit' do
      get edit_post_url(@post)
      assert_response :success
    end

    test 'should update post' do
      patch post_url(@post), params: { post: @params }

      assert_redirected_to post_url(@post)

      @post.reload
      @params.each do |param|
        key = param.first
        value = param.second

        assert_equal value, @post[key]
      end
    end

    test 'should not update post due to validation' do
      patch post_url(@post), params: { post: @invalid_params }

      assert_response :unprocessable_entity
    end
  end
end
