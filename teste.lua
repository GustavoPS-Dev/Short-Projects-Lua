print("definir senha")

local definirsenha = tonumber(io.read())

local senha = definirsenha

local tentativas_restantes = 4

local bloqueado = true

while bloqueado == true do

    print("inserir senha")

    local tentativa = tonumber(io.read())

if tentativa == senha then
    print("acesso liberado")

    tentativas_restantes = 4

    bloqueado = false
elseif tentativas_restantes > 0 then

    tentativas_restantes = tentativas_restantes - 1

    if tentativas_restantes > 0 then

   print("senha incorreta. restam " .. tentativas_restantes .. " tentativas" )

   
    else
             
        print("bloqueado")

        os.exit()

    end 

end

os.execute("timeout 3 > nul")

end