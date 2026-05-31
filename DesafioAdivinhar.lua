local numero_secreto = math.random(1,100)

local tentativas_restantes = 10

local function tentar ()


    print("Adivinhe o Numero Secreto")

    local tentativa = tonumber(io.read())

    if tentativa == nil then
        
      print("Apenas Numeros")

      return

    end

    os.execute("timeout 1 > nil")

    if tentativa == numero_secreto then

        tentativas_restantes = 0
        
        print("Voce acertou! Parabens!!!")

    elseif tentativa ~= numero_secreto and tentativas_restantes > 0 then

        tentativas_restantes = tentativas_restantes - 1

        if tentativas_restantes == 0 then

        print("Esgotou as chances. O numero era " .. numero_secreto .. ".")

        return

        elseif tentativas_restantes > 0 then

        print("Voce errou. Restam " .. tentativas_restantes .. " tentativas.")

        end

        if tentativa > numero_secreto and tentativas_restantes > 0 then
              
            print("Dica: O numero e menor")

        elseif tentativa < numero_secreto and tentativas_restantes > 0  then

            print("Dica: O numero e maior")

        end

    end


    
end

local function jogo ()

    numero_secreto = math.random(1, 100)

    tentativas_restantes = 10

while tentativas_restantes > 0 do

  tentar()

  os.execute("timeout 1 > nil")

end

local function  responder ()

    print("Jogar novamente? s/n")

local resposta = io.read()

if resposta == "s" or resposta == "sim" then

    jogo()

elseif resposta == "n" or resposta == "nao" then

    print("Obrigado por jogar.")

    os.exit()

else

    print("Redigite por favor.")

    responder()

end

end

responder()

end

jogo()