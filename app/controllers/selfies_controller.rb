class SelfiesController < ApplicationController
  def index
    @selfies = current_user.diary.sefies
  end

  def create
    @diary = Diary.find(params[:diary_id])
  end
end
