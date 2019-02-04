class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :companies
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: true
  validates :phone_number, :cpf, presence: true, uniqueness: true
  validate :check_cpf

  private

  def check_cpf
    errors.add(:cpf, "CPF inválido, digite apenas números") unless CPF.valid?(self.cpf)
  end
end
