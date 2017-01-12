require 'brie_aging'

describe Brie do
  let(:brie) { described_class.new("brie",0,0) }

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

end
