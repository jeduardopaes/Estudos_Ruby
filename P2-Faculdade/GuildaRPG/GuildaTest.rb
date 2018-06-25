require 'minitest/autorun'
require 'minitest/pride'
require_relative './Guilda.rb'
require_relative './Personagem.rb'

class GuildaTest < Minitest::Test

  describe :adicionaPersonagem do
    
    before do
      @guilda = Guilda.new
      @personagem = Personagem.new('Zé', 'Ladino', 5, 10)
    end

    it 'Deve Adicionar um Personagem' do
      @guilda.adicionarPersonagem(@personagem)
      @guilda.personagens.must_equal [@personagem]
    end

    it 'Verifica quantidade de personagens na guilda' do
      @guilda.adicionarPersonagem(@personagem)
      @guilda.totalDePersonagens.must_equal 1
    end

    it 'Não deve adicionar um personagem que já está na guilda' do
      @guilda.adicionarPersonagem(@personagem)
      @guilda.adicionarPersonagem(@personagem)
      @guilda.totalDePersonagens.must_equal 1
    end

  end

  describe :removerPersonagem do

    before do
      @guilda = Guilda.new
      @personagem = Personagem.new('Zé', 'Ladino', 5, 10)
      @personagem2 = Personagem.new('Rob', 'Mago', 2, 5)

      @guilda.adicionarPersonagem(@personagem2)
      @guilda.adicionarPersonagem(@personagem)

    end

    it 'Deve remover um personagem' do
      @guilda.removerPersonagem(@personagem2)
      @guilda.totalDePersonagens.must_equal 1
    end

    it 'Deve remover o personagem correto' do
      @guilda.removerPersonagem(@personagem2)
      @guilda.personagens.select{|per| per.nome == @personagem2.nome}.empty?.must_equal true
    end

    it 'Deve retornar um erro se tentar remover personagem que não está na guilda' do
      @guilda.removerPersonagem(@personagem2)
      @guilda.removerPersonagem(@personagem2).must_be_nil
    end

  end

  describe :forcaTotal do

    before do
      @guilda = Guilda.new
      @personagem = Personagem.new('Zé', 'Ladino', 5, 10)
      @personagem2 = Personagem.new('Rob', 'Mago', 2, 5)

      @guilda.adicionarPersonagem(@personagem2)
      @guilda.adicionarPersonagem(@personagem)

    end

    it 'Deve retornar a soma das forças dos personagens da guilda' do
      @guilda.forcaTotal.must_equal 7
    end
  end

  describe :vidaTotal do

    before do
      @guilda = Guilda.new
      @personagem = Personagem.new('Zé', 'Ladino', 5, 10)
      @personagem2 = Personagem.new('Rob', 'Mago', 2, 5)

      @guilda.adicionarPersonagem(@personagem2)
      @guilda.adicionarPersonagem(@personagem)

    end

    it 'Deve retornar a soma das forças dos personagens da guilda' do
      @guilda.vidaTotal.must_equal 15
    end
  end

  describe :removerAleatorio do

    before do
      @guilda = Guilda.new
      @personagem = Personagem.new('Zé', 'Ladino', 5, 10)
      @personagem2 = Personagem.new('Rob', 'Mago', 2, 5)

      @guilda.adicionarPersonagem(@personagem2)
      @guilda.adicionarPersonagem(@personagem)

    end

    it 'Deve remover um personagem' do
      @guilda.removerAleatorio
      @guilda.totalDePersonagens.must_equal 1
    end
  end

end