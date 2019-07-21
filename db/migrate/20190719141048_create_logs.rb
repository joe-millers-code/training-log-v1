class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.string :title
      t.string :date
      t.string :session_type
      t.string :duration
      t.string :intensity
      t.string :description

      t.timestamps
    end
  end
end
