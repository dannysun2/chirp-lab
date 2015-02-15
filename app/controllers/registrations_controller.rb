class RegistrationsController < ApplicationController
   include Wicked::Wizard

  steps :login, :personal, :profile

  def show

    if session[:new_user_id].blank?
      @user = User.create!
      session[:new_user_id] = @user.id
    end
    @user = User.find session[:new_user_id]

    render_wizard
  end

  def update
    @user = User.find session[:new_user_id]

    @user.update_attribute(:status, step.to_s)
    if step == steps.last
      @user.update_attribute(:status, 'active')
    end

    case step
    when :login
      @user.update(params.require(:user).permit(:username, :password, :password_confirmation))
    when :personal
      @user.update(params.require(:user).permit(:firstname, :lastname, :email))
   when :profile
      @user.update(params.require(:user).permit(:avatar))
      session[:user_id] = @user.id
    end

    render_wizard @user
  end
end
