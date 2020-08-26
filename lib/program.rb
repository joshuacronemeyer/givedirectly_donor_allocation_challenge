
class Program
  attr_accessor :name, :allocation_target, :donations
  def initialize(name:, allocation_target:)
    @name = name
    @allocation_target = allocation_target
    @donations = []
  end

end

