class CreateValues < ActiveRecord::Migration[7.1]
  def change
    create_table :values do |t|
      t.references :User, null: false, foreign_key: true
      t.references :Definition, null: false, foreign_key: true
      t.string :val

      t.timestamps
    end
  end
end
