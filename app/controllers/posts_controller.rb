# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, except: :show

  def show
    @post = find_post
    @user_like = @post.find_like(current_user) if current_user

    @comments = @post.comments.includes(:user).arrange
    @new_comment = PostComment.new
  end

  def new
    @post = Post.new
  end

  def edit
    @post = find_post
  end

  def create
    @post = current_user.posts.build post_params

    if @post.save
      redirect_to root_path, notice: t('controllers.posts.actions.create.notifications.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @post = find_post

    if @post.update post_params
      redirect_to post_path, notice: t('controllers.posts.actions.update.notifications.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    post = find_post

    if post.delete
      redirect_to my_posts_path, notice: t('controllers.posts.actions.destroy.notifications.success')
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def find_post
    Post.find params[:id]
  end

  def post_params
    params.required(:post).permit(:title, :body, :category_id)
  end
end
