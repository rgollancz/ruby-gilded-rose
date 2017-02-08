class Conjured
  attr_reader :name, :sell_in, :quality

  def initialize(name,sell_in,quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update
    reduce_sell_in
    reduce_quality
    return self
  end

  private

  def reduce_quality
    @sell_in > 0 ? @quality -= 2 : @quality -= 4
    @quality = 0 if @quality < 0
  end

  def reduce_sell_in
    @sell_in -= 1
  end

end
