class AddFavoriteToContents < ActiveRecord::Migration[6.1]
  def change
    add_column :contents, :favorite, :boolean, default: false, null: false
  end
end
