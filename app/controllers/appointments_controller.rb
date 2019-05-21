class AppointmentsController < ApplicationController
  before_action :set_doctor, except: [:index_by_user, :new_by_user]
  
  def index
    @appointments = @doctor.appointments
  end

  def index_by_user
    @user = User.find(params[:user_id])
    @appointments = @user.appointments
  end

  def new_by_user
    @user = User.find(params[:user_id])
    @appointment = @user.appointments.new(appointment_params)
    if @appointment.save
      redirect_to user_appointments_path(@user)
    else 
      render :new
    end
  end

  def new
    @appointment = @doctor.appointments.new
  end

  def create
    @appointment = @doctor.appointments.new(appointment_params)
    if @appointment.save
      redirect_to doctor_appointments_path(@doctor)
    else 
      render :new
    end
    
  end

  def destroy
    @appointment = @doctor.appointments.find(params[:doctor_id])
    @appointment.destroy
    redirect_to doctor_appointments_path(@doctor)
  end
    

  private
   def set_doctor
     @doctor = Doctor.find(params[:doctor_id]) 
   end

   def appointment_params
     params.require(:appointment).permit(:user_id )
   end


end
