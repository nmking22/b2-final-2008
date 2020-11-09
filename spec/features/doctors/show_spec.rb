require 'rails_helper'

describe "As a visitor, when I visit a doctor's show page" do
  before :each do
    @grey_sloan = Hospital.create!(
      name: "Grey Sloan Memorial Hospital"
    )
    @dr_grey = Doctor.create!(
      name: "Meredith Grey",
      specialty: "General Surgery",
      university: "Harvard University",
      hospital: @grey_sloan
    )
    @patient_1 = @dr_grey.patients.create!(
      name: "Katie Bryce",
      age: 24
    )
    @patient_2 = @dr_grey.patients.create!(
      name: "Denny Duquette",
      age: 39
    )
    @patient_3 = @dr_grey.patients.create!(
      name: "Rebecca Pope",
      age: 32
    )
    @patient_4 = @dr_grey.patients.create!(
      name: "Zola Shepherd",
      age: 2
    )
  end
  it "I see all of the doctor's attributes as well as hospital name and patient names" do
    visit "/doctors/#{@dr_grey.id}"

    expect(page).to have_content(@dr_grey.name)
    expect(page).to have_content("Specialty: #{@dr_grey.specialty}")
    expect(page).to have_content("Alma Mater: #{@dr_grey.university}")
    expect(page).to have_content("Practicing Hospital: #{@dr_grey.hospital.name}")

    within '#patients' do
      expect(page).to have_content(@patient_1.name)
      expect(page).to have_content(@patient_2.name)
      expect(page).to have_content(@patient_3.name)
      expect(page).to have_content(@patient_3.name)
    end
  end
end
