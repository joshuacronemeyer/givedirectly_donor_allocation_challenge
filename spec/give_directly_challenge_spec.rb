require 'give_directly_challenge'
RSpec.describe GiveDirectlyChallenge do

  #sample data from problem descriptions
  target_distribution = {'Kenya UBI' => 0.3, 'Kenya Standard' => 0.2, 'Uganda Refugees' => 0.5}
  donations = { "Joe" => 'Uganda Refugees', "Piali" => "Uganda Refugees", "Katie" => "", "Isobel" => "" , "Mitch" => "" , "Eric" => "", "Jeff" => "", "Madeleine" => "", "Meylakh" => "", "Maya" => ""}
  # expected_results = { "Joe" => 'Uganda Refugees', "Piali" => "Uganda Refugees", "Katie" => "Uganda Refugees", "Isobel" => "Uganda Refugees" , "Mitch" => "Uganda Refugees" , "Eric" => "Kenya Standard", "Jeff" => "Kenya Standard", "Madeleine" => "Kenya UBI", "Meylakh" => "Kenya UBI", "Maya" => "Kenya UBI"}

  expected_uganda_count = 5
  expected_kenya_ubi_count = 3
  expected_kenya_standard_count = 2


  describe "#allocate_v1" do
    it "should work for sample input" do
      result = GiveDirectlyChallenge.new.allocate_v1(distribution: target_distribution, donations: donations)
      expect(result.values.find_all{|value| value == "Uganda Refugees"}.count).to eq(expected_uganda_count)
      expect(result.values.find_all{|value| value == "Kenya UBI"}.count).to eq(expected_kenya_ubi_count)
      expect(result.values.find_all{|value| value == "Kenya Standard"}.count).to eq(expected_kenya_standard_count)
    end

  end

  describe "#allocate_v2" do
  end
end
