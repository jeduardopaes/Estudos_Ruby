class Personagem

  attr_reader :nome, :tipo, :ataqueBasico, :hp, :vivo

  def initialize(nome, tipo, ataqueBasico, hp)
    @nome = nome
    @tipo = tipo
    @ataqueBasico = ataqueBasico
    @hp = hp
    @vivo = true
  end

  def atacar(personagem)
    personagem.perdeVida(@ataqueBasico) 
  end

  def perdeVida(valor)
    @hp -= valor
    if(@hp <= 0 )
      morrer
    end
  end

  def assassinar(guilda)
    guilda.removerAleatorio
  end


  private

  def morrer
    @vivo = !@vivo
  end

end