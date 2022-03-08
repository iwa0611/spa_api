class ChangeColumnDefaultToContents < ActiveRecord::Migration[6.1]
  def change
    change_column_default :contents, :kawaii, from: nil, to: 3
    change_column_default :contents, :omosiroi, from: nil, to: 3
    change_column_default :contents, :nakeru, from: nil, to: 3
    change_column_default :contents, :atui, from: nil, to: 3
    change_column_default :contents, :sakuga, from: nil, to: 3
  end
end
