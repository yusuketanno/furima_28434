class UsersController < ApplicationController
  before_action :authenticate_user!
  
  before_action :basic_auth

  def new
    @user = User.new
    render "devise/registrations/new"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render 'index'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  private

  # def user_params
  #   params.require(:user).permit(:nickname, :email, :password)
  # end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

end