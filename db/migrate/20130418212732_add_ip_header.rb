class AddIpHeader < ActiveRecord::Migration
  def up
    add_column :responses, :header, :string
    add_column :responses, :ip, :string
  end

  def down
  end
end
