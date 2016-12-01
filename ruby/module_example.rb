module NormalAged
  def reduce_quality
    @quality -= 1
  end
end


class Item
  include NormalAged

  attr_reader :quality

  def initialize
    @quality = 100
  end
end

item = Item.new
item.reduce_quality
p item.quality
