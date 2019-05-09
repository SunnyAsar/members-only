class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    # @user && @user.auth...
    if @user&.authenticate(params[:session][:password])
      log_in @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      flash[:success] = 'You have logged in'
      redirect_to root_url
    else
      message = @user.nil? ? 'Email not found in database' : 'Invalid email/password combiantion'
      flash.now[:danger] = message
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    render 'new'
  end
end
