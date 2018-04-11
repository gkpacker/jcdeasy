class CompaniesController < ApplicationController
before_action :find_company, only: [:edit, :update, :destroy]

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.user = current_user
    if @company.save
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @company.destroy
    redirect_to user_path(current_user)
  end

  private

  def company_params
    params.require(:company).permit(:name, :cnpj, :street_number, :address1, :address2, :zip_code, :city, :state)
  end

  def find_company
    @company = Company.find(params[:id])
  end
end
