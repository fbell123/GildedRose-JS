require_relative 'item'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > 0
          if item.name != "Sulfuras, Hand of Ragnaros"
            item.quality = item.quality - 1
          end
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
    end
  end
end

def sulfuras_item
  item.name = "Sulfuras, Hand of Ragnaros"
  item.quality = item.quality
  item.sell_in = item.sell_in
end

def aged_brie_item
  item.name = "Aged Brie"
  if item.quality < 50 && item.sell_in > 0
    item.quality += 1
    item.sell_in -= 1
  elsif item.sell_in < 0
    item.quality -= 2
    item.sell_in -= 1
  end
end

def backstage_item
  item.name = "Backstage passes to a TAFKAL80ETC concert"
  if item.quality < 50 && item.sell_in > 10
    item.quality += 1
    item.sell_in -= 1
  elsif item.quality < 50 && item.sell_in < 10 && item.sell_in > 6
    item.quality += 2
    item.sell_in -= 1
  elsif item.quality < 50 && item.sell_in < 6 && item.sell_in > 0
    item.quality += 3
    item.sell_in -= 1
  elsif item.sell_in < 0
    item.quality -= 2
    item.sell_in -= 1
  end
end

def conjured_item
  item.name = "Conjured"
  if item.quality < 50 && item.sell_in > 0
    item.quality += 1
    item.sell_in -= 2
  elsif item.sell_in < 0
    item.quality -= 2
    item.sell_in -= 1
  end
end


def item_quality
  if item.name = "Aged Brie" && item.quality < 50
    item.quality = item.quality + 1
  elsif item.name != "Aged Brie" && item.name != "Sulfuras, Hand of Ragnaros"
    item.quality = item.quality - 1
  end
end
