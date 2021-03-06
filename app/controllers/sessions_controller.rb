class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to projects_path, notice: 'Login successful'
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to projects_path, notice: 'Logged out!'
  end
end
