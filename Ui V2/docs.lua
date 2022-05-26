local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Majora144/My-Ui-Librarys/main/Ui%20V2/main.lua",true))() 


local win = library:init({
        text = "Name",
        text2 = "Game"
    })

local t1 = win:AddTab({
    text = "Tab"
})

t1:AddButton({
  text = "Button",
  callback = function()
      
  end
})

t1:AddToggle({
    text = "Toggle",
    flag = "Flag",
    callback = function()

    end
})
