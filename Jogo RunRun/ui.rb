def da_boas_vindas
    puts "Bem vindo ao RunRun!"
    puts "Digite seu nome:"
    nome = gets
    puts "Boa Sorte #{nome}"
    nome
end

def desenha_mapa mapa
    puts mapa
end

def pede_movimento
    puts"Para onde irá se mover: (W/A/S/D)"
    movimento = gets.upcase.strip
end

def game_over
    puts "==========================="
    puts "||       GAME-OVER       ||"
    puts "==========================="
end