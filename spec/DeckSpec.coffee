assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should give the last card from the hand', ->
      assert.strictEqual deck.length, 50
      cardCheck = deck.at(deck.length - 1)
      hand.hit()
      assert.strictEqual cardCheck, hand.at(hand.length - 1)

    it 'should have no cards to give', ->
      assert.strictEqual deck.length, 50
      array = [1..51]
      for item in array 
        hand.hit()
      card = deck.pop()
      assert.strictEqual card, undefined  

  # describe 'hit', ->
  #   it 'should give the last card from the deck', ->
  #     assert.strictEqual deck.length, 50
  #     assert.strictEqual deck.last(), hand.hit()
  #     assert.strictEqual deck.length, 49
