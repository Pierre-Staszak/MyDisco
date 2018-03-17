class DiscogsWrapperController < ApplicationController
  before_action do
    @discogs = Discogs::Wrapper.new("MyDisco", session[:access_token])
  end

  def index
  end

  def authenticate
    app_key      = ""
    app_secret   = ""
    request_data = @discogs.get_request_token(app_key, app_secret,
                                              "http://127.0.0.1:3000/discogs_wrapper/callback")

    session[:request_token] = request_data[:request_token]

    redirect_to request_data[:authorize_url]
  end

  def callback
    request_token = session[:request_token]
    verifier      = params[:oauth_verifier]
    access_token  = @discogs.authenticate(request_token, verifier)

    session[:request_token] = nil
    session[:access_token]  = access_token

    redirect_to :streams
  end

  def show
    image = @discogs.get_image(params[:id])

    send_data(image,
              :disposition => "inline",
              :type => "image/jpeg")
  end

  def try
    @search = @discogs.search("Dying Fetus")
  end
end