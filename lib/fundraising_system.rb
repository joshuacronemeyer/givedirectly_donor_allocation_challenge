require 'program'
require 'donation'
class FundraisingSystem

  @total_donations = 0

  def initialize(programs:, donations:)
    @programs = programs
    @donations = donations
    self.class.total_donations = donations.count
  end

  def allocate_donations_without_preferences!
    @donations.each{|donation| donation.allocate_to_program!(programs: @programs)}
  end

  def allocate_donations_with_preferences!
    @donations.each{|donation| donation.allocate_to_program_and_respect_requests!(programs: @programs)}
  end

  def self.total_donations
    @total_donations
  end

  def export_donations_map
    output_map = {}
    @donations.each{|donation| output_map[donation.donor] = donation.program.name }
    output_map
  end

  def self.build_from_givedirectly_assesment_input(target_distribution:, donations:)
    programs = target_distribution.map do |program_name, allocation_target|
      Program.new(name: program_name, allocation_target: allocation_target)
    end

    donations = donations.map do |donor_name, requested_program|
      program = programs.find{|program| program.name == requested_program}
      Donation.new(donor: donor_name, requested_program: program)
    end

    self.new(programs: programs, donations: donations)
  end

  private

  def self.total_donations=(value)
    @total_donations = value
  end
end
