class AppointmentsController < ApplicationController
    before_action :login_required
    before_action :find_appointment, only: [:show, :edit, :update]

    def index
        @appointments = current_patient.appointments
    end

    def new
        @appointment = Appointment.new
    end

    def create
        @appointment = current_patient.appointments.build(appointment_params)
        @dentist = Dentist.find_by(name: appointment_params[:dentist_id])
        @appointment.dentist_id = @dentist.id
        if @appointment.save
            redirect_to appointment_path(@appointment.name)
        else
            render :new
        end
    end

    def show
    end                                            

    def edit
    end


    def update
        find_appointment.update(appointment_params)
        redirect_to appointment_path(@appointment) 
    end


    def destroy
        Appointment.find(params[:id]).destroy
        redirect_to patient_path(current_patient)
    end

    private

    def appointment_params
        params.require(:appointment).permit(:title, :date, :time, :dentist_id)
    end

    def find_appointment
        @appointment = Appointment.find(params[:id])
    end
end
