class AddColumnsToContents < ActiveRecord::Migration[6.1]
  def change
    add_column :contents, :infoJSON, :text
    add_column :contents, :title_id, :integer
  end
end
