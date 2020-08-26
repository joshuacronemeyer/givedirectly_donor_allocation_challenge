require 'fundraising_system'
class Program
  UNSPECIFIED = "Unspecified"
  attr_accessor :name, :allocation_target, :donations
  def initialize(name:, allocation_target:)
    @name = name
    @allocation_target = allocation_target.to_f
    @donations = []
  end

  def unspecified?
    self.name == UNSPECIFIED
  end

  def eligible_program?
    @donations.count < (FundraisingSystem.total_donations * allocation_target)
  end

  def accept_donation(donation:)
    @donations << donation
  end

  def donation_total
    @donations.size
  end

  def self.unspecified
    self.new(name: UNSPECIFIED, allocation_target: -1.0)
  end
end

