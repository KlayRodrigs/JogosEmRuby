def boas_vindas()
    puts "Bem vindo ao jogo da forca"
    puts "Qual o seu nome?"
    nome = gets.strip.to_s.capitalize
    puts "\n\n"
    puts "Começaremos o jogo para você, #{nome}"
    return nome
end
#AQUI VOCÊ MODIFICA A PALAVRA SECRETA
def palavra_secreta()
    puts "Escolhendo palavra secreta..."
    palavra_secreta = "Programador Ruby".upcase
    puts "Palavra secreta com #{palavra_secreta.size} letras escolhida, boa sorte.\n\n"
    return palavra_secreta
end
def jogar_novamente?()
    puts "Deseja jogar novamente? (S/N)"
    quero_jogar = gets.strip.upcase
    if quero_jogar == "S"
        main()
    end
end
def pede_um_chute(erros, chutes)
    puts "\n\nNúmero de erros: #{erros}"
    puts "Letras chutadas #{chutes}"

    puts "Digite a letra ou palavra que você acha que contém: \n"
    chute = gets.strip.to_s.upcase
    return chute
end
def mensagem_resultado(erros ,nome_jogador)
    if erros == 5
        situacao = "perdeu"
        mensagem_final = "Infelizmente" 
    elsif erros < 5
        situacao = "venceu"
        mensagem_final = "Parabéns" 
    end
    puts "\n\n#{mensagem_final} #{nome_jogador}, você #{situacao}"
end
def converter_palavra_secreta_em_lista_underline(palavra_secreta)
    array_palavra_secreta = palavra_secreta.scan(/./)
    count = 0
    for i in array_palavra_secreta
        if i == '-'
            array_palavra_secreta[count] = '-'
        elsif  i == ' '
            array_palavra_secreta[count] = ' '
        else
            array_palavra_secreta[count] = '_'
        end
        count += 1
    end
    return array_palavra_secreta
end
def boneco_erros(erros)
    if erros == 0
        puts()
        puts("|----- ")
        puts("|    | ")
        puts("|      ")
        puts("|      ")
        puts("|      ")
        puts("|      ")
        puts("_      ")
        puts()
    elsif erros == 1
        puts()
        puts("|----- ")
        puts("|    | ")
        puts("|    0  ")
        puts("|    |  ")
        puts("|      ")
        puts("|      ")
        puts("_      ")
    elsif erros == 2
        puts()
        puts("|----- ")
        puts("|    | ")
        puts("|    0  ")
        puts("|   /|  ")
        puts("|      ")
        puts("|      ")
        puts("_      ")
    elsif erros == 3
        puts()
        puts("|----- ")
        puts("|    | ")
        puts("|    0  ")
        puts("|   /|\\  ")
        puts("|    |  ")
        puts("|      ")
        puts("_      ")
    elsif erros == 4
        puts()
        puts("|----- ")
        puts("|    | ")
        puts("|    0  ")
        puts("|   /|\\  ")
        puts("|    |  ")
        puts("|   /  ")
        puts("_      ")
    elsif erros == 5
        puts()
        puts("|----- ")
        puts("|    | ")
        puts("|    0  ")
        puts("|   /|\\  ")
        puts("|    |  ")
        puts("|   / \\ ")
        puts("_      ")
    end
end
def logica_jogo(erros, chutes, palavra_secreta_escolhida)
    array_underline = converter_palavra_secreta_em_lista_underline(palavra_secreta_escolhida)
    array_palavra_secreta = palavra_secreta_escolhida.scan(/./)
    print array_underline
    while erros < 5
        contagem = 0
        contagem2 = contagem
        count = 0
        chute = pede_um_chute(erros, chutes)
        if chute.size == 1      #SE FOR UMA LETRA
            for i in 1..array_palavra_secreta.length        
                if chute == array_palavra_secreta[count]    
                    if chutes.include?(chute)
                        puts "Essa letra já foi chutada, Menos uma vida!"
                        break
                    else
                        array_underline[count] = chute          
                        contagem += 1
                    end
                end
                count += 1
            end
        end
        chutes << chute
        if contagem > contagem2
        else
            erros += 1                      
        end
        if array_underline.join == array_palavra_secreta.join
            break
        elsif chute == array_palavra_secreta.join
            break
        end
        boneco_erros(erros)
        print array_underline
    end
    return erros
end
def main()
    chutes = []
    erros = 0
    mensagem_final = "Parabéns"
    situacao = "ganhou"
    #COMO MOSTRAR UM INTERFACE LEGAL?
    nome_jogador = boas_vindas()
    palavra_secreta_escolhida = palavra_secreta()
    erros_contabilizados = logica_jogo(erros, chutes, palavra_secreta_escolhida)
    mensagem_resultado(erros_contabilizados, nome_jogador)

    jogar_novamente?()
end
main()