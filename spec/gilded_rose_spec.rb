# require File.join(File.dirname(__FILE__), 'gilded_rose')
require_relative '../gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq "foo"
    end

    it "decreases the sell_in value" do
      items = [Item.new("foo", 1, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 0
    end

    it "decreases the quality value" do
      items = [Item.new("foo", 1, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 9
    end

    it "decreases the quality twice as fast" do
      items = [Item.new("foo", 1, 10)]
      gildedRose = GildedRose.new(items)
      gildedRose.update_quality
      gildedRose.update_quality
      expect(gildedRose.items[0].quality).to eq 7
    end

    it "doesn't allow the quality of an item to be negative" do
      items = [Item.new("foo", 1, 1)]
      gildedRose = GildedRose.new(items)
      gildedRose.update_quality
      gildedRose.update_quality
      expect(gildedRose.items[0].quality).to eq 0
    end

    it "increases the quality of Aged Brie" do
      items = [Item.new("Aged Brie", 1, 1)]
      gildedRose = GildedRose.new(items)
      gildedRose.update_quality
      expect(gildedRose.items[0].quality).to eq 2
    end

    it "doesn't allow the quality of an item to increase more than 50" do
      items = [Item.new("Aged Brie", 1, 49)]
      gildedRose = GildedRose.new(items)
      gildedRose.update_quality
      gildedRose.update_quality
      expect(gildedRose.items[0].quality).to eq 50
    end

    it "doesn't change the quality of Sulfuras" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 1, 1)]
      gildedRose = GildedRose.new(items)
      gildedRose.update_quality
      gildedRose.update_quality
      expect(gildedRose.items[0].quality).to eq 1
    end

    it "doesn't change the sell_in of Sulfuras" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 1, 1)]
      gildedRose = GildedRose.new(items)
      gildedRose.update_quality
      gildedRose.update_quality
      expect(gildedRose.items[0].sell_in).to eq 1
    end

    it "increase the quality of ETC backstage passes by 2" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 8, 1)]
      gildedRose = GildedRose.new(items)
      gildedRose.update_quality
      expect(gildedRose.items[0].quality).to eq 3
    end

    it "increase the quality of ETC backstage passes by 3" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 1)]
      gildedRose = GildedRose.new(items)
      gildedRose.update_quality
      expect(gildedRose.items[0].quality).to eq 4
    end

    it "changes the quality of ETC backstage passes to 0" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 1)]
      gildedRose = GildedRose.new(items)
      gildedRose.update_quality
      expect(gildedRose.items[0].quality).to eq 0
    end


  end

end
