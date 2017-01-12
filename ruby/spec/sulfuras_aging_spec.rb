require 'sulfuras_aging'

describe Sulfuras do
  let(:sulfuras) { described_class.new("sulfuras",0,0) }

  describe "#initialize" do
    it "has a name" do
      expect(sulfuras.name).to eq "sulfuras"
    end
    it "has a sell_in" do
      expect(sulfuras.sell_in).to eq 0
    end
    it "has a quality" do
      expect(sulfuras.quality).to eq 0
    end
  end
end
