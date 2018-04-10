class UsersController < ApplicationController
  def show
    @user = current_user
    @campaigns = Campaign.where(company: @user.companies)
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
