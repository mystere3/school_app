class AddPaidInFullToStudents < ActiveRecord::Migration
  def change
    add_column :students, :paid_in_full, :boolean, default: false
  end
end
