class ChangeColumnFromBookUser < ActiveRecord::Migration[7.1]
  def change
    reversible do |dir|
      change_table :book_users do |t|
        dir.up do
          t.change :due_date, :datetime
          t.change :return_date, :datetime
          t.remove :date
        end
        dir.down do
          t.change :due_date, :string
          t.change :return_date, :date
          t.column :date, :string
        end
      end
    end
  end
end
