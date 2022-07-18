FactoryBot.define do
  factory :company do
    sequence(:name) { |n| "Company #{n}" }

    trait :with_lawyer do
      lawyers { [create(:lawyer)] }
    end
  end
end
