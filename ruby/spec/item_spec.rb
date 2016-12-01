require 'item'

describe Item do
  let(:item) { described_class.new("foo",0,0) }

  describe "#initialize" do
    it "has a name" do
      expect(item.name).to eq "foo"
    end
    it "has a sell_in" do
      expect(item.sell_in).to eq 0
    end
    it "has a quality" do
      expect(item.quality).to eq 0
    end
  end

  describe "#to_s" do
    it "summarizes the item details" do
      expect(item.to_s).to eq "foo, 0, 0"
    end
  end

end
