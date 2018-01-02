# frozen_string_literal: true

class MeetingsController < InheritedResources::Base
  before_action :authenticate_user!, except: %i[index show]

  def index
    @meetings = Meeting.all
  end

  def show; end

  private

  def meeting_params
    params.require(:meeting).permit(:name, :start_time)
  end
end
