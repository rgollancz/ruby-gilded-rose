class Conjured
  attr_reader :name, :sell_in, :quality

  def initialize(name,sell_in,quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update
    return self
  end
end
