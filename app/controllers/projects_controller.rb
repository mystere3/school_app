class ProjectsController < ApplicationController  

  before_action :authenticate_user!, except: [:index, :show]

  def index
    # binding.pry
    if params[:search].present?
      @projects = Project.search(params[:search])
      # conduct some search logic
    else
      @projects = Project.all
    end



    # if params contains a student_id then find the student
    ## and get all of their projects
    # if params[:student_id].present?
    #   @student = Student.find_by_id(params[:student_id])
    #   @projects = @student.projects
    # else
    # ## else just show all projects
    #   @projects = Project.all
    # end
    
  end

  def show
    @project = Project.find_by_id(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find_by_id(params[:id])
    # binding.pry
  end

  def create
    # binding.pry
    @project = Project.new(project_params)
    if @project.save
      #happy path
      # THIS SECOND BIT OF NEXT LINE IS THE SAME AS FLASH MESSAGE BELOW IN DESTROY
      redirect_to project_path(@project), notice: 'Project was added successfully' 
    else
      #unhappy path
      flash[:alert] = 'There was an error creating the project'
      render :new
    end
  end

  def update
    @project = Project.find_by_id(params[:project])

    if @project.update_attributes(project_params)
      redirect_to project_path(@project), notice: 'Project was updated successfully'
    else
      flash[:alert] = 'There was an error updating the project'
      render :edit
    end
    # If project is found call update on attributes on project
    # and pass in field values
    # 
    # If project is not found
    # render :edit page wih flass message imih 
  end

  def destroy
    @project = Project.find_by_id(params[:id])

    if @project
      @project.destroy
      flash[:notice] = "#{@project.name} was successfully deleted."
      redirect_to projects_path
    end
    
  end

  def project_params
    # binding.pry
    params.require(:project).permit(:name, :student_id)
  end

end







