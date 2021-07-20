class AddTotalToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :total, :integer
  end
end
