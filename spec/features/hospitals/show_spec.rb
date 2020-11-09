require 'rails_helper'

describe "As a visitor, when I visit a hospital's show page" do
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
    @dr_karev = Doctor.create!(
      name: "Alex Karev",
      specialty: "Pediatric Surgery",
      university: "Harvard University",
      hospital: @grey_sloan
    )
    @dr_bailey = Doctor.create!(
      name: "Miranda Bailey",
      specialty: "General Surgery",
      university: "Stanford University",
      hospital: @grey_sloan
    )
    @dr_mcdreamy = Doctor.create!(
      name: "Derek McDreamy",
      specialty: "Attending Surgeon",
      university: "University of Pennsylvania",
      hospital: @grey_sloan
    )
  end

  it "I see the hospital's name, doctor count, and unique list of doctor's universities" do
    visit "/hospitals/#{@grey_sloan.id}"

    expect(page).to have_content(@grey_sloan.name)
    expect(page).to have_content("Number of Doctors: #{@grey_sloan.doctor_count}")

    within '#universities' do
      expect(page).to have_content(@dr_grey.university, count: 1)
      expect(page).to have_content(@dr_bailey.university, count: 1)
      expect(page).to have_content(@dr_mcdreamy.university, count: 1)
    end
  end
end
