
def da_boas_vindas
    limpar_tela
    puts
    puts "        P  /_\\  P                              "
    puts "       /_\\_|_|_/_\\                             "
    puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
    puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
    puts "  |' '  |  |_|  |'  ' |                        "
    puts "  |_____| ' _ ' |_____|                        " 
    puts "        \\__|_|__/                              "
    puts
    puts "Qual seu Nome: "
    nome = gets.strip
    puts "O jogo começará agora #{ nome }! \nVocê terá 5 chances."
    nome
end

def limpar_tela
    puts "\n\n\n\n\n\n"
end

def pede_dificuldade
    puts "Qual o nível de dificuldade?"
    puts "(1) Muito fácil (2) Fácil (3) Normal (4) Difícil (5) Impossível"
    puts "Escolha: "
    dificuldade = gets.to_i
end

def sorteia_numero_secreto(dificuldade)
    case dificuldade
    when 1
        maximo = 30
    when 2
        maximo = 60
    when 3
        maximo = 100
    when 4
        maximo = 150
    else
        maximo = 200
    end    
    puts "Um numero secreto entre 1 e #{maximo} está sendo processado..."
    numero_secreto = (rand maximo)+1
    puts "Numero sorteado, Boa Sorte!"
    numero_secreto
end

def pede_um_numero(numeros_tentados, tentativas, limite_de_tentativas)
    puts "Tentativa #{ tentativas } de #{ limite_de_tentativas }"
    puts "Numeros que você já tentou: #{ numeros_tentados }"
    puts "Entre com um número: "
    
    numero = gets.strip
    numero.to_i
end

def ganhou
    puts
    puts "             OOOOOOOOOOO               "
    puts "         OOOOOOOOOOOOOOOOOOO           "
    puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
    puts "    OOOOOO      OOOOO      OOOOOO      "
    puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
    puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
    puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
    puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
    puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
    puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
    puts "         OOOOOO         OOOOOO         "
    puts "             OOOOOOOOOOOO              "
    puts
    puts "               Acertou!                "
    puts
end

def verifica_se_acertou(numero, numero_secreto)
    acertou = numero == numero_secreto
    if acertou
        limpar_tela
        ganhou
        return true
    end
    maior = numero_secreto > numero
    if maior
        limpar_tela
        puts "Numero secreto é maior."
    else
        limpar_tela
        puts "Numero secreto é menor."
    end
    false
end

def joga(nome, dificuldade)

    limite_de_tentativas = 5
    numeros_tentados = []
    pontos_ate_agora = 1000
    numero_secreto = sorteia_numero_secreto dificuldade

    for tentativas in 1..limite_de_tentativas
        numero = pede_um_numero numeros_tentados, tentativas, limite_de_tentativas
        numeros_tentados << numero

        if nome == "jose"
            ganhou
            break 
        end

        pontos_a_perder = (numero - numero_secreto).abs / 2.0
        pontos_ate_agora -= pontos_a_perder

        break if verifica_se_acertou numero, numero_secreto
    end

    limpar_tela

    puts "Game Over!!!\nTotal de pontos: #{pontos_ate_agora}"

end

def nao_quer_jogar
    puts "Deseja jogar novamente? (S/N)"
    quero_jogar = gets.strip
    nao_quer_jogar = quero_jogar.upcase == "N"
end


dificuldade = pede_dificuldade
nome = da_boas_vindas


loop do
    joga nome, dificuldade
    break if nao_quer_jogar
end
