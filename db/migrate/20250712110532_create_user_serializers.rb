class CreateUserSerializers < ActiveRecord::Migration[8.0]
  def change
    create_table :user_serializers do |t|
      t.string :username

      t.timestamps
    end
  end
end
