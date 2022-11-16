class SplashController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @logo = "logo-1.png"
  end
end
