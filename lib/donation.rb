class Donation
  attr_accessor :donor, :program, :requested_program
  def initialize(donor:, requested_program:)
    @donor = donor
    if requested_program.nil? || requested_program == ""
      @requested_program = Program.unspecified
    else
      @requested_program = requested_program
    end
  end

  def allocate_to_program!(programs:)
    eligible_program = programs.find(&:eligible_program?)
    @program = eligible_program
    @program.accept_donation(donation: self)
  end

  def allocate_to_program_and_respect_requests!(programs:)
    if requested_program.unspecified?
      allocate_to_program!(programs: programs)
    else
      @program = requested_program
      @program.accept_donation(donation: self)
    end
  end
end
