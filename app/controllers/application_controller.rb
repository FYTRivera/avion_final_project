class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?


    def not_found
     raise ActionController::RoutingError.new('Not Found')
   rescue
     render_404
   end
 
   def render_404
     render file: "/home/franco/avion_final_project/public/404.html", status: :not_found
   end

    protected

         def configure_permitted_parameters
              devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :age, :email, :password)}

              devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :age, :email, :password, :current_password)}
         end

end
