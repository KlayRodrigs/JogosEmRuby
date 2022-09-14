def da_boas_vindas()
    puts
    puts "        P  /_\\  P                              "
    puts "       /_\\_|_|_/_\\                             "
    puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
    puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
    puts "  |' '  |  |_|  |'  ' |                        "
    puts "  |_____| ' _ ' |_____|                        " 
    puts "        \\__|_|__/                              "
    puts
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "\n\n\n\n\n"
    puts "Começaremos o jogo para você, #{nome}"
end

def ganhou()
    puts
    puts "             OOOOOOOOOOO               "
    puts "         OOOOOOOOOOOOOOOOOOO           "
    puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
    puts "    OOOOOO      OOOOO      OOOOOO      "
    puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
    puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
    puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
    puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
    puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
    puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
    puts "         OOOOOO         OOOOOO         "
    puts "             OOOOOOOOOOOO              "
    puts
    puts "               Acertou!                "
    puts
end

def pede_dificuldade()
    puts "Qual o nível que você deseja? (1-fácil, 2-médio, 3-difícil)"
    return dificuldade = gets.to_i
    
end

def sorteia_numero_secreto(dificuldade)
    case dificuldade
    when 1
        valor_maximo_para_adivinhar = 50
    when 2
        valor_maximo_para_adivinhar = 100
    else
        valor_maximo_para_adivinhar = 200
    end

    puts "Escolhendo um número secreto..."
    numero_sorteado = rand(valor_maximo_para_adivinhar) + 1
    puts "Número escolhido, ele está entre 1 e #{valor_maximo_para_adivinhar}. Vamos adivinhar?"
    return numero_sorteado
end

def pede_numero(tentativa, limite_tentativa)
    puts "\n\n\n\n\n"
    puts "Tentativa #{tentativa} de #{limite_tentativa}"
    puts "Entre com o número"
    chute = gets.strip.to_i
    puts "Será que acertou? Você chutou #{chute}"
    return chute
end

def verifica_se_acertou(numero_secreto, chute, lista_chutes)
    acertou = numero_secreto == chute
    puts "você chutou, #{lista_chutes}"
    if acertou
        ganhou()
        return true
    end
    
    maior = numero_secreto > chute
    if maior
        puts "Número secreto é maior!"
    else
        puts "Número secreto é menor!"
    end
    return false
end

def deseja_jogar_novamente()
    puts "Deseja jogar novamente?(S/N)"
    escolha = gets.strip.upcase
    if not escolha == "N"
        base()
    end
end

def jogo(limite_tentativa, lista_chutes, numero_secreto)
    pontos_atuais = 100
    penalidade = pontos_atuais / limite_tentativa

    for tentativa in 1..limite_tentativa
        chute = pede_numero(tentativa, limite_tentativa)
        lista_chutes << chute
        if verifica_se_acertou(numero_secreto, chute, lista_chutes)
            break
        end
        pontos_atuais -= penalidade
    end
    puts "Você conseguiu #{pontos_atuais} pontos."
    deseja_jogar_novamente()
end

def base()
    da_boas_vindas()
    dificuldade = pede_dificuldade()
    numero_secreto = sorteia_numero_secreto(dificuldade)
    limite_tentativa = 5
    lista_chutes = []
    jogar = jogo(limite_tentativa, lista_chutes, numero_secreto)
    return dificuldade, limite_tentativa, lista_chutes, jogar
end


base()