require_relative 'normal_aging'
require_relative 'edge_case_aging'

class GildedRose
  include NormalAging
  include EdgeAging

EDGE_CASES = ["Aged Brie","Backstage passes to a TAFKAL80ETC concert","Sulfuras, Hand of Ragnaros","Conjured"]

  def initialize(items)
    @items = items
  end

  def isEdgeCase?(item)
    EDGE_CASES.include?(item.name)
  end

  def update_quality()
    @items.each do |item|
      if isEdgeCase?(item)
        edge_case_update(item)
      else
        normal_update(item)
      end
    end
  end

end
