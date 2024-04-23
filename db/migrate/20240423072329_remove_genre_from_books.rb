class RemoveGenreFromBooks < ActiveRecord::Migration[7.1]
  def change
    reversible do |dir|
      dir.up do
        change_table :books do |t|
          t.remove :genre
        end
      end
      dir.down do
        change_table :books do |t|
          t.column :genre, :string
        end
      end
    end
  end
end
