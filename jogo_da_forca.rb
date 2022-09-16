def boas_vindas()
    puts "Bem vindo ao jogo da forca"
    puts "Qual o seu nome?"
    nome = gets.strip.to_s.capitalize
    puts "\n\n"
    puts "Começaremos o jogo para você, #{nome}"
    return nome
end

def palavra_secreta()
    puts "Escolhendo palavra secreta..."
    palavra_secreta = "Programador".upcase
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

def mensagem_vitoria(erros, situacao, mensagem_final, nome_jogador)
    if erros == 5
        situacao = "perdeu"
        mensagem_final = "Infelizmente" 
    end
    puts "\n\n#{mensagem_final} #{nome_jogador}, você #{situacao}"
end

def logica_jogo(erros, chutes, palavra_secreta_escolhida)
    while erros < 5
        chute = pede_um_chute(erros, chutes)
        chutes << chute
        #COMO COMPARAR LETRA POR LETRAR?
        if chute.size == 1
            for tentativa in chutes
                if chute == tentativa.upcase
                    puts "Acertou a letra"
                    break
                #SE ERRAR?
                end
            end
        #OKAY DAQUI PRA BAIXO?
        else
            if chute == palavra_secreta_escolhida
                puts "Você acertou"
                break
            else
                puts "Você errou a letra: #{chute}"
            end          
        end
        erros += 1
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
    mensagem_vitoria(erros_contabilizados, situacao, mensagem_final, nome_jogador)

    jogar_novamente?()
end

main()