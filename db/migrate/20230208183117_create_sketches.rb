class CreateSketches < ActiveRecord::Migration[7.0]
  def change
    create_table :sketches do |t|
      t.string :image_url
      t.datetime :uploaded_at

      t.timestamps
    end
  end
end
