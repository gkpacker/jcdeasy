class UsersController < ApplicationController
  def show
    @user = current_user
<<<<<<< HEAD
    @all_companies = Company.where(user: @user).includes(:campaigns)
    @companies = Company.where(user: @user, status: [:active])
    @company = Company.new
    @campaign = Campaign.new
=======
    # @all_companies = Company.where(user: @user).includes(:campaigns)
    @companies = Company.where(user: @user, status: [:active]).includes(:campaigns)
    @campaigns = []
    @companies.each do |company|
      company.campaigns.each do |campaign|
        @campaigns << campaign
      end
    end
>>>>>>> fix index campaings
  end
end
