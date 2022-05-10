local Library = loadstring(game:HttpGet(https://raw.githubusercontent.com/Majora144/My-Ui-Librarys/main/Ui%20Library/main.lua,true))() -- << Imports The Ui >> --

local Window = Library:CreateWindow("Title") -- << "Title" == Title >> --

local Tab = Window:AddTab("Tab") --<< "Tab" == Tab Text >>--

Tab:AddButton("Button",function() -- << "Button" == Button Text >> --
    print("pressed")
end)

Tab:AddToggle("Toggle",function(state) -- << "Toggle" == Toggle Text, state returns the value of the toggle >> --
  print("toggle state is",v)    
end)

Tab:AddSlider("Slider",0,100,function(v) --<< "Slider" == Slider Text, 0 == minvalue, 100 = maxvalue, v returns the value of the slide >> --
    print("value",v)
end)
