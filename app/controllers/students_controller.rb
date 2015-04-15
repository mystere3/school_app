class StudentsController < ApplicationController  

  def index
    @students = Student.all
  end

  def show
    @student = Student.find_by_id(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(params[:student])
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
    

  def destroy
    @student = Student.find_by_id(params[:id])

    if @student
      @student.destroy
      flash[:notice] = "#{@student.email} was successfully deleted."
      redirect_to students_path
    end
    
  end
end