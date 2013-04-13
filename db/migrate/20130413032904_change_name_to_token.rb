class ChangeNameToToken < ActiveRecord::Migration
  def up
    rename_column :surveys, :name, :token
  end

  def down
  end
end
