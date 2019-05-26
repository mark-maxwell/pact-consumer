class Chocobo
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def == other
    other.is_a?(Chocobo) && other.name == name
  end
end
