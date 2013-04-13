class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :question_id
      t.string :content
      t.string :type
      t.string :token

      t.timestamps
    end
  end
end
