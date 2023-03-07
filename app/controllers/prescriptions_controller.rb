class PrescriptionsController < ApplicationController
  def index
    @prescriptions = Prescription.all
  end

  def new
    @prescription = Prescription.new
  end

  def create
    @prescription = Prescription.new(prescription_params)
  end

  def edit
    @prescription = Prescription.find(params[:id])
  end

  def update
    @prescription = Prescription.find(params[:id])

    if @prescription.update(prescription_params)
      redirect_to prescription_path(@prescription)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # def confirm

  # end

  def destroy
    @ride = Ride.find(params[:id])
    authorize @ride
    @ride.destroy
    redirect_to root_path, notice: "Ride successfully deleted.", status: :see_other
  end

  private

  def prescription_params
    params.require(:prescription).permit(:start_date, :end_date, :time, :comment)
  end

end
