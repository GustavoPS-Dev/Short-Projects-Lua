local function verificar (elementos)


    print("pares")

for _, obj in ipairs(elementos) do

    if obj / 2 % 1 == 0 then
        
         print(obj)

    end

end

 print("impares")

for _, obj in ipairs(elementos) do


    if obj / 2 % 1 ~= 0 then
        
         print(obj)

    end
    
    
end

end
    


print("Escreva uma sequencia para separar os numeros impares e pares separados por espaco")

local textos = io.read()

local numeros = {}

for num in textos:gmatch("%d+")  do
    
table.insert(numeros, tonumber(num))

end

verificar(numeros)