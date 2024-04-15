
class Admin::StudentsController < AdminController
  include ApplicationHelper
  before_action :set_student, only: %i[show edit update destroy]
  helper_method :formatted_date

  def index
    @q = Student.ransack(params[:q])
    @students = @q.result(distinct: true).page(params[:page])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    respond_to do |format|
      if @student.save
        CrudNotificationMailer.create_notification(@student).deliver_now
        format.html { redirect_to admin_students_path, notice: 'Student has been created successfully' }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end

  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        CrudNotificationMailer.create_notification(@student).deliver_now
        format.html { redirect_to admin_students_path, notice: 'Student has been updated successfully' }
        format.js
      else
        format.html { render :edit }
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      #CrudNotificationMailer.delete_notification(@student).deliver_now
      @student.destroy
      format.html { redirect_to admin_students_path, notice: 'Student has been deleted successfully' }
      format.js
    end
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :date_of_birth, :permanent_address, :local_address, :permanent_contact_number, :alternate_contact_number, :profile_image)
  end

  def set_student
    @student = Student.find(params[:id])
  end

  def formatted_date(date)
    date.strftime('%A, %b %d, %Y') if date.present?
  end

end
