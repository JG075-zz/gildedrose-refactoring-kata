# GildedRose Refactoring Kata

A kata challenge to refactor messy code.

## Structure

A main file called "gilded_rose.rb" and a spec file for testing.

## Setup

To run the app:

```
$ git clone [REPO]
$ cd gildedrose-refactoring-kata
$ irb
$ require_relative "./gilded_rose"
```

## Example

Inside IRB:

```
$ items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 1)]
$ gildedRose = GildedRose.new(items)
$ gildedRose.update_quality
```

## Testing

To test the app:

```
$ rspec
```
