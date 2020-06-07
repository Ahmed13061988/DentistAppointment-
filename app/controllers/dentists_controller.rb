class DentistsController < ApplicationController
    def index
        if params[:search]
            @dentist = Dentist.search_service(params[:search])
        else
            @dentist = Dentist.all.order(:name)
        end
    end

    def show
        @dentist = Dentist.find(params[:id])
    end



    private

    def dentist_params
        params.require(:dentist).permit(:name, :duration, :cost, :description)
    end 
end
