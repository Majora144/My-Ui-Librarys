local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Majora144/My-Ui-Librarys/main/Grey%20Ui/main.lua",true))()

local Window = Library:Window("Window")

Window:Button("Button",function()
    print("You clicked me wow")
end)

Window:Toggle("Toggle",function(state)
    print(state)
end)
