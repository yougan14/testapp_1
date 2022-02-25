class CreatePersonalinfos < ActiveRecord::Migration[6.1]
  def change
    create_table :personalinfos do |t|
      t.string :name
      t.string :date_of_birth
      t.string :gender
      t.string :blood_group
      t.string :email
      t.string :mobile_number
      t.string :address
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
