require 'conjured_aging'

describe Conjured do
  let(:conjured) { described_class.new("conjured",10,30) }
  let(:conjured_sell_in_0) { described_class.new("conjured",0,30) }

  describe "#initialize" do
    it "has a name" do
      expect(conjured.name).to eq "conjured"
    end
    it "has a sell_in" do
      expect(conjured.sell_in).to eq 10
    end
    it "has a quality" do
      expect(conjured.quality).to eq 30
    end
  end

  describe "#update" do
    it "reduces sell in by 1" do
      expect { conjured.update }.to change { conjured.sell_in }.by(-1)
    end
    it "reduces quality by 2, when sell in is more than 0" do
      expect { conjured.update }.to change { conjured.quality }.by(-2)
    end
    it "reduces quality by 4, when sell in is less than 0" do
      expect { conjured_sell_in_0.update }.to change { conjured_sell_in_0.quality }.by(-4)
    end
  end
end
