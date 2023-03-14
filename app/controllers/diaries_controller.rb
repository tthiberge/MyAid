class DiariesController < ApplicationController
  def index

  end

  def show
    @diary = Diary.find(params[:id])
    @selfy = Selfy.new
  end

<<<<<<< HEAD
=======
  def new

  end

  def create

  end

  def update
    raise
  end
>>>>>>> master
end
