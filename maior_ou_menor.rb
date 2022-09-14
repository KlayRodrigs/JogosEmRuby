puts "Bem vindo ao jogo da adivinhação"
puts "Qual é o seu nome?"
nome = gets

puts "\n\n\n\n\n"
puts "Começaremos o jogo para você, " + nome

puts "Escolhendo um número secreto..."
numero_secreto = 175
puts "Número escolhido. Vamos adivinhar?"
puts "\n\n\n\n\n"
limite_tentativa = 5
for tentativa in 1..limite_tentativa
    puts "Tentativa " + tentativa.to_s + " de " + limite_tentativa.to_s
    puts "Entre com o número"

    chute = gets

    puts "Será que acertou? Você chutou " + chute

    acertou = numero_secreto == chute.to_i

    if acertou
        puts "Acertou!"
        break
    else
        maior = numero_secreto > chute.to_i
        if maior
            puts "Número secreto é maior!"
        else
            puts "Número secreto é menor!"
        end
    end
end