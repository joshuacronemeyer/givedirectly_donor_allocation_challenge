class Donation
  attr_accessor :donor, :program, :requested_program
  def initialize(donor:, requested_program:)
    unspecified_program = Program.new(name: "Unspecified", allocation_target: -1)
    @donor = donor
    if program.nil? || program == ""
      @requested_program = unspecified_program
    else
      @requested_program = requested_program
    end
  end

  def allocate_to_program!(programs:)
    eligible_program = programs.find(&:eligible_program?)
    @program = eligible_program
  end
end
