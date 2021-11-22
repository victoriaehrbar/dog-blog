class CreateDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :dogs do |t|
      t.string :dog_name
      t.string :mood
      t.integer :weight
      t.belongs_to :breed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
