class Lawyer < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  belongs_to :company, required: false

  scope :can_be_associated_with, -> (company) { where(company_id: [nil, company.id]) }
end
