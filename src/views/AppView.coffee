class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()

  initialize: ->
    # @model.get('playerHand').on 'endGame', alert "this worked in AppView", @
    @end()
    @dealer()
    @render()

  render: ->
    console.log @$el
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el


  end : ->
    @model.get 'playerHand' 
      .on 'endGame', => 
        alert 'You lose, loser!'
        # @set(@model, new App())
        # @model = new App()
        @model.reset()
        @end()
        @dealer()
        @render()
        #reassign the playerHand

  dealer : ->
    @model.get 'playerHand'
      .on 'dealerTurn', =>  #what is the this of the dealer? @model.get 'dealerHand'
        #flip dealers card
        @model.get('dealerHand').at(0).flip()
        @render
        #while total < 17, add cards to dealer 
        scores = @model.get('dealerHand').scores()
        minDealer = Math.min scores[0], scores[1]
        while (minDealer < 17)
          @model.get('dealerHand').hit()
          scores = @model.get('dealerHand').scores()
          minDealer = Math.min scores[0], scores[1]
        #if dealer < 21 && dealer > player, dealer wins
        scores = @model.get('playerHand').scores()
        minPlayer = Math.min scores[0], scores[1] 
        # if min <21 and min > @model.get('playerHand').
        if minDealer < 21 and minDealer > minPlayer
          alert ('Dealer wins!')
        #else player wins
        else if minDealer == minPlayer
          alert ('Game push')
        else 
          alert ('Miracles exist!')
        @model.reset()
        @dealer()
        @end()
        @render()

#    @collection.on 'add remove change', => @render()
