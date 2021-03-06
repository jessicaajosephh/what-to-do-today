require './config/environment'
#require 'rack-flash'

class ApplicationController < Sinatra::Base

  #use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SINATRA_SECRET']
  end

  get "/" do
    erb :index
  end

  helpers do

    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login?error= You are not logged in"
      end
    end

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end
