class DropCompanyLawyers < ActiveRecord::Migration[7.0]
  def change
    drop_table :company_lawyers
  end
end
