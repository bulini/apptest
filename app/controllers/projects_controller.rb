class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :show]
  before_action :protect
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(allowed_params)
    if @project.save
      redirect_to root_url, notice: 'Project Saved'
    else
      render :new
    end
  end


  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(allowed_params)
    redirect_to @project, notice: 'Project has been updated'
    else
      render :edit
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def allowed_params
    params.require(:project).permit(:name, :prod_url, :staging_url, :repo_url, :admin_user, :admin_password, :ftp_host, :ftp_user, :ftp_password)
  end
end
