class ChangeZipColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :restaurants, :zip, :string
  end
end
