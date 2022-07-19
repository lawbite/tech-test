class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :lawyers
  validates_length_of :lawyer_ids, maximum: 2
end
