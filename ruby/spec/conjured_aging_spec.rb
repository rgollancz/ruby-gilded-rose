require 'conjured_aging'

describe Conjured do
  let(:conjured) { described_class.new("conjured",0,0) }

  describe "#initialize" do
    it "has a name" do
      expect(conjured.name).to eq "conjured"
    end
    it "has a sell_in" do
      expect(conjured.sell_in).to eq 0
    end
    it "has a quality" do
      expect(conjured.quality).to eq 0
    end
  end
end
