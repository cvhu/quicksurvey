class ChangeTypeToKind < ActiveRecord::Migration
  def up
    rename_column :questions, :type, :kind
    rename_column :options, :type, :kind
    rename_column :responses, :type, :kind
  end

  def down
  end
end
