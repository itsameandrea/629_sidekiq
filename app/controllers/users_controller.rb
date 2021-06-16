class UsersController < ApplicationController
  def create
    @user = User.create(user_params)
  end
end
