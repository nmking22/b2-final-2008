require 'rails_helper'

describe Hospital, type: :model do
  describe "relationships" do
    it { should have_many :doctors }
  end

  describe "instance methods" do
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

    it '#doctor_count' do
      expect(@grey_sloan.doctor_count).to eq(4)
    end

    it '#unique_universities' do
      expected = [@dr_grey.university, @dr_bailey.university, @dr_mcdreamy.university]

      expect(@grey_sloan.unique_universities).to eq(expected)
    end
  end
end
