#
class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '' #<%= rankName %> of <%= suitName %>

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    # @$el.css 'background-image': "url(img/cards/#{@model.attributes.rankName}-#{@model.attributes.suitName}.png)"
    @$el.addClass 'covered' unless @model.get 'revealed'

