local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Majora144/My-Ui-Librarys/main/Toggle%20Ui/main.lua",true))() 

local Window = Library:Window()

Window:Toggle("Toggle", function(state)
    print(state)
end)
