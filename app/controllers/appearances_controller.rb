class AppearancesController < ApplicationController

   def create
    @patient = Patient.find(params[:pat_id])
    @conference = Conference.find(params[:conf_id])
    if @conference.patients << @patient
      redirect_to :back, :notice => "#{@patient.firstname} #{@patient.surname} added to #{@conference.conf_date} conference..."
    end
  end

  def destroy
    @appearance = Appearance.find(params[:id])
    @conference = Conference.find(@appearance.conference_id)
    @patient    = Patient.find(@appearance.patient_id)
    if @appearance.destroy
      redirect_to :back, :notice => "#{@patient.firstname} #{@patient.surname} removed from #{@conference.conf_date} conference..."
    end
  end

end

