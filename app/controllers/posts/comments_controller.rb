# frozen_string_literal: true

module Posts
  class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
      @comment = resource_post.comments.build comment_params
      @comment.user = current_user

      if @comment.save
        redirect_to resource_post, notice: t('controllers.posts.comments.actions.update.notifications.success')
      else
        flash[:alert] = "#{t('controllers.posts.comments.actions.updated.notifications.failure_text')} #{@comment.errors.messages[:content].first}"

        redirect_to resource_post, status: :unprocessable_entity
      end
    end

    private

    def comment_params
      params.required(:post_comment).permit(:content, :parent_id)
    end
  end
end
