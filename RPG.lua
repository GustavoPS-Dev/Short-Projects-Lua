local personagem = {}

local function Definir_personagem (Escolha)

    if Escolha == "Cavaleiro" then
         
        personagem = {
            Classe = "Cavaleiro",
            Vida = 8,
            Dano = 3,
    }

    print(personagem.Classe, "Vida:" .. personagem.Vida, "Dano:" .. personagem.Dano)

    print("Habilidades: 1/2. 1-Corte De Espada:dano 3, 2-Escudo Da Realeza:Reduz 50% do dano.")

    elseif Escolha == "Mago" then
    
       personagem = { 
            Classe = "Mago",
            Vida = 7,
            Dano = 5,
       }

       print(personagem.Classe, "Vida:" .. personagem.Vida,  "Dano:" .. personagem.Dano)
        
       print("Habilidades: 1/2. 1-Bola de fogo:Dano 5, 2-Cura druida:Regenera 2 pontos de vida.")
       elseif Escolha == "Gigante" then
    
       personagem = { 
            Classe = "Gigante",
            Vida = 10,
            Dano = 4,
       }
            print(personagem.Classe, "Vida:" .. personagem.Vida,  "Dano:" .. personagem.Dano)
            
            print("Habilidades: 1/2. 1-Pisotear:Dano 4, 2-Ira do tita:No porximo ataque cause 6 de dano.")
 
    else

        return

end




end
    


local function escolher_personagem ()

    print("Escolha seu personagem. 1/2/3 Cavaleiro, Mago, Gigante.")

    local escolha = io.read()

    if escolha == "1" then
        
        personagem = {Classe = "Cavaleiro"}

        print("Escolheu Cavaleiro.")

    elseif escolha == "2" then

        personagem = {Classe = "Mago"}

        print("Escolheu Mago.")

    elseif escolha == "3" then

        personagem = {Classe = "Gigante"}

        print("Escolheu Gigante.")

    else

        print("Escolha apenas 1,2 ou 3.")

        os.execute("timeout 1 > nul")

        escolher_personagem()


    end

    Definir_personagem(personagem.Classe)

end

escolher_personagem()

local function Batalha_Um ()

    local Inimigo = 5

    local dano_inimigo = 1

    local mudanca = false

    while Inimigo > 0 do

        personagem.Vida = personagem.Vida - dano_inimigo

        if personagem.Vida <= 0 then

            print("voce morreu.")

            os.exit()
            
        
        end

        print("Inimigo te atacou, sua vida e:" .. personagem.Vida)

        if mudanca == true then
            
           dano_inimigo = 1

        end

        print("movimento 1 OU 2?")

        local movimento = io.read()

       
        if movimento == "1" then

            print("Atacou")
            
           Inimigo = Inimigo - personagem.Dano

           if personagem.Dano == 8 then
            
                personagem.Dano = 4

           end

           print("Vida do inimigo:" .. Inimigo)

        elseif movimento == "2"  then
           
            if personagem.Classe == "Cavaleiro" then
                
                  dano_inimigo = dano_inimigo/2

                  mudanca = true

                  print("Usou o Escudo")

            elseif personagem.Classe == "Mago" then

                if personagem.Vida < 6 then
            
                  personagem.Vida = personagem.Vida + 2

                  print("Vida:" .. personagem.Vida)

                elseif personagem.Vida < 7 and personagem.Vida > 6 then

                    personagem.Vida = personagem.Vida + 1

                    print("Vida:" .. personagem.Vida)

                    else

                        print("Vida Maxima.")

                end

            elseif personagem.Classe == "Gigante" then

                if personagem.Dano == 4 then
                    
                        personagem.Dano = personagem.Dano * 2

                        print("Aumento de dano")

                        else return

                end


            end
           
            else

                print("Perdeu o turno, use 1 ou 2")

                return

        end
        
    end

    print("Derrotou o inimigo")
    
end

Batalha_Um()


