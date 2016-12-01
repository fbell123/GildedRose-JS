describe GildedRose do

  before(:each) do
    @item1 = [Item.new('Aged Brie', 20, 15)]
    @rose1 = GildedRose.new(@item1)
    @item2 = [Item.new('Something tasty', 15, 20)]
    @rose2 = GildedRose.new(@item2)
    @item3 = [Item.new('Sulfuras, Hand of Ragnaros', 5, 10)]
    @rose3 = GildedRose.new(@item3)
  end

  describe "#update_quality" do
    it "does not change the name" do
      @rose1.update_quality()
      expect(@item1[0].name).to eq "Aged Brie"
      @rose2.update_quality()
      expect(@item2[0].name).to eq "Something tasty"
    end

    it 'changes the quality after each update' do
      @rose1.update_quality()
      expect(@item1[0].quality).to eq 16
    end

    it 'decreases the sell in number after each update' do
      @rose2.update_quality()
      expect(@item2[0].sell_in).to eq 14
    end

    it 'cannot decrease quality futher than 0' do
      21.times{@rose2.update_quality()}
      expect(@item2[0].quality).to eq 0
    end

    context 'Sulfuras tests' do
      it 'does not change the sell in number after update' do
        @rose3.update_quality()
        expect(@item3[0].sell_in).to eq 5
      end
    end

  end


end
