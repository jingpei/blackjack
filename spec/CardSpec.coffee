assert = chai.assert

describe "deck constructor", ->

  it "should create a card collection", ->
    collection = new Deck()
    assert.strictEqual collection.length, 52

  it "should decrease deck length to call dealPlayer and dealDealer", ->
    collection = new Deck()
    collection.dealDealer()
    collection.dealPlayer()
    assert.strictEqual collection.length, 48


