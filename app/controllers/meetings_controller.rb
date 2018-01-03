# frozen_string_literal: true

class MeetingsController < InheritedResources::Base
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_meeting, only: %i[show edit update destroy]
  before_action :is_admin, only: %i[new create edit update destroy]

  def index
    @meetings = Meeting.all
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = current_user.meetings.create(meeting_params)
    if @meeting.save
      redirect_to meetings_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @meeting.update(params[:meeting])
    redirect_to_meeting_path
  end

  def destroy
    @meeting.destroy
    redirect_to meetings_path
  end

  private

  def set_meeting
    @meeting = meeting.find(params [:id])
  end

  def meeting_params
    params.require(:meeting).permit(:name, :start_time, :user_id)
  end

  def is_admin
    if current_user.admin?
    else
      redirect_to meetings_path
    end
  end

end
