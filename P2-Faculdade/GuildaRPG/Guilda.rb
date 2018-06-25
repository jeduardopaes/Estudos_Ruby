class Guilda

  attr_reader :personagens

  def initialize
    @personagens = Array.new
  end

  def adicionarPersonagem(personagem)
    unless(possuiPersonagem?(personagem)) 
      @personagens << personagem
    end
  end

  def removerPersonagem(personagem)
    if(!possuiPersonagem?(personagem))
      return nil
    end
    @personagens.delete(personagem)
  end

  def forcaTotal
    @personagens.map(&:ataqueBasico).sum
  end

  def vidaTotal
    @personagens.map(&:hp).sum
  end

  def totalDePersonagens
    @personagens.size
  end

  def removerAleatorio
    @personagens.shuffle!.delete(@personagens.first)
  end

  private

  def possuiPersonagem?(personagem)
    @personagens.include?(personagem)
  end

end