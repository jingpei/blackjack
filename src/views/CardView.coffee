class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<img src="./img/cards/<%= rankName %>-<%= suitName %>.png">'

  initialize: -> 
    @render()

  render: ->
    # setTimeout =>               #doesn't effect Dealer Hand loading
      @$el.children().detach()
      @$el.html @template @model.attributes
      @$el.addClass 'covered' unless @model.get 'revealed'
    # ,1000

#We need a way to take the rankName and then "-" and then suitName