require_relative 'normal_aging'
require_relative 'edge_case_aging'

class GildedRose
  include NormalAging
  include EdgeAging

  EDGE_CASES = ["Aged Brie","Backstage passes to a TAFKAL80ETC concert","Sulfuras, Hand of Ragnaros","Conjured"]
  NORMAL = 1
  SPEEDY = 2
  MIN_QUALITY = 0
  SELL_BY_DATE = 0

  def initialize(items)
    @items = items
  end

  def isEdgeCase?(item)
    EDGE_CASES.include?(item.name)
  end

  def update_quality
    @items.each do |item|
      if isEdgeCase?(item)
        edge_case_update(item)
      else
        normal_update(item)
      end
    end
  end

  def normal_update(item)
    if item.quality == MIN_QUALITY
      item
    elsif item.sell_in > SELL_BY_DATE && item.quality >=(MIN_QUALITY+1) || item.sell_in == SELL_BY_DATE && item.quality ==(MIN_QUALITY+1)
      reduce_quality(NORMAL)
    else
      reduce_quality(SPEEDY)
    end
    return
      reduce_sell_in(item)
  end

end
