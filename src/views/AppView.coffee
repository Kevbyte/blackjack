#
class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('dealerHand').stand()
    # 'click .stand-button': -> @model.get('dealerHand').

  initialize: ->
    @render()
        if $('.score:first').text() > 21
      alert "Dealer Wins"

    if $('.score:last').text() > 21
      alert "Player Wins"

    if $('.score:last').text() < 22 and $('.score:last').text() > 16
      if $('.score:last').text() is $('.score:first').text()
        alert "Tie" 
      else if $('.score:first').text() > $('.score:last').text()
        alert "Player Wins"
      else if $('.score:last').text() > $('.score:first').text()
        alert "Dealer Wins"

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

