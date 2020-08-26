class GiveDirectlyChallenge

  def allocate_v1(distribution:, donations:)
    fundraising_system = FundraisingSystem.build_from_givedirectly_assesment_input(target_distribution: distribution, donations: donations)
    fundraising_system.allocate_donations_without_preferences!
    fundraising_system.export_donations_map
  end

  def allocate_v2(distribution:, donations:)
    fundraising_system = FundraisingSystem.build_from_givedirectly_assesment_input(target_distribution: distribution, donations: donations)
    fundraising_system.allocate_donations_with_preferences!
    fundraising_system.export_donations_map
  end
end


