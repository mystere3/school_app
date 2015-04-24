class StudentsController < ApplicationController  

  before_action :authenticate_user!

  def index
    @students = Student.all
  end

  def show
    @student = Student.find_by_id(params[:id])
    @projects = @student.projects
  end

  def new
    @student = Student.new
  end

  def edit
    @student = Student.find_by_id(params[:id])
    # binding.pry
  end

  def create
    # binding.pry
    @student = Student.new(student_params)
    if @student.save
      #happy path
      # THIS SECOND BIT OF NEXT LINE IS THE SAME AS FLASH MESSAGE BELOW IN DESTROY
      redirect_to student_path(@student), notice: 'Student was added successfully' 
    else
      #unhappy path
      flash[:alert] = 'There was an error creating the student'
      render :new
    end
  end
    
  def update
    # binding.pry
    @student = Student.find_by_id(student_params)

    if @student.update_attributes(params[:student])
      redirect_to student_path(@student), notice: 'Student was updated successfully'
    else
      flash[:alert] = 'There was an error updating the student'
      render :edit
    end
    # If student is found call update on attributes on student
    # and pass in field values
    # 
    # If student is not found
    # render :edit page wih flass message imih 
  end

  def destroy
    @student = Student.find_by_id(params[:id])

    if @student
      @student.destroy
      flash[:notice] = "#{@student.email} was successfully deleted."
      redirect_to students_path
    end
    
  end

  private

  def student_params
    # binding.pry
    params.require(:student).permit(:email, :full_name, :phone, :hero, :course_ids => [])
  end
end

