class StudentsController < ApplicationController
  respond_to :html
  before_action :authenticate_user!, only: [:index, :create, :edit, :new]
  before_action :set_student, only: [:update, :show, :edit]
  before_action :is_admin?, only: [:index, :create, :edit, :new]

  def index
    @students = Student.all.order("clave_unica ASC")
    respond_with(@students)
  end

  def results
    if params[:search]
      @students = Student.search(params[:search]).order("clave_unica ASC")
    else
      @students = Student.all.order("clave_unica ASC")
    end
    respond_with(@students)
  end

  def show
    respond_with(@student)
  end

  def edit
    respond_with(@student)
  end

  def update
    @student.update(student_params)
    respond_with(@student)
  end

  def new
    @student = Student.new
    respond_with(@student)
  end

  def create
    @student = Student.new(student_params)
    @student.save
    respond_with(@student)
  end

  def find
    @student = Student.where(clave_unica: params[:clave_unica])
    respond_with(@student)
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:clave_unica, :email, :points)
    end
end
