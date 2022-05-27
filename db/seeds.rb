unless Lawyer.any?
  FactoryBot.create_list(:lawyer, 10)
end

unless Company.any?
  FactoryBot.create_list(:company, 10)
end
