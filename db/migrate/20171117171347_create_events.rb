class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :event_title
      t.datetime :event_time
      t.text :description
      t.string :address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
