class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<%= rankName %> of <%= suitName %>'

  initialize: -> @render()

  render: ->
    setTimeout =>
      @$el.children().detach()
      @$el.html @template @model.attributes
      @$el.addClass 'covered' unless @model.get 'revealed'
    ,500

