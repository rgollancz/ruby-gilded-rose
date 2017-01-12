require 'backstage_aging'

describe Backstage do
  let(:backstage) { described_class.new("backstage",0,0) }

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

end
