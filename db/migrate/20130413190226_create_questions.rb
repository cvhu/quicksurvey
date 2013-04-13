class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :token
      t.string :type
      t.integer :survey_id

      t.timestamps
    end
  end
end
