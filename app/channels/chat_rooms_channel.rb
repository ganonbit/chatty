class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed 
    stream_from "chat_rooms_#{params['chat_room_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is ubsubscribed
  end

  def send message(data)
    current_user.messages.create!(body: data['message'], chat_room_id: data['chat_room_id'])
  end
end