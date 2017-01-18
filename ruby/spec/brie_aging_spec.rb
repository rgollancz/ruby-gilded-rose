require 'brie_aging'

describe Brie do
  let(:brie) { described_class.new("brie",0,0) }
  let(:brie_quality_50) { described_class.new("brie",0,50) }

  describe "#initialize" do
    it "has a name" do
      expect(brie.name).to eq "brie"
    end
    it "has a sell_in" do
      expect(brie.sell_in).to eq 0
    end
    it "has a quality" do
      expect(brie.quality).to eq 0
    end
  end

  describe "#update" do
    it "reduces sell in by 1" do
      expect { brie.update }.to change { brie.sell_in }.by(-1)
    end
    it "increases quality by 1, whilst quality is 50 or below" do
      expect { brie.update }.to change { brie.quality }.by(1)
    end
    it "does not increase quality above 50" do
      expect { brie_quality_50.update }.to_not change { brie_quality_50.quality }
    end
  end
end
