class CreateDefinitions < ActiveRecord::Migration[7.1]
  def change
    create_table :definitions do |t|
      t.references :User, null: false, foreign_key: true
      t.string :def

      t.timestamps
    end
  end
end
