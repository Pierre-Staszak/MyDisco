class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action do
    @discogs = Discogs::Wrapper.new("MyDisco", session[:access_token])
  end

  layout "application"
end
