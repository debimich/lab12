class AddForeignKeyToValues < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :values, :Users
    remove_foreign_key :values, :Definitions
    add_foreign_key :values, :Definitions, on_delete: :cascade
    add_foreign_key :values, :Users, on_delete: :cascade
  end
end
