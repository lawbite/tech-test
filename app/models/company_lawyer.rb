class CompanyLawyer < ApplicationRecord
  belongs_to :company
  belongs_to :lawyer
end
