require 'fundraising_system'
class Program
  attr_accessor :name, :allocation_target, :donations
  def initialize(name:, allocation_target:)
    @name = name
    @allocation_target = allocation_target.to_f
    @donations = []
  end

  def eligible_program?
    @donations.count <= (FundraisingSystem.total_donations * allocation_target)
  end
end

