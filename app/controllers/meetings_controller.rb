# frozen_string_literal: true

class MeetingsController < InheritedResources::Base
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_meeting, only: %i[show edit update destroy]
  before_action :is_admin, only: %i[new create edit update destroy]


#def participate
# meeting = Meeting.find(params[:meeting_id])
# current_user.meetings << meeting
#redirect_to meetings_path
#end


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


  def participate
   meeting = Meeting.find(params[:meeting_id])
   current_user.meetings << meeting
   redirect_to meetings_path, alert: "Votre demande est enregistée pour cet évenement. Nous reviendrons rapidemant vers vous."
 end



 private

 def set_meeting
  @meeting = Meeting.find(params[:id])
end

def meeting_params
  params.require(:meeting).permit(:name, :details, :address, :start_time, :highlight, :user_id, :photo)
end

def is_admin
  if current_user.admin?
  else
    redirect_to meetings_path
  end
end

end
