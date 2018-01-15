# frozen_string_literal: true

class MeetingsController < InheritedResources::Base
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_meeting, only: %i[show edit update destroy]
  before_action :is_admin, only: %i[new create edit update destroy]


  def participate
    @meeting = Meeting.find(params[:id])
    if user.client?
      @participant = @meeting << current_user
      @participant.save
    elsif user.seller?
      @exhibitor = @meeting << current_user
      @exhibitor.save
    end
  end

  def index
    @meetings = Meeting.all
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.create(meeting_params)
    if @meeting.save
      redirect_to meetings_path
    else
      render :new
    end
  end

  def show
  #  @exhibitors = User.all.participate
  end

  def edit
  end

  def update
    if @meeting.update(meeting_params)
      redirect_to meetings_path
    else
      render :edit
    end
  end

  def destroy
    @meeting.destroy
    redirect_to meetings_path
  end

  private

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  def meeting_params
    params.require(:meeting).permit(:name, :details, :address, :start_time, :highlight, :user_id)
  end

  def is_admin
    if current_user.admin?
    else
      redirect_to meetings_path
    end
  end
end
