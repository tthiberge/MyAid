class DiariesController < ApplicationController
  def index
    @diaries = current_user.diaries
  end

  def show
    @diary = Diary.find(params[:id])
    @selfy = Selfy.new
  end

  def new

  end

  def create

  end

  def update
    
    @diary = Diary.find(params[:id])
    @diary.update(pain_scale: params[:diary][:pain_scale], motivation_scale: params[:diary][:motivation_scale], daily_feeling: params[:diary][:daily_feeling])
    if params[:diary][:photo] && @diary.selfy.nil?
      @selfy = Selfy.new
      @selfy.diary = @diary
      @selfy.user = current_user
      @selfy.photo.attach(io: params[:diary][:photo], filename: "selfy.png", content_type: "image/png")
      @selfy.save
    elsif params[:diary][:photo] && @diary.selfy
      @diary.selfy.photo.purge
      @diary.selfy.destroy
      @selfy = Selfy.new
      @selfy.diary = @diary
      @selfy.user = current_user
      @selfy.photo.attach(io: params[:diary][:photo], filename: "selfy.png", content_type: "image/png")
      @selfy.save
    end
    redirect_to diaries_path
  end

  private

  def diary_params
    params.require(:diary).permit(:photo, :pain_scale, :motivation_scale, :daily_feeling)
  end
end
