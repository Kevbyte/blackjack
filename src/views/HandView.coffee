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
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el.css 'background-image': "url(img/cards/#{card.attributes.rankName}-#{card.attributes.suitName}.png)"
    
    @$('.score').text @collection.maxScore()

    # if $('.score:last').text() > 21
    #   console.log "Player Wins"

    # if $('.score:last').text() < 22 and $('.score:last').text() > 16
    #   if $('.score:last').text() is $('.score:first').text()
    #     console.log "Tie" 
    #   else if $('.score:first').text() > $('.score:last').text()
    #     console.log "Player Wins"
    #   else if $('.score:last').text() > $('.score:first').text()
    #     console.log "Dealer Wins"

    
    