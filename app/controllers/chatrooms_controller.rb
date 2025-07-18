class ChatroomsController < ApplicationController
  before_action :authorized
  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record

  def create
  @chatroom = Chatroom.new(chatroom_params)
    @chatroom.user = current_user
    @chatroom.save!

    render json: {
      chatroom: ChatroomSerializer.new(@chatroom),
      created_by: UserSerializer.new(@chatroom.user)
    },
     status: :created
  end

  def show
    @chatroom= Chatroom.find(params[:id])

    render json: {
      chatroom: ChatroomSerializer.new(@chatroom),
      created_by: UserSerializer.new(@chatroom.user)
    }
  end

  private
  def handle_invalid_record(e)
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  def chatroom_params
    params.permit(:name)
  end
end
