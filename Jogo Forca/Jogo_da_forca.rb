require_relative 'ui'
require_relative 'rank'

def escolhendo_palavra_secreta
    avisa_escolhendo_palavra
    texto = File.read "dicionario.txt"
    palavras = texto.split "\n"
    indice = rand palavras.size
    palavra_secreta = palavras[indice]
    avisa_palavra_escolhida palavra_secreta
    palavra_secreta.downcase
end

def escolhendo_palavra_secreta_sem_consumir_muita_memoria
    avisa_escolhendo_palavra
    arquivo = File.new("dicionario.txt")
    quantidade_de_palavras = arquivo.gets.to_i
    indice = rand(quantidade_de_palavras)

    puts arquivo.gets.to_i

    for linhas in 1..(indice)
        arquivo.gets
    end
    palavra_secreta = arquivo.gets.strip.downcase
    arquivo.close    
    avisa_palavra_escolhida palavra_secreta

    #puts palavra_secreta

    palavra_secreta.downcase
end

def palavra_mascarada chutes, palavra_secreta
    mascara = ""
    for letra in palavra_secreta.chars
        if chutes.include? letra
            mascara << letra
        else
            mascara << "-"
        end
    end
    mascara
end

def acertou_letra?(chute, palavra_secreta)
    letra_procurada = chute[0]
    total_encontrado = palavra_secreta.count letra_procurada
    if total_encontrado == 0
        avisa_letra_nao_encontrada
        return false
    end
    avisa_letra_encontrada total_encontrado
    true
end

def mascara_completa? mascara, palavra_secreta
    if mascara == palavra_secreta
        return true
    end  
    false
end


def pede_chute_valido erros, chutes, mascara
    cabecalho_de_tentativas erros, chutes, mascara
    loop do 
        
        chute = pede_chute 
        if chutes.include? chute
            avisa_chute_efetuado chute
        else
            return chute
        end
    end
end

def verifica_melhor_pontuacao pontos_totais, melhor_jogador
    if melhor_jogador[1].to_i < pontos_totais.to_i 
        return true
    end
    false
end


def joga(nome)

    palavra_secreta = escolhendo_palavra_secreta_sem_consumir_muita_memoria
    erros = 0
    pontos_ate_agora = 0
    chutes = []

    while erros < 5
        mascara = palavra_mascarada chutes, palavra_secreta

        break if mascara_completa? mascara, palavra_secreta

        chute = pede_chute_valido erros, chutes, mascara

        chutes << chute

        chutou_uma_letra = chute.size == 1
        if chutou_uma_letra
            acertou = acertou_letra? chute, palavra_secreta
            if acertou
                pontos_ate_agora += 5
            else
                pontos_ate_agora -= 1
                erros +=1
            end
        else
            acertou = acertou_palavra? palavra_secreta, chute
            if acertou
                avisa_acertou_palavra 
                pontos_ate_agora += 100
                break
            else
                avisa_errou_palavra
                pontos_ate_agora -= 30
                erros += 1
            end
        end

        

    end
    limpar_tela

    avisa_game_over pontos_ate_agora, palavra_secreta
    pontos_ate_agora
end

def jogo_da_forca
    nome = da_boas_vindas
    pontos_totais = 0
    melhor_jogador = le_rank
    loop do
        pontos_totais += joga nome

        avisa_pontos_totais pontos_totais
        avisa_melhor_jogador melhor_jogador

        if verifica_melhor_pontuacao pontos_totais, melhor_jogador
            salva_rank nome, pontos_totais
            melhor_jogador = le_rank
        end
        break if nao_quer_jogar?
    end
end