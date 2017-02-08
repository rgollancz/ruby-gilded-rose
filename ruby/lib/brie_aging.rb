class Brie
  attr_accessor :name, :sell_in, :quality

  def initialize(name,sell_in,quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update
    reduce_sell_in
    increase_quality
    return self
  end

  private

  def increase_quality
    @quality < 50 ? @quality += 1 : @quality = 50
  end

  def reduce_sell_in
    @sell_in -= 1
  end

end
