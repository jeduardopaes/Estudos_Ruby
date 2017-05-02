def limpar_tela
    puts "\n\n\n\n\n\n"
end

def da_boas_vindas
    limpar_tela
    puts "/****************/"
    puts "/ Jogo de Forca */"
    puts "/****************/"
    puts "Qual seu Nome: "
    nome = gets.strip
    puts "O jogo começará agora #{ nome }! \nVocê terá 5 chances."
    nome
end

def desenha_forca(erros)
    cabeca = "   "
    corpo = " "
    pernas = "   "
    bracos = "   "
    if erros >= 1
        cabeca = "(_)"
    end
    if erros >= 2
        bracos = " | "
        corpo = "|"
    end
    if erros >= 3
        bracos = "\\|/"
    end
    if erros >= 4
        pernas = "/ \\"
    end

    puts "  _______       "
    puts " |/      |      "
    puts " |      #{cabeca}  "
    puts " |      #{bracos}  "
    puts " |       #{corpo}  "
    puts " |      #{pernas}  "
    puts " |              "
    puts "_|___           "
    puts

end

def avisa_escolhendo_palavra
    puts "Escolhendo palavra secreta"
end

def avisa_palavra_escolhida palavra_secreta
    puts "Palavra secreta com #{palavra_secreta.size} letras."
end

def cabecalho_de_tentativas erros, chutes, mascara
    desenha_forca erros
    puts "Erros até agora: #{erros}."
    puts "Palavra até agora: #{mascara}"
    puts "Chutes até agora: #{chutes}"
end

def pede_chute 
    puts "Digite uma letra ou palavra: "
    chute = gets.strip.downcase
end

def acertou_palavra?(palavra_secreta, chute)
    if chute.downcase == palavra_secreta.downcase
        puts "\nParabéns, você ganhou!"
        puts

        puts "       ___________      "
        puts "      '._==_==_=_.'     "
        puts "      .-\\:      /-.    "
        puts "     | (|:.     |) |    "
        puts "      '-|:.     |-'     "
        puts "        \\::.    /      "
        puts "         '::. .'        "
        puts "           ) (          "
        puts "         _.' '._        "
        puts "        '-------'       "
        puts
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

def avisa_game_over pontos_ate_agora, palavra_secreta
    puts "A palavra secreta era: #{palavra_secreta}\nGame Over!!!\nTotal de pontos: #{pontos_ate_agora}"
end

def avisa_pontos_totais pontos_totais
    puts "Você possui #{pontos_totais} pontos."
end

def avisa_melhor_jogador melhor_jogador
    puts "Melhor Jogador: #{melhor_jogador[0]} possui #{melhor_jogador[1]} pontos."
end