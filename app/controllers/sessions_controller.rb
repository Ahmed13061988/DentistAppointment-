class SessionsController < ApplicationController
    def new
    end
    
    def home
    end


    def create
        if 
            @patient = Patient.find_by(email: params[:patient][:email])
            @patient && @patient.authenticate(params[:patient][:password])
                session[:patient_id] = @patient.id
                redirect_to @patient
            else
                redirect_to "/login"
        end
    end


    def google
        @patient = Patient.find_or_create_by(email: auth["info"]["email"]) do |patient|
            patient.first_name = auth["info"]["first_name"]
            patient.last_name = auth["info"]["last_name"]
            patient.password = SecureRandom.hex    
        end

        if @patient.save
        session[:patient_id] = @patient.id
        redirect_to patient_path(@patient)
        else
            redirect_to login_path
        end
    end


    def destroy
        session.clear
        redirect_to '/'
    end

    private

    def auth
        request.env['omniauth.auth']
    end
    
end