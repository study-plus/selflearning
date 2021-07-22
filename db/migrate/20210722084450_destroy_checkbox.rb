class DestroyCheckbox < ActiveRecord::Migration[6.1]
  def change
    drop_table :checkboxes
  end
end
