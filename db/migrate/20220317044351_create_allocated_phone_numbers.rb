class CreateAllocatedPhoneNumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :allocated_phone_numbers do |t|
      t.string :PhoneNumber

      t.timestamps
    end
  end
end
