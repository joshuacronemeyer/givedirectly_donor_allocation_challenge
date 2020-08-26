require 'fundraising_system'
RSpec.describe Program do

  context "unspecified donations" do
    it "should know if a program is unspecified" do
      program = Program.unspecified

      expect(program).to be_unspecified
    end
  end

  context "accepting donations" do
    it "should be tracking the new donation" do
      program = Program.new(name: "Test", allocation_target: 1.0)
      donation = Donation.new(donor: "Yamato", requested_program: "")
      program.accept_donation(donation: donation)
      expect(program.donation_total).to eq(1)
    end
  end

  context "eligiblity" do
    it "should not be eligible when target met" do
      program = Program.new(name: "Test", allocation_target: 1.0)
      donation = Donation.new(donor: "Yamato", requested_program: "")
      system = FundraisingSystem.new(programs: [program], donations: [donation])
      system.allocate_donations_without_preferences!
      expect(program.eligible_program?).to be false
    end

    it "should  be eligible when target not met" do
      program = Program.new(name: "Test", allocation_target: 1.0)
      donation = Donation.new(donor: "Yamato", requested_program: "")
      FundraisingSystem.new(programs: [program], donations: [donation])
      expect(program.eligible_program?).to be true
    end
  end
end

