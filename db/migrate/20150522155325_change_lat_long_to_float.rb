class ChangeLatLongToFloat < ActiveRecord::Migration
  def up
    execute("ALTER TABLE retailers ALTER COLUMN latitude TYPE float USING (latitude::float)")
    execute("ALTER TABLE retailers ALTER COLUMN longitude TYPE float USING (longitude::float)")
  end

  def down
    execute("ALTER TABLE retailers ALTER COLUMN latitude TYPE varchar USING (latitude::varchar)")
    execute("ALTER TABLE retailers ALTER COLUMN longitude TYPE varchar USING (longitude::varchar)")
  end
end
