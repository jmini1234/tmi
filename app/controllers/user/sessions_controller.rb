# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController

  respond_to :json

  # def after_sign_in_path_for(resource)
  #     root_path(resource)
  # end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    puts resource_name
    puts resource
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    respond_with(resource) do |format|
      format.html { respond_with resource, location: after_sign_in_path_for(resource)}
      format.json { render json: {redirect_url: after_sign_in_path_for(resource)}, status: 200 }
    end
  end


  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
