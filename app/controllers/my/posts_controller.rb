# frozen_string_literal: true

class My::PostsController < ApplicationController
  before_action :authenticate_user!, only: :show

  def show
    @posts = current_user.posts
  end
end
