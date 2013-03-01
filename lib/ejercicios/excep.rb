require './ejercicio1.rb'


begin
  puts juego_rpt([['Juan','R'],['Pedro','A']])
  #resto codigo...
  #
  #
rescue NoExisteMovida => err
  puts 'Error jugada que no existe' + err.message
rescue NoExisteMovida => err
  puts 'Error numero de jugadores equivocados ' + err.message
ensure  
  puts 'Final del codigo'
end
