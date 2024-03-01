class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title,    null:false,default:""
      t.string :genre
      t.integer :year
      t.text :desc

      t.timestamps
    end
  end
end
