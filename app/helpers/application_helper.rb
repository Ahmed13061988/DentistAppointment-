module ApplicationHelper
    def current_patient
        @current_patient ||= Patient.find_by_id(session[:patient_id]) if session[:patient_id]
     end

    def is_logged_in?
        !!session[:patient_id]
    end

    def login_required
        unless is_logged_in?
            redirect_to login_path
        end
    end

    def patient_appointments
        current_patient.appointments
    end


    def redirect_if_not_logged_in
        redirect_to '/' if !is_logged_in?
      end 
end
