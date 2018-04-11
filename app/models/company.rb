class Company < ApplicationRecord
  enum status: [ :active, :archived ]
  belongs_to :user
  has_many :campaigns

  validates :cnpj, :name, :street_number, :address1, :zip_code, :city, :state, presence: true
  validate :check_cnpj
  validates_uniqueness_of :cnpj, conditions: -> { where(status: [:active]) }

  private

  def check_cnpj
    errors.add(:cnpj, "CNPJ invalido, digite apenas numeros") unless CNPJ.valid?(self.cnpj)
  end
end
