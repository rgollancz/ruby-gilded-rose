class Backstage
  attr_accessor :sell_in, :quality
  attr_reader :name

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update
    increase_quality
    reduce_sell_in
    return self
  end

  private

  def increase_quality
    case @sell_in
    when 0 then @quality = 0
    when 0...5 then @quality += 3
    when 6...10 then @quality += 2
    when 11...49 then @quality += 1
    end
  end

  def reduce_sell_in
    @sell_in -= 1
  end

end
