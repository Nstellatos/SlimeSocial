class ApplicationController < ActionController::Base
    include SessionsHelper

    #confirms a logged in user
    def logged_in_user
        unless logged_in?
            flash[:danger] = "please log in"
            redirect_to login_url
        end
    end
    
end
