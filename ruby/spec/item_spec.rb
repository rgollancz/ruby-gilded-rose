require 'item'

describe Item do
  let(:item_in_date) { described_class.new("foo",2,4) }
  let(:item_out_of_date) { described_class.new("foo",0,6) }
  let(:item_quality_0) { described_class.new("foo",0,0) }

  describe "#initialize" do
    it "has a name" do
      expect(item_in_date.name).to eq "foo"
    end
    it "has a sell_in" do
      expect(item_in_date.sell_in).to eq 2
    end
    it "has a quality" do
      expect(item_in_date.quality).to eq 4
    end
  end

  describe "#to_s" do
    it "summarizes the item details" do
      expect(item_in_date.to_s).to eq "foo, 2, 4"
    end
  end

  describe "#update" do
    it "reduces the sell in by 1" do
      expect { item_in_date.update }.to change { item_in_date.sell_in }.by(-1)
    end
    it "reduces the quality by 1, when the sell in has not passed" do
      expect { item_in_date.update }.to change { item_in_date.quality }.by(-1)
    end
    it "reduces the quality by 2, when the sell in has not passed" do
      expect { item_out_of_date.update }.to change { item_out_of_date.quality }.by(-2)
    end
    it "does not reduce quality below 0" do
      expect { item_quality_0.update }.to_not change { item_quality_0.quality }
    end
  end
end
