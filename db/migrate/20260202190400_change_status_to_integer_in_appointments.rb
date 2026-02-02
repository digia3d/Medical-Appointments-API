class ChangeStatusToIntegerInAppointments < ActiveRecord::Migration[7.0]
  def up
    # Map string statuses to integers for enum, but do it directly in SQL
    execute <<-SQL.squish
      UPDATE appointments SET status =
        CASE status
          WHEN 'scheduled' THEN 0
          WHEN 'completed' THEN 1
          WHEN 'canceled' THEN 2
        END;
    SQL

    # Now change column type from string to integer
    change_column :appointments, :status, :integer, using: "status::integer"
  end

  def down
    # Revert integer statuses back to string
    execute <<-SQL.squish
      UPDATE appointments SET status =
        CASE status
          WHEN 0 THEN 'scheduled'
          WHEN 1 THEN 'completed'
          WHEN 2 THEN 'canceled'
        END;
    SQL

    # Change column type back to string
    change_column :appointments, :status, :string
  end
end
