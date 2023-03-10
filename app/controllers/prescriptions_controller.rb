class PrescriptionsController < ApplicationController
  def index
    @prescriptions = Prescription.all
    @user = current_user
  end

  def new
    @prescription = Prescription.new
  end

  def create
    @prescription = Prescription.new(prescription_params)
    @user = current_user
    @prescription.user = @user

    # ↓↓ Il faut faire des params[][] car il y a un hash dans un hash ↓↓
    @treatment = Treatment.find(params["prescription"]["treatment_id"].to_i)
    @prescription.treatment = @treatment
    @prescription.day_half = params["prescription"]["day_half"].to_s
    @prescription.todo_hours = params["prescription"]["time"].split(":").first.to_i
    @prescription.todo_minutes = params["prescription"]["time"].split(":").last.to_i
    @prescription.taken_date = Date.new(1900, 01, 01) # Garantir que je n'interfère pas avec les prises après 2000

    raise
    if @prescription.save
      # /!\ Attention, rediriger vers le path en fonction de la category du treatment ↓
      if @prescription.treatment.category == "pills"
        redirect_to pills_path
      elsif @prescription.treatment.category == "cares"
        redirect_to cares_path
      else
        redirect_to exercises_path
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @prescription = Prescription.find(params[:id])
    # raise
    # Pourquoi ci-dessous ça marche pas
    # @prescritpion.time = "#{@prescription.todo_hours}:#{@prescription.todo_minutes}"
  end

  def update
    @user = current_user
    @prescription = Prescription.find(params[:id])

    # ⚠️ Probablement devoir adapter ici ma prescription avant le .update, comme dans le create avec params[][]
    # Faire raise et voir ce que sont exactement mes params

    if @prescription.update(prescription_params)
      # ↓ Probablement à adapter comme dans create, avec des if/elsif/else selon le traitement
      redirect_to prescription_path(@prescription)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def confirm
    @prescription = Prescription.find(params[:id])
  end

  def destroy
    @prescription = Prescription.find(params[:id])
    @prescription.destroy
    # ↓ Probablement à adapter comme dans create, avec des if/elsif/else selon le traitement ↓
    redirect_to pills_path, notice: "Prescription successfully deleted.", status: :see_other
  end

  private

  def prescription_params
    params.require(:prescription).permit(:start_date, :end_date, :comment, :todo_hours, :todo_minutes, :taken_date)
  end

end
