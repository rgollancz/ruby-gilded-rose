require_relative 'item'
require_relative 'brie_aging'
require_relative 'backstage_aging'
require_relative 'sulfuras_aging'
require_relative 'conjured_aging'

class GildedRose
  attr_reader :items

  def initialize(*items)
    @items = items
  end

  def update_quality
    @items.map! do |item|
      item = prep_for_update(item)
      item.update
    end
  end

  private

  def prep_for_update(item)
    item = Item.new(item.name,item.sell_in,item.quality)
    case item.name
    when "Aged Brie" then item = Brie.new(item.name,item.sell_in,item.quality)
    when "Backstage passes to a TAFKAL80ETC concert" then item = Backstage.new(item.name,item.sell_in,item.quality)
    when "Sulfuras, Hand of Ragnaros" then item = Sulfuras.new(item.name,item.quality)
    when "Conjured" then item = Conjured.new(item.name,item.sell_in,item.quality)
    end
    return item
  end

end
