class CreateAuthors < ActiveRecord::Migration[7.1]
  def change
    create_table :authors do |t|
      t.string :name :primary_key
      t.string :dec

      t.timestamps
    end
  end
end
