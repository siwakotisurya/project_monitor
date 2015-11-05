class ProjectMonitorController < ApplicationController
  def index
  @user = User.new
  end

  def create
  @user = User.new(set_db)
  if @user.save
  
  else

  end
  end

  private def set_db
    params.require(:user).permit(:full_name, :password, :email)
  end

end
