class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name,sell_in,quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update
    reduce_quality
    reduce_sell_in
    return self
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end

  private

  def reduce_quality
    @quality -= @sell_in > 0 ? 1 : 2
    @quality = 0 if @quality < 0
  end

  def reduce_sell_in
    @sell_in -= 1
  end
end
