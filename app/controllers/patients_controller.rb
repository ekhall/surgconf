class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(params[:patient])
    if @patient.save
      flash[:success] = "Patient #{patient.surname} saved..."
      redirect_to patient_index_path
    else
      render 'new'
    end
  end
end
