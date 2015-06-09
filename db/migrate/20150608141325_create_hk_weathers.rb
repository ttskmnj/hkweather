class CreateHkWeathers < ActiveRecord::Migration
  def change
    create_table :hk_weathers do |t|
      t.date :date
	  t.decimal :temp_day
	  t.decimal :temp_min
	  t.decimal :temp_max
	  t.decimal :temp_night
	  t.decimal :temp_eve
	  t.decimal :temp_morn
	  t.decimal :pressure
	  t.integer :humidity
	  t.string :weather_description
	  t.string :weather_icon
	  t.decimal :wind_speed
	  t.integer :wind_deg
	  t.integer :clouds
	  t.timestamps null: false
    end
  end
end
