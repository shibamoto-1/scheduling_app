class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      flash[:info] = "作成しました！"
      redirect_to schedules_path
    else
      flash.now[:danger] = "失敗しました"
      render :new
    end
  end
  
  def show
  end 

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def schedule_params
    params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo, :updated_at)
  end
end
