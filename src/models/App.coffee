# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer() 
    # @get 'playerHand' 
    #   .on 'endGame', -> 
    #     alert 'You lose, loser!'
    #     #restart
    console.log 'return this instead'

# @get('playerHand').add(deck.pop()÷)

  reset: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer() 
    # @get 'playerHand' 
    #   .on 'endGame', -> 
    #     alert 'You lose, loser!'
    #     #restart
    console.log 'return this instead'

#    @collection.on 'add remove change', => @render()