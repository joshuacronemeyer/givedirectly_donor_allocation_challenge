require 'give_directly_challenge'
RSpec.describe GiveDirectlyChallenge do




  describe "#allocate_v1" do
    it "should work for sample input" do
      #sample data from problem descriptions
      target_distribution = {'Kenya UBI' => 0.3, 'Kenya Standard' => 0.2, 'Uganda Refugees' => 0.5}
      donations = { "Joe" => 'Uganda Refugees', "Piali" => "Uganda Refugees", "Katie" => "", "Isobel" => "" , "Mitch" => "" , "Eric" => "", "Jeff" => "", "Madeleine" => "", "Meylakh" => "", "Maya" => ""}
      expected_uganda_count = 5
      expected_kenya_ubi_count = 3
      expected_kenya_standard_count = 2

      result = GiveDirectlyChallenge.new.allocate_v1(distribution: target_distribution, donations: donations)
      expect(result.values.find_all{|value| value == "Uganda Refugees"}.count).to eq(expected_uganda_count)
      expect(result.values.find_all{|value| value == "Kenya UBI"}.count).to eq(expected_kenya_ubi_count)
      expect(result.values.find_all{|value| value == "Kenya Standard"}.count).to eq(expected_kenya_standard_count)
    end

  end

  describe "#allocate_v2" do
    it "should work for sample input" do
      #sample data from problem descriptions
      target_distribution = {'Kenya UBI' => 0.7, 'Kenya Standard' => 0.2, 'Uganda Refugees' => 0.1}
      donations = { "Joe" => 'Uganda Refugees', "Piali" => "Uganda Refugees", "Katie" => "", "Isobel" => "" , "Mitch" => "" , "Eric" => "", "Jeff" => "", "Madeleine" => "", "Meylakh" => "", "Maya" => ""}
      expected_uganda_count = 2
      expected_kenya_ubi_count = 7
      expected_kenya_standard_count = 1
      result = GiveDirectlyChallenge.new.allocate_v2(distribution: target_distribution, donations: donations)
      expect(result.values.find_all{|value| value == "Uganda Refugees"}.count).to eq(expected_uganda_count)
      expect(result.values.find_all{|value| value == "Kenya UBI"}.count).to eq(expected_kenya_ubi_count)
      expect(result.values.find_all{|value| value == "Kenya Standard"}.count).to eq(expected_kenya_standard_count)
    end
  end
end
