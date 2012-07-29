class PatientsController < ApplicationController
  before_filter :signed_in_user,
                only: [:index, :new, :edit, :update, :destroy, :show]
  before_filter :editor_user, only: [:new, :create, :update, :edit]
  before_filter :viewer_user, only: [:index]
  before_filter :admin_user,     only: :destroy

  def index
    @patients = Patient.all(order: 'surname, firstname')
  end

  def new
    @patient = Patient.new
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def create
    @patient = Patient.new(params[:patient])
    if @patient.save
      flash[:success] = "Patient #{@patient.firname} #{@patient.surname} saved..."
      redirect_to patients_path
    else
      render 'new'
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update_attributes(params[:patient])
      redirect_to @patient, notice: "Successfully Updated Patient. #{undo_link}"
    else
      render 'edit'
    end
  end

  def destroy
    Patient.find(params[:id]).destroy
    redirect_to patients_path, notice: "Deleted Patient. #{undo_link}"
  end

  private

    def undo_link
      view_context.link_to("Undo", revert_version_path(@patient.versions.scoped.last), method: :post)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    end

    def admin_user
      if !current_user.editor?
        flash[:error] = "You are not an administrator."
        redirect_to users_path
      end
    end

    def editor_user
      if !current_user.editor?
        flash[:error] = "You do not have patient editing privileges."
        redirect_to users_path
      end
    end

    def viewer_user
      if !current_user.viewer?
        flash[:error] = "You do not yet have patient viewing privileges."
        redirect_to users_path
      end
    end

end
