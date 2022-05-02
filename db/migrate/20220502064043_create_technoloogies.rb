class CreateTechnoloogies < ActiveRecord::Migration[7.0]
  def change
    create_table :technoloogies do |t|
      t.string :name
      t.references :portfolio, null: true, foreign_key: true

      t.timestamps
    end
  end
end
