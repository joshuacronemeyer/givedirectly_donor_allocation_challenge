class Donation
  attr_accessor :donor, :program
  def initialize(donor:, program:)
    unspecified_program = Program.new(name: "Unspecified", allocation_target: -1)
    @donor = donor
    if program.nil? || program == ""
      @program = unspecified_program
    else
      @program = program
    end
  end
end
