class UsersController < ApplicationController
  def show
    @user = current_user
    @all_companies = Company.where(user: @user)
    @companies = Company.where(user: @user, status: [:active])
  end
end
