class CreateCompanyLawyers < ActiveRecord::Migration[7.0]
  def change
    create_table :company_lawyers do |t|
      t.references :company, null: false, foreign_key: true
      t.references :lawyer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
