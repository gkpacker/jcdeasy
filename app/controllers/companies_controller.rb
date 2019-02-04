class CompaniesController < ApplicationController
  before_action :find_company, only: [:show, :edit, :update, :destroy]

  def show; end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.user = current_user
    if @company.save
      sweetalert("  ", "Empresa criada com sucesso", opts = { icon: 'success', button: false, timer: 1400 } )
      redirect_to stored_location_for(:user) || users_path
    else
      sweetalert("  ", "Erro ao criar empresa", opts = { icon: 'error', button: true } )
      redirect_to request.referer
    end
  end

  def edit; end

  def update
    if @company.update(company_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @company.archived!
  end

  private

  def company_params
    params
      .require(:company)
      .permit(
        :name,
        :cnpj,
        :street_number,
        :address1,
        :address2,
        :zip_code,
        :city,
        :state
      )
  end

  def find_company
    @company = Company.find(params[:id])
  end
end
