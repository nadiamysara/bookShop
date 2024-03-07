class ChangeBookUserTable < ActiveRecord::Migration[7.1]
  def change

    reversible do |dir|
      change_table :book_users do |t|
        dir.up do
          t.change :due_date, :datetime, default: "2024-01-01 00:00:00"
          t.column :status, :string, default: "not returned"
        end
        dir.down do
          t.change :due_date, :date
          t.remove :status, :string, default: "not returned"
        end
      end
    end
  end
end
