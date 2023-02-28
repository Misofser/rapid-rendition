class AddForeignKeyToSketch < ActiveRecord::Migration[7.0]
  def change
    add_reference :sketches, :user, null: false, foreign_key: true
    add_foreign_key :sketches, :users
  end
end
