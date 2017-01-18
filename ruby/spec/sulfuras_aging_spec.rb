require 'sulfuras_aging'

describe Sulfuras do
  let(:sulfuras) { described_class.new("sulfuras",80) }

  describe "#initialize" do
    it "has a name" do
      expect(sulfuras.name).to eq "sulfuras"
    end
    it "has a quality" do
      expect(sulfuras.quality).to eq 80
    end
  end
end
