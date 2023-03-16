class AppointmentsController < ApplicationController
  def index
    @appointments_not_done = current_user.appointments.where(start_date: ..Date.today, end_date: Date.today..).where(is_done: false).order(:day_half, :appointment_hour, :appointment_min)

    @appointments_done = current_user.appointments.where(start_date: ..Date.today, end_date: Date.today..).where(is_done: true).order(:day_half, :appointment_hour, :appointment_min)
  end

  def show
    @appointment = Appointment.find(params[:id])
    # @appointments = []
    # current_user.appointments.each do |appointment|
    #   @appointments << appointment
    # end
    begin
      @weather=OPENWEATHER_CLIENT.current_weather(lat: @appointment.doctor.latitude, lon: @appointment.doctor.longitude)
      @icon=OPENWEATHER_CLIENT.current_weather(weather.first.icon)
    rescue StandardError
    end
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user

    @doctor = Doctor.find(params[:appointment][:doctor_id])
    @appointment.doctor = @doctor
    @appointment.day_half = params[:appointment][:day_half]

    if params[:appointment][:time_afternoon].empty?
      @appointment.appointment_hour = params[:appointment][:time_morning].split(":").first.to_i
      @appointment.appointment_min = params[:appointment][:time_morning].split(":").last.to_i
    else
      @appointment.appointment_hour = params[:appointment][:time_afternoon].split(":").first.to_i
      @appointment.appointment_min = params[:appointment][:time_afternoon].split(":").last.to_i
    end

    if @appointment.save
      redirect_to appointments_path, notice: 'Appointment was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
    # Bah ici tout est bon en termes de params
  end

  def update
    @appointment = Appointment.find(params[:id])

    # Pour assigner l'heure et les minutes
    if params[:appointment][:time_afternoon].empty?
      @appointment.appointment_hour = params[:appointment][:time_morning].split(":").first.to_i
      @appointment.appointment_min = params[:appointment][:time_morning].split(":").last.to_i
    else
      @appointment.appointment_hour = params[:appointment][:time_afternoon].split(":").first.to_i
      @appointment.appointment_min = params[:appointment][:time_afternoon].split(":").last.to_i
    end

    # Pour assigner le commentaire
    @appointment.comment = params[:appointment][:comment]

    if @appointment.save
      redirect_to appointments_path, notice: 'Appointment was successfully edited.'
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def confirm
    @appointment = Appointment.find(params[:id])
    @appointment.is_done = true


    if @appointment.save
      flash[:notify] = "Bravo you got appointment with doctor well"
      redirect_to appointments_path
    else
      render "/home", notice: "Sorry, the appointment status could not be updated"
      # notice ou alert, selon le design qu'on préfère. Ici, c'est le même
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path, alert: "Appointment successfully deleted.", status: :see_other
  end

  private

  def appointment_params
    params.require(:appointment).permit(:title, :date, :appointment_hour, :appointment_min, :comment, :is_done, :doctor_id)
  end
end
