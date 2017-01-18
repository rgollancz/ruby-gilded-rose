require 'gilded_rose'
require 'item'

describe GildedRose do
  let(:soup) { Item.new("soup",0,0) }
  let(:flan) { Item.new("flan",10,10) }
  let(:bread) { Item.new("bread",0,10) }

  describe "#update_quality" do
    it "does not reduce the quality below zero" do
      items = soup
      gr = GildedRose.new(items)
      gr.update_quality
      expect(gr.items[0].quality).to eq 0
    end
    it "does reduce the sell in below zero" do
      items = soup
      gr = GildedRose.new(items)
      gr.update_quality
      expect(gr.items[0].sell_in).to eq -1
    end
    it "reduces the sell in" do
      items = flan
      gr = GildedRose.new(items)
      expect { gr.update_quality }.to change { gr.items[0].sell_in }.by(-1)
    end
    it "reduces the quality" do
      items = flan
      gr = GildedRose.new(items)
      expect { gr.update_quality }.to change { gr.items[0].quality }.by(-1)
    end
    it "reduces the quality twice as fast after sell in date has passed" do
      items = bread
      gr = GildedRose.new(items)
      expect { gr.update_quality }.to change { gr.items[0].quality }.by(-2)
    end
  end
end
