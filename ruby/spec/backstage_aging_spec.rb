require 'backstage_aging'

describe Backstage do
  let(:backstage) { described_class.new("backstage",0,0) }
  let(:backstage_past) { described_class.new("backstage",-3,0) }
  let(:backstage_future) { described_class.new("backstage",10,8) }

  describe "#initialize" do
    it "has a name" do
      expect(backstage.name).to eq "backstage"
    end
    it "has a sell_in" do
      expect(backstage.sell_in).to eq 0
    end
    it "has a quality" do
      expect(backstage.quality).to eq 0
    end
  end

  describe "#update" do
    it "reduces sell in by 1" do
      expect { backstage.update }.to change { backstage.sell_in }.by(-1)
    end
    it "increases quality by 2, when the sell in is 10" do
      expect { backstage_future.update }.to change { backstage_future.quality }.by(2)
    end
  end
end
