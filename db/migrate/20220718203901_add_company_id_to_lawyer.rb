class AddCompanyIdToLawyer < ActiveRecord::Migration[7.0]
  def change
    add_column :lawyers, :company_id, :bigint
    add_index :lawyers, :company_id
    add_foreign_key "lawyers", "companies"
  end
end
