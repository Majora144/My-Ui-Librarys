local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Majora144/My-Ui-Librarys/main/Ui%20Library/main.lua",true))()

local win = Library:CreateWindow({
    Title = "Title"
})


local tab = win:AddTab({
    Text = "Tab"
})

local tab2 = win:AddTab({
    Text = "Tab 2"
})

tab:AddButton({
    Text = "Button",
    callback = function()
        print("Clicked")
    end
})

tab:AddToggle({
    Text = "Toggle",
    callback = function(bool)
        print(bool)
    end
})

tab:AddSlider({
    Text = "Slider",
    Min = "0",
    Max = "100",
    callback = function(Value)
        print(Value)
    end
})
