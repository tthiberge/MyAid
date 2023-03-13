class DiariesController < ApplicationController
  def index
  end

  def show
    @diary = Diary.find(params[:id])
    @selfy = Selfy.new
  end

end
