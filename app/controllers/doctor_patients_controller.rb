class DoctorPatientsController < ApplicationController
  def destroy
    doctor_patient = DoctorPatient.find(params[:id])
    doctor_patient.destroy
    redirect_to "/doctors/#{doctor_patient.doctor.id}"
  end
end
