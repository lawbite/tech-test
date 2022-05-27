FactoryBot.define do
  factory :lawyer do
    sequence(:name) { |n| "Lawyer #{n}" }
    sequence(:email) { |n| "lawyer_#{n}@example.com" }
  end
end
