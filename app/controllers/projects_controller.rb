class ProjectsController < ApplicationController
  def index
    @projects = if params[:search]
      Project.where("LOWER(title) LIKE LOWER(?)", "%#{params[:search]}%") # This is a query into the database
    else
      Project.all
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    # if cureent_user.admin? || current_user.vetted?
    @project = Project.new
    # else
    # redirect_to root_path
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id

    if @project.valid_?(@project.end_date)
      @project.save
        redirect_to projects_path, notice: "Project successfullly created!"
    else
      render :new, notice: "Project was not saved!!"
    end
  end

  def show
      @project = Project.find(params[:id])
      @rewards = @project.rewards.build
  end

  private

  def project_params
    params.require(:project)
          .permit(:title, :description, :goal, :end_date, :category,
                  rewards_attributes: [:title, :description, :amount, :_destroy])
  end

end
