require 'fundraising_system'
RSpec.describe FundraisingSystem do

  describe "#allocate_donations_without_preferences!" do

    it "should distribute all donations to Kenya UBI if 100% Kenya UBI is the target" do
      kenya_program = Program.new(name: 'Kenya UBI', allocation_target: 1.0)
      naruto_donation = Donation.new(donor: "Naruto", requested_program: "")
      fundraising_system = FundraisingSystem.new(programs: [kenya_program], donations: [naruto_donation])
      fundraising_system.allocate_donations_without_preferences!
      expect(naruto_donation.program.name).to eq("Kenya UBI")
    end

    it "should distribute half donations to Kenya UBI if 50% Kenya UBI is the target" do
      kenya_program = Program.new(name: 'Kenya UBI', allocation_target: 0.5)
      haiti_program = Program.new(name: 'Haiti UBI', allocation_target: 0.5)
      naruto_donation = Donation.new(donor: "Naruto", requested_program: "")
      kakashi_donation = Donation.new(donor: "Kakashi", requested_program: "")
      fundraising_system = FundraisingSystem.new(programs: [kenya_program, haiti_program], donations: [naruto_donation, kakashi_donation])
      fundraising_system.allocate_donations_without_preferences!
      expect(naruto_donation.program.name).to eq("Kenya UBI")
      expect(kakashi_donation.program.name).to eq("Haiti UBI")
    end

    it "should fail if the distribution does not equal 100%" do

    end

  end

  describe "#allocate_v2" do
    it "should honor donation directives when possible" do

    end

    it "should distribute donations according to targets" do

    end

  end
end
