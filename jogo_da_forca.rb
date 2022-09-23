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

def converter_palavra_secreta_em_lista_underline(palavra_secreta)
    array_palavra_secreta = palavra_secreta.scan(/./)
    count = 0
    for i in array_palavra_secreta
        array_palavra_secreta[count] = '_'
        count += 1
    end
    return array_palavra_secreta
end

def logica_jogo(erros, chutes, palavra_secreta_escolhida)
    array_underline = converter_palavra_secreta_em_lista_underline(palavra_secreta_escolhida)
    array_palavra_secreta = palavra_secreta_escolhida.scan(/./)
    while erros < 5
        contagem = 0
        contagem2 = contagem
        
        count = 0
        chute = pede_um_chute(erros, chutes)
        chutes << chute

        if chute.size == 1 #SE FOR UMA LETRA
            for i in 1..array_palavra_secreta.length #PERCORRER O TAMANHO DE ARRAY
                if chute == array_palavra_secreta[count] #VERIFICAR SE O CHUTE TA NA ARRAY DA PALAVRA SECRETA E SE SIM:
                    array_underline[count] = chute #MUDA O UNDERLINE REFERENTE A LETRA CHUTADA
                    contagem2 = contagem
                    contagem += 1
                end
                count += 1
            end
            print array_underline
        end
        #ESSA VERIFICAÇÃO COMEÇOU NO IF DO FOR ACIMA. NÃO LEMBRO A LÓGICA Q USEI, MAS DEU CERTO. DEPOIS REFLITO
        if contagem > contagem2
        else
            erros += 1
        end  
    end
    return erros

    #IF QUANTIDADE FOR MENOR = ERRO
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
=begin
['p','a','o']
['_','_','_']
count = 0
for i in lista
    if chute == i
        lista2[count] = chute
    end
    count += 1
end
=end