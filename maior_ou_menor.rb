def da_boas_vindas()
    puts "Bem vindo ao jogo da adivinhação"
    puts "Qual é o seu nome?"
    nome = gets

    puts "\n\n\n\n\n"
    puts "Começaremos o jogo para você, " + nome
end

def sorteia_numero_secreto()
    puts "Escolhendo um número secreto..."
    numero_sorteado = 175
    puts "Número escolhido. Vamos adivinhar?"
    return numero_sorteado
end

def pede_numero(tentativa, limite_tentativa)
    puts "\n\n\n\n\n"
    puts "Tentativa " + tentativa.to_s + " de " + limite_tentativa.to_s
    puts "Entre com o número"
    chute = gets.to_i
    puts "Será que acertou? Você chutou " + chute.to_s
    return chute
end

def verifica_se_acertou(numero_secreto, chute)
    acertou = numero_secreto == chute

    if acertou
        puts "Acertou!"
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

da_boas_vindas()
numero_secreto = sorteia_numero_secreto()

limite_tentativa = 5

for tentativa in 1..limite_tentativa
    chute = pede_numero(tentativa, limite_tentativa)
    if verifica_se_acertou(numero_secreto, chute)
        break
    end
end