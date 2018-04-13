class UsersController < ApplicationController
  def show
    @user = current_user
    @all_companies = Company.where(user: @user).includes(:campaigns)
    @companies = Company.where(user: @user, status: [:active])
    @company = Company.new
    @campaign = Campaign.new
  end
end
