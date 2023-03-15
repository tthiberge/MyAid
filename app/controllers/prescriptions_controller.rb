class PrescriptionsController < ApplicationController
  def index
    @prescriptions = Prescription.all
    @user = current_user

      @appointments = current_user.appointments
      @pill_prescriptions = current_user.prescriptions.joins(:treatment).where(treatments: { category: "pills" })
      @care_prescriptions = current_user.prescriptions.joins(:treatment).where(treatments: { category: "cares" })
      @exercise_prescriptions = current_user.prescriptions.joins(:treatment).where(treatments: { category: "exercises" })

      @events = @appointments + @pill_prescriptions + @care_prescriptions + @exercise_prescriptions

      @start_date = Date.current.beginning_of_month
      @end_date = Date.current.end_of_month

  end

  def new
    @prescription = Prescription.new
    # raise
  end

  def create
    @prescription = Prescription.new(prescription_params)
    @user = current_user
    @prescription.user = @user

    # ↓↓ Il faut faire des params[][] car il y a un hash dans un hash ↓↓
    @prescription.taken_date = Date.new(1900, 01, 01) # Garantir que je n'interfère pas avec les prises après 2000

    @prescription.day_half = params["prescription"]["day_half"].to_s

    # Pour attribuer les heures et minutes
    if params[:prescription][:time_afternoon].empty?
      @prescription.todo_hours = params[:prescription][:time_morning].split(":").first.to_i
      @prescription.todo_minutes = params[:prescription][:time_morning].split(":").last.to_i
    else
      @prescription.todo_hours = params[:prescription][:time_afternoon].split(":").first.to_i
      @prescription.todo_minutes = params[:prescription][:time_afternoon].split(":").last.to_i
    end

    # POUR ATTRIBUER UN TRAITMENT_ID
    if !params[:prescription][:treatment_pill_id].empty? && params[:prescription][:treatment_care_id].empty? && params[:prescription][:treatment_exercise_id].empty?
      @treatment = Treatment.find(params[:prescription][:treatment_pill_id].to_i)
    elsif
      params[:prescription][:treatment_pill_id].empty? && !params[:prescription][:treatment_care_id].empty? && params[:prescription][:treatment_exercise_id].empty?
      @treatment = Treatment.find(params[:prescription][:treatment_care_id].to_i)
    else
      params[:prescription][:treatment_pill_id].empty? && params[:prescription][:treatment_care_id].empty? && !params[:prescription][:treatment_exercise_id].empty?
      @treatment = Treatment.find(params[:prescription][:treatment_exercise_id].to_i)
    end
    @prescription.treatment = @treatment

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
    # Pour qu'il se souvienne et pré-selectionne le traitement de la prescription
    # ⚠️⚠️⚠️⚠️⚠️ Je bug ici sur les edit...
    if Treatment.find(@prescription.treatment_id).category=="pills"
      @prescription.treatment_pill_id =  Treatment.find(@prescription.treatment_id)
    elsif Treatment.find(@prescription.treatment_id).category=="cares"
      @prescription.treatment_care_id =  Treatment.find(@prescription.treatment_id)
    else Treatment.find(@prescription.treatment_id).category=="exercises"
      @prescription.treatment_exercise_id =  Treatment.find(@prescription.treatment_id)
    end


    # Pourquoi ci-dessous ça marche pas
    # @prescritpion.time = "#{@prescription.todo_hours}:#{@prescription.todo_minutes}"
  end

  def update
    @user = current_user
    @prescription = Prescription.find(params[:id])


    @prescription.treatment_pill_id =  Treatment.find(@prescription.treatment_id)
    # raise

    if @prescription.save
    # if @prescription.update(prescription_params)
      if @prescription.treatment.category == "pills"
        redirect_to pills_path
      elsif @prescription.treatment.category == "cares"
        redirect_to cares_path
      else
        redirect_to exercises_path
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def confirm
    @prescription = Prescription.find(params[:id])
    @prescription.taken_date = Date.today

    if @prescription.save
      if @prescription.treatment.category == "pills"
        redirect_to pills_path
      elsif @prescription.treatment.category == "cares"
        redirect_to cares_path
      else
        redirect_to exercises_path
      end
    else
      render "/home", alert: "Sorry, the prescription status could not be updated" # notice?
    end
  end

  def destroy
    @prescription = Prescription.find(params[:id])
    if @prescription.destroy
      if @prescription.treatment.category == "pills"
        redirect_to pills_path, notice: "Prescription successfully deleted.", status: :see_other
      elsif @prescription.treatment.category == "cares"
        redirect_to cares_path, notice: "Prescription successfully deleted.", status: :see_other
      else
        redirect_to exercises_path, notice: "Prescription successfully deleted.", status: :see_other
      end
    else
      render "/home", alert: "Sorry, the prescription status could not be deleted" # notice?
    end
  end




  private

  def prescription_params
    params.require(:prescription).permit(:start_date, :end_date, :comment, :todo_hours, :todo_minutes, :taken_date, :day_half)
  end

end
