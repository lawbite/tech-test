class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :company_lawyers
  has_many :lawyers, through: :company_lawyers
end
