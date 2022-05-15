local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Majora144/My-Ui-Librarys/main/Ui%20Library/main.lua",true))()

local win = Library:CreateWindow({
    Title = "Title"
})


local tab = win:AddTab({
    Text = "Text"
})

tab:AddButton({
    Text = "Button",
    Callback = function()
        print("A")
    end
})

tab:AddToggle({
    Text = "Toggle",
    flag = "Tog",
    Callback = function()
        
    end
})

tab:AddSlider({
    Text = "Slider",
    Min = "16",
    Max = "50",
    Callback = function()
        
    end
})
