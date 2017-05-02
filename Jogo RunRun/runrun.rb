require_relative 'ui'
require_relative 'heroi'

def le_mapa numero_do_mapa
    arquivo = "mapa#{numero_do_mapa}.txt"
    texto = File.read arquivo 
    mapa = texto.split "\n"
end

def posicao_valida? mapa, posicao
    valor_atual = mapa[posicao[0]][posicao[1]]
    linhas = mapa.size
    colunas = mapa[0].size
    estorou_linhas = posicao[0] < 0 || posicao[0] >= linhas
    estorou_colunas = posicao[1] < 0 || posicao[1] >= colunas
    muro = "X"
    fantasma = "F"
    
    colidiu_com_entidade = valor_atual == muro || valor_atual == fantasma

    if estorou_linhas || estorou_colunas
        return false
    elsif colidiu_com_entidade
        return false
    end
    true
end

#=============HEROI=============================

def encontra_jogador mapa
    caracter_do_heroi = "H"
    mapa.each_with_index do |linha_atual, linha|
        coluna_do_heroi = linha_atual.index caracter_do_heroi
        if coluna_do_heroi
            jogador = Heroi.new
            jogador.linha = linha
            jogador.coluna = coluna_do_heroi
            return jogador
        end
    end
    nil
end

def movimenta_heroi mapa
    direcao = pede_movimento
    heroi = encontra_jogador mapa
    nova_posicao = heroi.calcula_nova_posicao direcao
    if posicao_valida? mapa, nova_posicao.to_array
        mapa[heroi.linha][heroi.coluna] = " "
        mapa[nova_posicao.linha][nova_posicao.coluna] = "H"
    end
end

#========================================================

#===================FANTASMAS============================

def movimenta_fantasmas mapa
    caracter_do_fantasma = "F"
    novo_mapa = copia_mapa mapa
    mapa.each_with_index do |linha_atual, linha|
        linha_atual.chars.each_with_index do |caracter_atual, coluna|
            eh_fantasma = caracter_atual == caracter_do_fantasma
            if eh_fantasma
                move_fantasma mapa, novo_mapa, linha, coluna
            end
        end
    end
    novo_mapa
end

def copia_mapa mapa
    novo_mapa = mapa.join("\n").tr("F", " ").split "\n"
end

def soma_vetor vet1, vet2
    [vet1[0] + vet2[0], vet1[1] + vet2[1]]
end

def posicoes_validas_a_partir_de mapa, novo_mapa, posicao
    posicoes = []
    movimentos = [[+1,0],[0,+1],[-1,0],[0,-1]]
    
    movimentos.each do |movimento|
        nova_posicao = soma_vetor movimento, posicao
        if (posicao_valida? mapa, nova_posicao) && (posicao_valida? novo_mapa, nova_posicao)
            posicoes << nova_posicao
        end
    end

    posicoes
end

def move_fantasma mapa, novo_mapa, linha, coluna
    posicoes = posicoes_validas_a_partir_de mapa, novo_mapa, [linha, coluna]
    return if posicoes.empty?
    
    aleatorio = rand posicoes.size
    posicao = posicoes[aleatorio]
    mapa[linha][coluna] = " "
    novo_mapa[posicao[0]][posicao[1]] = "F"
end

#========================================================

def jogador_perdeu? mapa
    perdeu = !encontra_jogador(mapa)
end

def joga nome
    mapa = le_mapa 2
    while true
        desenha_mapa mapa
        movimenta_heroi mapa
        mapa = movimenta_fantasmas mapa

        if jogador_perdeu?(mapa)
            game_over
            break
        end

    end
end

def inicia_runrun
    nome = da_boas_vindas
    joga nome
end