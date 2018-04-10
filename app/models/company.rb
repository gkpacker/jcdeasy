class Company < ApplicationRecord
  belongs_to :user

  validates :cnpj, :name, :street_number, :address1, :zip_code, :city, :state, presence: true
  validate :check_cnpj

  private

  def check_cnpj
    errors.add(:cnpj, "CNPJ invalido, digite apenas numeros") unless CNPJ.valid?(self.cnpj)
  end

end
