class CreateChatroomSerializers < ActiveRecord::Migration[8.0]
  def change
    create_table :chatroom_serializers do |t|
      t.timestamps
    end
  end
end
