require 'minitest/autorun'
require 'minitest/pride'
require_relative './Personagem'
require_relative './Guilda'

class PersonagemTest < Minitest::Test

  describe :ataqueBasico do
    
    def setup
      @personagem = Personagem.new('Zé', 'Ladino', 5, 10)
    end

    it 'Deve mostrar o dano causado pelo ataque básico.' do
      @personagem.ataqueBasico.must_equal 5
    end

  end

  describe 'Batalha' do
    
    def setup
      @personagem = Personagem.new('Zé', 'Ladino', 5, 10)
      @personagem2 = Personagem.new('Rob', 'Mago', 2, 5)
    end

    it 'Deve retirar HP do personagem que receber um ataque' do
      @personagem2.atacar(@personagem)
      @personagem.hp.must_equal 8
    end

    it 'Personagem deve morrer se vida chegar a 0' do
      @personagem2.perdeVida(5)
      @personagem2.vivo.must_equal false
    end

  end

end