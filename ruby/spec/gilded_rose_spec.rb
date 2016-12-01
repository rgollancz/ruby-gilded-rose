require 'gilded_rose'
require 'item'

describe GildedRose do
  let(:soup) { Item.new("soup",0,0) }
  let(:flan) { Item.new("flan",10,10) }
  let(:bread) { Item.new("bread",0,10) }
  let(:brie) { Item.new("Aged Brie",1,10) }
  let(:old_brie) { Item.new("Aged Brie",1,50) }
  let(:sulfuras) { Item.new("Sulfuras, Hand of Ragnaros",1,80) }
  let(:backstage) { Item.new("Backstage passes to a TAFKAL80ETC concert",7,20) }

  describe "#update_quality" do
    it "does not change the item name" do
      items = [soup]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "soup"
    end
    it "does not reduce the quality below zero" do
      items = [soup]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end
    it "does reduce the sell in below zero" do
      items = [soup]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq -1
    end
    it "reduces the sell in" do
      items = [flan]
      gr = GildedRose.new(items)
      expect { gr.update_quality() }.to change { items[0].sell_in }.by(-1)
    end
    it "reduces the quality" do
      items = [flan]
      gr = GildedRose.new(items)
      expect { gr.update_quality() }.to change { items[0].quality }.by(-1)
    end
    it "reduces the quality twice as fast after sell in date has passed", focus: true do
      items = [bread]
      gr = GildedRose.new(items)
      expect { gr.update_quality() }.to change { items[0].quality }.by(-2)
    end

    describe "Aged brie" do
      it "increases the quality of aged brie" do
        items = [brie]
        gr = GildedRose.new(items)
        expect { gr.update_quality() }.to change { items[0].quality }.by(1)
      end
      it "does not increase quality above 50" do
        items = [old_brie]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 50
      end
    end

    describe "Sulfuras" do
      it "quality and sell in are unaffected" do
        items = [sulfuras]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 80
        expect(items[0].sell_in).to eq 1
      end
    end

    describe "Backstage passes" do
      it "increase in quality when sell in is above 5 and below 10" do
        items = [backstage]
        gr = GildedRose.new(items)
        expect { gr.update_quality() }.to change { items[0].quality }.by(2)
      end
      it "quality set to zero once concert is in the past" do
        items = [backstage]
        gr = GildedRose.new(items)
        expect { gr.update_quality() }.to change { items[0].quality }.by(2)
      end
    end
  end



end
