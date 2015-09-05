class window.HandView extends Backbone.View
  className: 'hand'

  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change', => @render()
    @render()

  render: ->
    # setTimeout =>                 Makes render slow. Doesn't help loading cards
      @$el.children().detach()
      @$el.html @template @collection
      @$el.append @collection.map (card) ->
        new CardView(model: card).$el
      @$('.score').text @collection.scores()[0]
      # console.log('delay')
    # ,1000

