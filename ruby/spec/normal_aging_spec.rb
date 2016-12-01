require 'normal_aging'

describe NormalAging do
  let(:dummy_class) { Class.new { include NormalAging } }
  let(:item) { double("Item", :name => "item", :quality => 10, :sell_in => 8) }

  describe "#reduce_quality", focus: true do
    it "reduces the item's quality by 1 when passed 1" do
      # allow(item).to receive(:quality)
      expect { dummy_class.new.reduce_quality(item,1) }.to change{ item.quality }.by(-1)
    end
  end


end
