module NormalAging

NORMAL = 1
SPEEDY = 2
MIN_QUALITY = 0
SELL_BY_DATE = 0

  def normal_update(item)
    if item.quality == MIN_QUALITY
      item
    elsif item.sell_in > SELL_BY_DATE && item.quality >=(MIN_QUALITY+1) || item.sell_in == SELL_BY_DATE && item.quality ==(MIN_QUALITY+1)
      reduce_quality(item, NORMAL)
    else
      reduce_quality(item, SPEEDY)
    end
    return reduce_sell_in(item)
  end

  def reduce_quality(item,amount)
    item.quality -= amount
  end

  def reduce_sell_in(item)
    item.sell_in -= NORMAL
  end

end
