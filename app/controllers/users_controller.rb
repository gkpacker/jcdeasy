class UsersController < ApplicationController
  def show
    @user = current_user
    @all_companies = Company.where(user: @user).includes(:campaigns)
    @companies = Company.where(user: @user, status: [:active]).includes(:campaigns)
    @campaigns = []
    Company.where(user: @user).includes(:campaigns).each do |company|
      company.campaigns.each do |campaign|
        @campaigns << campaign if campaign.company.active? || campaign.paid
      end
    end
    @company = Company.new
    @campaign = Campaign.new
  end
end
