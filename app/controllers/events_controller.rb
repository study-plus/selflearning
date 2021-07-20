class EventsController < ApplicationController

    def new
        @event = Event.new
    end

    def show
        @event = Event.find(params[:id])
        @user = User.find(params[:user_id])
    end

    def create
        event = Event.new(event_params)
        event.user_id = current_user.id
        event.save!
        @events = Event.where(user_id: current_user.id)
        # Event.create(event_params)
        # redirect_to events_path
    end

    def destroy
        @user = User.find(params[:id])
        @event = Event.find(params[:id])
        @event.destroy
        redirect_to user_path(@user), notice: "削除しました"
    end

    def edit
        @event = Event.find(params[:id])
    end

    def update
        @user = User.find(params[:user_id])
        @event = Event.find(params[:id])
        if @event.update(event_params)
            redirect_to user_path(@user), notice: "編集しました"
        else
            render 'edit'
        end
    end

    private
    def event_params
        params.require(:event).permit(:title, :content, :start, :end, :user_id)
    end
end
