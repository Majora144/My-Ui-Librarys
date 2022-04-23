local Majora = loadstring(game:HttpGet("https://raw.githubusercontent.com/Majora144/My-Ui-Librarys/main/Blu%20UI/main.lua",true))()

local Window = Majora:Window("name")

local Tab = Window:Tab("Tab")

Tab:Button("Button",function()
print("Pressed")
end)

Tab:Toggle("Toggle",function(state)
    print(state)
end)

Tab:Label("Label")

Tab:Destroy("Destroy Button")
