#
class window.HandView extends Backbone.View
  className: 'hand'

  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change', => @render()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    # @$el.children().css 'background-image': "url(img/cards/#{@model.attributes.rankName}-#{@model.attributes.suitName}.png)"
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el.css 'background-image': "url(img/cards/#{card.attributes.rankName}-#{card.attributes.suitName}.png)"
    
    if @collection.scores()[1]>21
      @$('.score').text @collection.scores()[0]
    else
      @$('.score').text @collection.scores()[1]

    if $('.score:first').text() > 21
      console.log "Dealer Wins"

    if $('.score:last').text() > 21
      console.log "Player Wins"

    if $('.score:last').text() < 22 and $('.score:last').text() > 16
      if $('.score:last').text() is $('.score:first').text()
        console.log "Tie" 
      else if $('.score:first').text() > $('.score:last').text()
        console.log "Player Wins"
      else if $('.score:last').text() > $('.score:first').text()
        console.log "Dealer Wins"
    