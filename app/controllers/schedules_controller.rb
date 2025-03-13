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
    @schedule = Schedule.find(params[:id])
  end 

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      flash[:info] = "更新しました！"
      redirect_to edit_schedule_path(@schedule.id)
    else
      flash.now[:danger] = "更新できませんでした"
      render :edit
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy!
    redirect_to schedules_path, status: :see_other
  end

  private
  def schedule_params
    params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo, :updated_at)
  end
end
