# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'busted', 0

  newGame: ->
    @get('playerHand').on 'bust', => 
      console.log "wow"
      @set 'deck', deck = new Deck()
      @set 'playerHand', @get('deck').dealPlayer()
      @set 'dealerHand', @get('deck').dealDealer()
      busted = @get 'busted'
      @set 'busted', busted+1

  reDeal: ->
      console.log "wow"
      @set 'deck', deck = new Deck()
      @set 'playerHand', deck.dealPlayer()
      @set 'dealerHand', deck.dealDealer()
      busted = @get 'busted'
      @set 'busted', busted+1

# if $('.score:last').text() > 21
#   console.log "Player Wins"

# if $('.score:last').text() < 22 and $('.score:last').text() > 16
#   if $('.score:last').text() is $('.score:first').text()
#     console.log "Tie" 
#   else if $('.score:first').text() > $('.score:last').text()
#     console.log "Player Wins"
#   else if $('.score:last').text() > $('.score:first').text()
#     console.log "Dealer Wins"