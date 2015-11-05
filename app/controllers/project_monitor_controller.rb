class ProjectMonitorController < ApplicationController
  def index
  @user = User.new
  end

  def create
  @user = User.new(set_db)
  if @user.save
    flash[:msg] = "Congratulations yout account has been created"
    redirect_to projects_path
  else
    flash[:msg] = "Sorry account could not created"
  end
  end

  private def set_db
    params.require(:user).permit(:full_name, :password, :email)
  end

end
