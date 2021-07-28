class UsersController < ApplicationController
    before_action :authenticate_user!, :only => [:show]
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
        @currentUserEntry = Entry.where(user_id: current_user.id)
        @userEntry = Entry.where(user_id: @user.id)
        if @user.id == current_user.id
        else
            @currentUserEntry.each do |cu|
                @userEntry.each do |u|
                    if cu.room_id == u.room_id then
                        @isRoom = true
                        @roomId = u.room_id
                    end
                end
            end
            if @isRoom
            else
                @room = Room.new
                @entry = Entry.new
            end
        end

        @events = Event.where(user_id: @user.id)
        @event = Event.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        user = User.find(params[:id])
        if user.update(user_params)
            redirect_to user_path(user.id)
        else
            redirect_to edit_user_resistration
        end
    end

    private
    def user_params
        params.require(:user).permit(:name,:profile)
    end
end
