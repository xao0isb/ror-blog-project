# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: :show

  def show; end
end
