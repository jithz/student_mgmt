class AddLocalAndPermanentAddressToStudents < ActiveRecord::Migration[6.1]
  def change
  	add_column :students, :local_address, :text
  	add_column :students, :permanent_address, :text
  end
end
