#1
def boas_vindas()
    puts "Bem vindo ao jogo da forca"
    puts "Qual o seu nome?"
    nome = gets.strip
    puts "\n\n\n\n"
    puts "Começaremos o jogo para você, #{nome}"
    return nome
end

#2
def palavra_secreta()
    puts "Escolhendo palavra secreta"
    palavra_secreta = "Programador"
    puts "Palavra secreta com #{palavra_secreta.size} letras escolhida, boa sorte"
    return palavra_secreta
end

#FINAL
def jogar_novamente?()
    puts "Deseja jogar novamente? (S/N)"
    quero_jogar = gets.strip.upcase
    if quero_jogar == "S"
        home()
    end
end

#MAIN
def home()
    nome_jogador = boas_vindas()
    palavra_secreta_escolhida = palavra_secreta()
    jogar_novamente?()
end

home()
