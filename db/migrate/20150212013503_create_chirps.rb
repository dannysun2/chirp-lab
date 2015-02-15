class CreateChirps < ActiveRecord::Migration
  def change
    create_table :chirps do |t|
      t.string :message
      t.string :user_id

      t.timestamps null: false
    end
  end
end
