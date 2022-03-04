class SignupsController < ApplicationController

    def create
        signups = Signup.create!(signups_params)
        render json: signups.activity, status: :created 
        #to return the associated activity we need to hook it after signups -> will return just the activity for the camper
    end

    private 
    
    def signups_params
        params.permit(:time, :camper_id, :activity_id)
    end

end
