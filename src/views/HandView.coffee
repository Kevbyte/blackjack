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
      new CardView(model: card).$el
    
    if @collection.scores()[1]>21
      @$('.score').text @collection.scores()[0]
    else
      @$('.score').text @collection.scores()[1]

    if $('.score:first').text() > 21
      alert "Dealer Wins"
      console.log $('.score:first').text()
      console.log $('.score:last').text()

    if $('.score:last').text() > 21
      alert "Player Wins"
      console.log $('.score:first').text()
      console.log $('.score:last').text()

    if $('.score:last').text() < 22 and $('.score:last').text() > 16
      if $('.score:last').text() is $('.score:first').text()
        alert "Tie" 
      else if $('.score:first').text() > $('.score:last').text()
        alert "Player Wins"
        console.log $('.score:first').text()
        console.log $('.score:last').text()
      else if $('.score:last').text() > $('.score:first').text()
        alert "Dealer Wins"
        console.log $('.score:first').text()
        console.log $('.score:last').text()
  
    