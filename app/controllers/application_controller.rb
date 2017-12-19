class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception



  def authenticate_user!
    if current_user && current_user.admin == true
      super
    else
      redirect_to root_url
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end
end
