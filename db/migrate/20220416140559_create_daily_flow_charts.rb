class CreateDailyFlowCharts < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_flow_charts do |t|
      t.date :date
      t.boolean :bloating, default: false
      t.boolean :cramps, default: false
      t.text :emotions
      t.integer :flow_status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
