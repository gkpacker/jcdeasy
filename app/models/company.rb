class Company < ApplicationRecord
  belongs_to :user
<<<<<<< HEAD

  validates :cnpj, :name, :street_number, :address1, :zip_code, :city, :state, presence: true
  validate :check_cnpj

  private

  def check_cnpj
    errors.add(:cnpj, "CNPJ invalido, digite apenas numeros") unless CNPJ.valid?(self.cnpj)
  end

=======
  has_many :campaigns
>>>>>>> master
end
