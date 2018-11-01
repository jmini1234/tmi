class Api::V1::ApplicationController < ApplicationController
    include ActionController::HttpAuthentication::Basic::ControllerMethods
    include ActionController::ImplicitRender
    before_action :set_default_format
        
    private
    def current_user
        user_email = request.query_parameters[:user_email].presence
        user       = user_email && User.find_by_email(user_email)
        if user && Devise.secure_compare(user.authentication_token, request.query_parameters[:user_token])
            user = User.find_by_email(user_email)          
            return user
        else
            return false
        end
    end
    def authenticate_user_from_api!
        user_email = params[:user_email].presence
        user       = user_email && User.find_by_email(user_email)
        if user && Devise.secure_compare(user.authentication_token, params[:user_token])
            user = User.find_by_email(user_email)
            return true
        else
            render :json => {:success => false, :message => "not login user", :status => 422}
        end
    end 
    def set_default_format
        request.format = :json
    end
end
