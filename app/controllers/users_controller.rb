class UsersController < ApplicationController
  def show
    @user = current_user
    @companies = Company.where(user: @user, status: [:active])
    @campaigns = Campaign.where(company: @companies)
    if @campaigns == []
      @campaigns_qty = 1
    else
      @campaigns_qty = @campaigns.count
    end

    if @user.companies == []
      @companies_qty = 1
    else
      @companies_qty = @user.companies.count
    end
  end
end
