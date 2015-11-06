class ProjectsController < ApplicationController
  require 'net/http'

  def index
    if current_user.id == 7
      @projects = Project.all
    else
      @project = Project.find_by_developer_mail(current_user.id)
    end
  end

  def show
    project = Project.find(params[:id])
    full_website = "http://"+project.website
    website = URI.parse("#{full_website}")
    request = Net::HTTP::Get.new(website.to_s)
    @response = Net::HTTP.start(website.host, website.port) {|http| http.request(request)}
    response_start_time = Time.now
    if @response.code.to_i !=200 && @response.code.to_i !=301 && @response.code.to_i !=302
      EmailSend.mail_send(current_user.email).deliver
    end
      time = Time.now+project.time_interval.to_i*30
      response_get=Net::HTTP.get(website) 
      @response_end_time = Time.now - response_start_time
      @duration = time.to_s.gsub("+0545","")
  end

  def new
    @project = Project.new
    @users = User.all
  end

  def create
    @users = User.all
    user = User.find_by_id(current_user.id)
    @check_website = params[:project][:website]
    response = system("ping -c1 #{@check_website}")
    @project = user.projects.new(set_db_field)
    if response == true 
      if @project.save
        flash[:msg]="New Monitor Added"
        redirect_to new_project_path
      else
        flash[:msg]="Sorry Monitor Could not be added"
        render :new
      end
    else
      flash[:msg]="The URL you enter is incorrect. Enter valid url eg:facebook.com"
      render :new
    end
  end

  def destroy
    project = Project.find(params[:id])
    if project.destroy
      flash[:success]="Project Successfully deleted"
      redirect_to projects_path
    else
      flash[:success]="Sorry project could not deleted"
    end
  end

  def edit
    @project = Project.find(params[:id])
    @users = User.all
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(set_db_field)
      flash[:msg]="Project Monitoring Service Successfully updated"
      redirect_to edit_project_path(@project.id) 
     else
      flash[:msg]="Project Monitoring Service Could Not Updated"
    end
  end

  private def set_db_field
    params.require(:project).permit(:time_interval, :service_name, :website, :developer_mail)
  end
end
