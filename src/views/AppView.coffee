#
class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button> <button class="re-deal-button">Re-Deal</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> 
      @model.get('playerHand').hit()
      @model.newGame()
    'click .stand-button': -> 
      @model.get('dealerHand').stand()
    'click .re-deal-button': ->
      @model.reDeal()

  initialize: ->
    @render()
    @model.on 'change:busted', =>
      console.log "should refresh the game"
      @render()


  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

