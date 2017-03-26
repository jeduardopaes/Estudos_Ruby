def limpar_tela
    puts "\n\n\n\n\n\n"
end

def da_boas_vindas
    limpar_tela
    puts
    puts "        P  /_\\  P                              "
    puts "       /_\\_|_|_/_\\                             "
    puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
    puts "   |_|_|nnnn nnnn|_|_|        Jogo de Forca!   "
    puts "  |' '  |  |_|  |'  ' |                        "
    puts "  |_____| ' _ ' |_____|                        " 
    puts "        \\__|_|__/                              "
    puts
    puts "Qual seu Nome: "
    nome = gets.strip
    puts "O jogo começará agora #{ nome }! \nVocê terá 5 chances."
    nome
end

def avisa_escolhendo_palavra
    puts "Escolhendo palavra secreta"
end

def avisa_palavra_escolhida palavra_secreta
    puts "Palavra secreta com #{palavra_secreta.size} letras."
end

def cabecalho_de_tentativas erros, chutes, mascara
    puts "Erros até agora: #{erros}."
    puts "Palavra até agora: #{mascara}"
    puts "Chutes até agora: #{chutes}"
end

def pede_chute 
    puts "Digite uma letra ou palavra: "
    chute = gets.strip
end

def acertou_palavra?(palavra_secreta, chute)
    if chute.downcase == palavra_secreta.downcase
        puts "Acertou a palavra!!"
        return true
    end
    puts "Você errou!!"
    false
end

def nao_quer_jogar?
    puts "Deseja jogar novamente? (S/N)"
    quero_jogar = gets.strip
    nao_quer_jogar = quero_jogar.upcase == "N"
end

def avisa_acertou_palavra
    puts "Parabéns!! Acertou!!"
end

def avisa_errou_palavra
    puts "Que pena errou..."
end

def avisa_chute_efetuado(chute)
    puts "Você ja chutou #{chute}"
end

def avisa_letra_nao_encontrada
    puts "Letra não econtrada."
end

def avisa_letra_encontrada total_encontrado
    puts "Letra encontrada #{total_encontrado} vezes."
end

def avisa_game_over pontos_ate_agora
    puts "Game Over!!!\nTotal de pontos: #{pontos_ate_agora}"
end