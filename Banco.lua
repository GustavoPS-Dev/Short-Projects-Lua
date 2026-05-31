local function save (Nick, Senha, Saldo)

    local arquivo = io.open("dados.txt", "w")

    arquivo:write(Nick .. "\n")
    arquivo:write(Senha .. "\n")
    arquivo:write(Saldo .. "\n")

    arquivo:close()
end



local arquivo = io.open("dados.txt", "r")

local nick

local senha

local saldo

if arquivo then

    nick = arquivo:read("*l")

    senha = arquivo:read("*l")

    saldo = tonumber(arquivo:read("*l"))

    arquivo:close()

    print("Conta Carregada Com Sucesso!")

elseif not arquivo then


print("Bem Vindo Ao Banco GG, Porfavor, Siga As Instrucoes para o cadastro")

print("Nome Do Dono Da Conta")

nick = io.read()

print("Nome:" .. nick)

print("Definir Senha")

senha = io.read()

saldo = 0

print("Senha Definida E Cadastro Concluido")

save(nick,senha,saldo)

end

local bloqueado = true

print("Inserir usuario e senha para continuar. Da Seguinte forma:")
print("Nome:***** Senha:***")

local tentativas = 4

while bloqueado == true do

local digitado = io.read()

if digitado == "Nome:" .. nick .. " Senha:" .. senha then
    
    print("Acesso Liberado")

    bloqueado = false

elseif digitado ~= "Nome:" .. nick .. " Senha:" .. senha and tentativas > 0  then

    tentativas = tentativas -1

if tentativas > 0 then

    print("Tente De Novo. Restam " .. tentativas .. " Tentativas.")

elseif tentativas <= 0 then

    print("Acesso Negado")

    os.exit()

end

end

end

print("Bem vindo de vola ao Banco GG," .. nick .. ".")

while bloqueado == false do
    
print("O que deseja fazer hoje?")
print("Digite: 1 para Depositar, 2 para Sacar, 3 para ver o saldo, 4 para sair 5 para deletar a conta")

local tarefa = tonumber(io.read())

if tarefa == nil then

    print("Apenas Numeros")

    

elseif tarefa == 3 then

    print("Seu saldo e de " .. saldo .. " Money")

elseif tarefa == 1 then

    print("Qual Valor Desejaria Depositar?")

    local Deposito = tonumber(io.read())

    if Deposito == nil then
        
       print("Apenas Numeros")

       
    else

        saldo = saldo + Deposito

         print("Seu saldo e de " .. saldo .. " Money")

         save(nick,senha,saldo)

    end

elseif tarefa == 2 then

     print("Qual Valor Desejaria Sacar?")

    local Saque = tonumber(io.read())

    if Saque == nil then
        
       print("Apenas Numeros")

      

    elseif Saque <= saldo then

        saldo = saldo - Saque

         print("Seu saldo e de " .. saldo .. " Money")

         save(nick,senha,saldo)

    elseif Saque > saldo then

        print("Saldo Insuficiente")

    end

elseif tarefa == 4 then

    print("Volte Logo!")

    os.exit()
elseif tarefa == 5 then

    print("Tem certeza que deseja excluir a conta? Y/N")

    local ler = string.lower(io.read())

    if ler == "y" or ler == "yes" or ler ==  "sim" then

        print("Digite sua Senha para confirmar")

        local senhahora = io.read()

        if senhahora == senha then

    os.remove("dados.txt")

    print("Acabou")

    os.exit()

        else 

            print("Incorreto, Fechando Banco")

            os.exit()

        end

    elseif ler == "n" or ler == "nao" or ler ==  "no" then

        print("Boa escolha")

    else

        print("responda com sim ou nao")

    end
end

end