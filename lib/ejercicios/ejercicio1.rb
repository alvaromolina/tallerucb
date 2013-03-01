class ErrorNumeroJugadores < StandardError ; end 
class NoExisteMovida < StandardError ; end 
 
def comparar?(game)
  return (game[0][1] + game[1][1]) =~ /rt|tp|pr|rr|tt|pp/i
end

def juego_rpt(game)
  strategy=["r","p","t"]
  raise ErrorNumeroJugadores unless game.length == 2
  if strategy.include?(game[0][1].downcase) && strategy.include?(game[1][1].downcase)
    if comparar?(game)
      game[0]
    else
      game[1]
    end
  else
    raise NoExisteMovida
  end
end
 
def torneo_rpt(game)
  if game[0][1].class==String
    juego_rpt(game)
  else  
    a1=torneo_rpt(game[0])
    a2=torneo_rpt(game[1])
    torneo_rpt([a1,a2])
  end
end
