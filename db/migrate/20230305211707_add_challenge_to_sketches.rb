class AddChallengeToSketches < ActiveRecord::Migration[7.0]
  def change
    add_reference :sketches, :challenge, null: false, foreign_key: true
  end
end
