class BreatheController < ApplicationController
  
  before_filter :background
    
  def index
    cities = session[:nb_places]
    if (cities)
      puts "I am the best in #{cities}"
      @cities = cities
    end
    # @users = User.all
    # @hash = Gmaps4rails.build_markers(@users) do |user, marker|
    # marker.lat user.latitude
    # marker.lng user.longitude
    # end
    # @cityname = "Berkeley"
    # @cities = session[:cities] || ['berkeley', 'fremont', 'irvine']
 end
 
 def background
   @cities = ['something']
 end 
 
 def nearby
    session.delete(:name)
    session.delete(:nb_places)
   if (params[:name]) 
     puts "#{params[:name]}"
     city_name = params[:name]
     nb_cities = City.nearby_cities
     session[:nb_places] = nb_cities
     redirect_to '/'
   end
 end
    
end
