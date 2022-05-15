local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Majora144/My-Ui-Librarys/main/Ui%20Library/main.lua",true))()

local win = library:CreateWindow({
    Title = "Title"
})


local tab = win:AddTab({
    Text = "Text"
})


tab:AddButton({
    Text = "Button",
    callback = function()
        print("w")
    end
})

tab:AddToggle({
    Text = "Toggle",
    flag = "Toggle",
    Callback = function()
        print("LOL")
    end
})

tab:AddSlider({
    Text = "Slider",
    Min = "16",
    Max = "50",
    callback = function()
        
    end
})
