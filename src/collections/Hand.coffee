class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->


  hit: ->
    @add(@deck.pop())
    console.log @maxScore()
    if @maxScore() > 21
      console.log "from if statement"
      @trigger 'bust', @
      console.log "you suck"



  stand: ->
    @at(0).flip()

    while $('.score:last').text() < 17
      @add(@deck.pop())

    if $('.score:last').text() > 21
      console.log "Player Wins"

    if $('.score:last').text() < 22 and $('.score:last').text() > 16
      if $('.score:last').text() is $('.score:first').text()
        console.log "Tie" 
      else if $('.score:first').text() > $('.score:last').text()
        console.log "Player Wins"
      else if $('.score:last').text() > $('.score:first').text()
        console.log "Dealer Wins"


  maxScore: ->
    if @scores()[1]>21
      @scores()[0]
    else
      @scores()[1]


  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0
    

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0


  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]




