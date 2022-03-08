class AddRatingToContents < ActiveRecord::Migration[6.1]
  def change
    add_column :contents, :kawaii, :integer
    add_column :contents, :omosiroi, :integer
    add_column :contents, :nakeru, :integer
    add_column :contents, :atui, :integer
    add_column :contents, :sakuga, :integer
  end
end
