class PrescriptionsController < ApplicationController
  def index
    @prescriptions = Prescription.all
    @user = current_user
  end

  def new
    @prescription = Prescription.new
  end

  def create
    @user = current_user
    @treatment = Treatment.find_by_name("paracetamol")
    @prescription = Prescription.new(prescription_params)
    @prescription.treatment = @treatment
    # Il ne semble pas l'enregistrer donc mettre if save et voir pourquoi ça ne marche pas
    @prescription.save
    redirect_to pills_path
    # /!\ Attention, rediriger vers le path en fonction de la category du treatment
  end

  def edit
    @prescription = Prescription.find(params[:id])
  end

  def update
    @user = current_user
    @prescription = Prescription.find(params[:id])

    if @prescription.update(prescription_params)
      redirect_to prescription_path(@prescription)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def confirm
    @prescription = Prescription.find(params[:id])

#  update l'instance de take_time
# taken_date cf edit

  end

  def destroy
    @prescription = Prescription.find(params[:id])
    @prescription.destroy
    redirect_to pills_path, notice: "Prescription successfully deleted.", status: :see_other
  end

  private

  def prescription_params
    params.require(:prescription).permit(:start_date, :end_date, :comment, :todo_hours, :todo_minutes, :taken_date)
  end

end
