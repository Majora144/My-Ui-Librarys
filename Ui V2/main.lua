local Circle = Instance.new("ImageLabel")
Circle.Name = "Circle"
Circle.Parent = nil
Circle.BackgroundTransparency = 1
Circle.ZIndex = 10
Circle.Image = "rbxassetid://266543268"
Circle.ImageColor3 = Color3.fromRGB(60,130,216)

local UIS = game:GetService("UserInputService")
local ts = game:GetService("TweenService")

if game.CoreGui:FindFirstChild("UI") then
    game.CoreGui.UI:Destroy()
end

local library = {flags = {}}

local Mouse = game.Players.LocalPlayer:GetMouse()
local circTime = 0.5

function CircleClick(Button, X, Y)
	spawn(function()
		Button.ClipsDescendants  = true
		local Circ = Circle:Clone()
		Circ.Parent = Button
		local NewX = X - Circ.AbsolutePosition.X
		local NewY = Y - Circ.AbsolutePosition.Y
		Circ.Position = UDim2.new(0 ,NewX, 0, NewY)
		local Size = 0
		if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
			Size = Button.AbsoluteSize.X * 1.5
		elseif Button.AbsoluteSize.X < Button.AbsoluteSize.Y then
			Size = Button.AbsoluteSize.Y * 1.5
		elseif Button.AbsoluteSize.X == Button.AbsoluteSize.Y then
			Size = Button.AbsoluteSize.X * 1.5
		end
		Circ:TweenSizeAndPosition(UDim2.new(0, Size, 0 ,Size), UDim2.new(0.5,-Size / 2,0.5, -Size / 2),"Out","Quad",circTime,false,nil)

		for i = 1,10 do
			Circ.ImageTransparency = Circ.ImageTransparency + 0.1
			wait(circTime / 10)
		end
		Circ:Destroy()
	end)
end


function dragify(frame)
    local dragToggle = nil
    local dragSpeed = .13
    local dragStart = nil
    local startPos = nil
    
    local function updateInput(input)
     local delta = input.Position - dragStart
     local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
      startPos.Y.Scale, startPos.Y.Offset + delta.Y)
      ts:Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
    end
    
    frame.InputBegan:Connect(function(input)
     if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
      dragToggle = true
      dragStart = input.Position
      startPos = frame.Position
      input.Changed:Connect(function()
       if input.UserInputState == Enum.UserInputState.End then
        dragToggle = false
       end
      end)
     end
    end)
    
    UIS.InputChanged:Connect(function(input)
     if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
      if dragToggle then
       updateInput(input)
      end
     end
    end)
end

function library:init(options)
    local UI = Instance.new("ScreenGui")
    local Main = Instance.new("ImageLabel")
    local Side = Instance.new("ImageLabel")
    local Name = Instance.new("TextLabel")
    local Game = Instance.new("TextLabel")
    local Tabs = Instance.new("Frame")
    local TabListLayout = Instance.new("UIListLayout")
    local Pages = Instance.new("Frame")
    local Folder = Instance.new("Folder")
    
    UI.Name = "UI"
    UI.Parent = game.CoreGui
    
    Main.Name = "Main"
    Main.Parent = UI
    Main.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
    Main.BackgroundTransparency = 1.000
    Main.Position = UDim2.new(0.157786861, 0, 0.264793545, 0)
    Main.Size = UDim2.new(0, 500, 0, 300)
    Main.Image = "rbxassetid://3570695787"
    Main.ImageColor3 = Color3.fromRGB(34, 34, 34)
    Main.ScaleType = Enum.ScaleType.Slice
    Main.SliceCenter = Rect.new(100, 100, 100, 100)
    Main.SliceScale = 0.080
    
    Side.Name = "Side"
    Side.Parent = Main
    Side.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Side.BackgroundTransparency = 1.000
    Side.Size = UDim2.new(0, 179, 0, 300)
    Side.Image = "rbxassetid://3570695787"
    Side.ImageColor3 = Color3.fromRGB(40, 40, 40)
    Side.ScaleType = Enum.ScaleType.Slice
    Side.SliceCenter = Rect.new(100, 100, 100, 100)
    Side.SliceScale = 0.080
    
    Name.Name = "Name"
    Name.Parent = Side
    Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Name.BackgroundTransparency = 1.000
    Name.BorderSizePixel = 0
    Name.Size = UDim2.new(0, 179, 0, 50)
    Name.Font = Enum.Font.GothamSemibold
    Name.Text = options.text
    Name.TextColor3 = Color3.fromRGB(255, 255, 255)
    Name.TextSize = 25.000
    
    Game.Name = "Game"
    Game.Parent = Side
    Game.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Game.BackgroundTransparency = 1.000
    Game.BorderSizePixel = 0
    Game.Position = UDim2.new(0, 0, 0.0933333337, 3)
    Game.Size = UDim2.new(0, 179, 0, 21)
    Game.Font = Enum.Font.Gotham
    Game.Text = options.text2
    Game.TextColor3 = Color3.fromRGB(160, 160, 160)
    Game.TextSize = 20.000
    
    Tabs.Name = "Tabs"
    Tabs.Parent = Side
    Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Tabs.BackgroundTransparency = 1.000
    Tabs.Position = UDim2.new(0.0446927361, 0, 0.219999999, 0)
    Tabs.Size = UDim2.new(0, 163, 0, 228)
    
    TabListLayout.Name = "TabListLayout"
    TabListLayout.Parent = Tabs
    TabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabListLayout.Padding = UDim.new(0, 3)

    Pages.Name = "Pages"
    Pages.Parent = Main
    Pages.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Pages.BackgroundTransparency = 1.000
    Pages.BorderSizePixel = 0
    Pages.Position = UDim2.new(0.374000132, 0, 0, 0)
    Pages.Size = UDim2.new(0, 313, 0, 299)
    
    Folder.Name = "Folder"
    Folder.Parent = Pages

    dragify(Main)

    local TabItems = {}

    local firstTab = true

    function TabItems:AddTab(options)
        local Tab = Instance.new("TextButton")
        local Round_Tab = Instance.new("ImageLabel")
        local Page = Instance.new("ScrollingFrame")
        local PageListLayout = Instance.new("UIListLayout")
        local PagePadding = Instance.new("UIPadding")

        Tab.Name = "Tab"
        Tab.Parent = Tabs
        Tab.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        Tab.BackgroundTransparency = 1.000
        Tab.BorderSizePixel = 0
        Tab.Position = UDim2.new(0.147239268, 0, 0.065789476, 0)
        Tab.Size = UDim2.new(0, 163, 0, 36)
        Tab.ZIndex = 2
        Tab.AutoButtonColor = false
        Tab.Font = Enum.Font.Gotham
        Tab.Text = options.text
        Tab.TextColor3 = Color3.fromRGB(125, 125, 125)
        Tab.TextSize = 25.000

        Round_Tab.Name = "Round_Tab"
        Round_Tab.Parent = Tab
        Round_Tab.Active = true
        Round_Tab.AnchorPoint = Vector2.new(0.5, 0.5)
        Round_Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Round_Tab.BackgroundTransparency = 1.000
        Round_Tab.Position = UDim2.new(0.5, 0, 0.5, 0)
        Round_Tab.Selectable = true
        Round_Tab.Size = UDim2.new(1, 0, 1, 0)
        Round_Tab.Image = "rbxassetid://3570695787"
        Round_Tab.ImageColor3 = Color3.fromRGB(30, 30, 30)
        Round_Tab.ScaleType = Enum.ScaleType.Slice
        Round_Tab.SliceCenter = Rect.new(100, 100, 100, 100)
        Round_Tab.SliceScale = 0.050

        Page.Name = "Page"
        Page.Parent = Folder
        Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Page.BackgroundTransparency = 1.000
        Page.Selectable = false
        Page.Active = true
        Page.Visible = false
        Page.Size = UDim2.new(0, 313, 0, 299)
        Page.ScrollBarThickness = 0
        Page.CanvasSize = UDim2.new(0,PageListLayout.AbsoluteContentSize.X,0,PageListLayout.AbsoluteContentSize.Y)

        
        Page.ChildAdded:Connect(function()
            Page.CanvasSize = UDim2.new(0,PageListLayout.AbsoluteContentSize.X,0,PageListLayout.AbsoluteContentSize.Y)
        end)

        Page.ChildRemoved:Connect(function()
            Page.CanvasSize = UDim2.new(0,PageListLayout.AbsoluteContentSize.X,0,PageListLayout.AbsoluteContentSize.Y)
        end)

        PageListLayout.Name = "PageListLayout"
        PageListLayout.Parent = Page
        PageListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        PageListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        PageListLayout.Padding = UDim.new(0, 7)

        PagePadding.Name = "PagePadding"
        PagePadding.Parent = Page
        PagePadding.PaddingTop = UDim.new(0, 7)

        if firstTab then
            firstTab = false
            Page.Visible = true
            ts:Create(Tab,TweenInfo.new(.3),{
                TextColor3 = Color3.fromRGB(255,255,255)
            }):Play()
            Page.CanvasSize = UDim2.new(0,PageListLayout.AbsoluteContentSize.X,0,PageListLayout.AbsoluteContentSize.Y)
        end

        Tab.MouseButton1Click:connect(function()
            Page.CanvasSize = UDim2.new(0,PageListLayout.AbsoluteContentSize.X,0,PageListLayout.AbsoluteContentSize.Y)
            for _,v in next, Folder:GetChildren() do
                v.Visible = false
            end
            Page.Visible = true
            
            for i,v in next, Tabs:GetChildren() do
                if v:IsA("TextButton") then
                    ts:Create(v,TweenInfo.new(.3),{
                        TextColor3 = Color3.fromRGB(125,125,125)
                    }):Play()
                end
            end
            ts:Create(Tab,TweenInfo.new(.3),{
                TextColor3 = Color3.fromRGB(255,255,255)
            }):Play()
        end)

        local Items = {}
        function Items:AddButton(options)
            local Button = Instance.new("TextButton")
            local Round_Button = Instance.new("ImageLabel")
            local Text = Instance.new("TextLabel")

            Button.Name = "Button"
            Button.Parent = Page
            Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Button.BackgroundTransparency = 1.000
            Button.BorderSizePixel = 0
            Button.ClipsDescendants = true
            Button.Position = UDim2.new(0.0367412157, 0, 0, 0)
            Button.Size = UDim2.new(0, 290, 0, 37)
            Button.ZIndex = 3
            Button.Font = Enum.Font.Gotham
            Button.Text = ""
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextSize = 25.000
            Button.TextWrapped = true

            Round_Button.Name = "Round_Button"
            Round_Button.Parent = Button
            Round_Button.Active = true
            Round_Button.AnchorPoint = Vector2.new(0.5, 0.5)
            Round_Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Round_Button.BackgroundTransparency = 1.000
            Round_Button.Position = UDim2.new(0.5, 0, 0.5, 0)
            Round_Button.Selectable = true
            Round_Button.Size = UDim2.new(1, 0, 1, 0)
            Round_Button.ZIndex = 2
            Round_Button.Image = "rbxassetid://3570695787"
            Round_Button.ImageColor3 = Color3.fromRGB(45, 45, 45)
            Round_Button.ScaleType = Enum.ScaleType.Slice
            Round_Button.SliceCenter = Rect.new(100, 100, 100, 100)
            Round_Button.SliceScale = 0.050

            Text.Name = "Text"
            Text.Parent = Button
            Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Text.BackgroundTransparency = 1.000
            Text.Size = UDim2.new(0, 290, 0, 37)
            Text.ZIndex = 3
            Text.Font = Enum.Font.Gotham
            Text.Text = options.text
            Text.TextColor3 = Color3.fromRGB(255, 255, 255)
            Text.TextSize = 22.000
            Text.TextWrapped = true

            Page.CanvasSize = UDim2.new(0,PageListLayout.AbsoluteContentSize.X,0,PageListLayout.AbsoluteContentSize.Y)

            Button.MouseButton1Click:connect(function()
                pcall(options.callback)
                CircleClick(Button, Mouse.X, Mouse.Y)
            end)
        end

        function Items:AddToggle(options)
            local flag = options.flag or ""
            local callback = options.callback or function() end

            library.flags[flag] = false

            

            local Toggle = Instance.new("TextButton")
            local Round_Toggle = Instance.new("ImageLabel")
            local Text = Instance.new("TextLabel")
            local Toggle_2 = Instance.new("ImageLabel")
            local TogCirc = Instance.new("ImageLabel")
            
            Toggle.Name = "Toggle"
            Toggle.Parent = Page
            Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Toggle.BackgroundTransparency = 1.000
            Toggle.BorderSizePixel = 0
            Toggle.Position = UDim2.new(0.0367412157, 0, 0, 0)
            Toggle.Size = UDim2.new(0, 290, 0, 37)
            Toggle.ZIndex = 3
            Toggle.Font = Enum.Font.Gotham
            Toggle.Text = ""
            Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
            Toggle.TextSize = 25.000
            Toggle.TextWrapped = true
            
            Round_Toggle.Name = "Round_Toggle"
            Round_Toggle.Parent = Toggle
            Round_Toggle.Active = true
            Round_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
            Round_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Round_Toggle.BackgroundTransparency = 1.000
            Round_Toggle.Position = UDim2.new(0.5, 0, 0.5, 0)
            Round_Toggle.Selectable = true
            Round_Toggle.Size = UDim2.new(1, 0, 1, 0)
            Round_Toggle.ZIndex = 2
            Round_Toggle.Image = "rbxassetid://3570695787"
            Round_Toggle.ImageColor3 = Color3.fromRGB(45, 45, 45)
            Round_Toggle.ScaleType = Enum.ScaleType.Slice
            Round_Toggle.SliceCenter = Rect.new(100, 100, 100, 100)
            Round_Toggle.SliceScale = 0.050
            
            Text.Name = "Text"
            Text.Parent = Toggle
            Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Text.BackgroundTransparency = 1.000
            Text.Size = UDim2.new(0, 226, 0, 37)
            Text.ZIndex = 3
            Text.Font = Enum.Font.Gotham
            Text.Text = options.text
            Text.TextColor3 = Color3.fromRGB(255, 255, 255)
            Text.TextSize = 22.000
            Text.TextWrapped = true
            
            Toggle_2.Name = "Toggle"
            Toggle_2.Parent = Toggle
            Toggle_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Toggle_2.BackgroundTransparency = 1.000
            Toggle_2.Position = UDim2.new(0.775793016, 0, -0.108108111, 9)
            Toggle_2.Size = UDim2.new(0, 55, 0, 26)
            Toggle_2.ZIndex = 3
            Toggle_2.Image = "rbxassetid://3570695787"
            Toggle_2.ImageColor3 = Color3.fromRGB(89, 89, 89)
            Toggle_2.ScaleType = Enum.ScaleType.Slice
            Toggle_2.SliceCenter = Rect.new(100, 100, 100, 100)
            
            TogCirc.Name = "ToggleCircle"
            TogCirc.Parent = Toggle_2
            TogCirc.Active = true
            TogCirc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TogCirc.BackgroundTransparency = 1.000
            TogCirc.Position = UDim2.new(0.0461538471, 0, 0.0769230798, 0)
            TogCirc.Size = UDim2.new(0, 20, 0, 20)
            TogCirc.ZIndex = 3
            TogCirc.Image = "rbxassetid://3570695787"
            TogCirc.ScaleType = Enum.ScaleType.Slice
            TogCirc.SliceCenter = Rect.new(100, 100, 100, 100)

            local toggled = false
            local debounce = false

            
            Toggle.MouseButton1Click:connect(function()
                if not debounce then
                    if not toggled then
                        debounce = true
                        toggled = not toggled

                        ts:Create(TogCirc,  TweenInfo.new(.25),{Position = UDim2.new(0.576,0, 0.077,0)}):Play()
                        ts:Create(Toggle_2, TweenInfo.new(.25),{ImageColor3 = Color3.fromRGB(20, 200, 110)}):Play()

                        library.flags[flag] = true

                        wait(.25)
                        debounce = false

                    else
                        debounce = true
                        toggled = not toggled

                        ts:Create(TogCirc,  TweenInfo.new(.25),{Position = UDim2.new(0.046,0, 0.077,0)}):Play()
                        ts:Create(Toggle_2, TweenInfo.new(.25),{ImageColor3 = Color3.fromRGB(89, 89, 89)}):Play()

                        library.flags[flag] = false

                        wait(.25)
                        debounce = false
                    end
                end
                spawn(callback)
            end)
     

        end

        function Items:AddSlider(options)
            local Slider = Instance.new("TextButton")
            local Round_Slider = Instance.new("ImageLabel")
            local Text = Instance.new("TextLabel")
            local SliderFrame = Instance.new("ImageLabel")
            local SliderFrame_2 = Instance.new("ImageLabel")
            local Indicator = Instance.new("ImageLabel")
            local Arrow1 = Instance.new("ImageLabel")
            local Arrow2 = Instance.new("ImageLabel")
            local CurValue = Instance.new("TextLabel")
            local min = Instance.new("TextLabel")
            local max = Instance.new("TextLabel")
            local SliderButton = Instance.new("TextButton")
            
            Slider.Name = "Slider"
            Slider.Parent = game.StarterGui.UI.Main.Pages.Folder.Page
            Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Slider.BackgroundTransparency = 1.000
            Slider.BorderSizePixel = 0
            Slider.Position = UDim2.new(0.0367412157, 0, 0.452054799, 0)
            Slider.Size = UDim2.new(0, 290, 0, 45)
            Slider.ZIndex = 3
            Slider.Font = Enum.Font.Gotham
            Slider.Text = ""
            Slider.TextColor3 = Color3.fromRGB(255, 255, 255)
            Slider.TextSize = 25.000
            Slider.TextWrapped = true
            
            Round_Slider.Name = "Round_Slider"
            Round_Slider.Parent = Slider
            Round_Slider.Active = true
            Round_Slider.AnchorPoint = Vector2.new(0.5, 0.5)
            Round_Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Round_Slider.BackgroundTransparency = 1.000
            Round_Slider.Position = UDim2.new(0.5, 0, 0.5, 0)
            Round_Slider.Selectable = true
            Round_Slider.Size = UDim2.new(0, 290, 0, 45)
            Round_Slider.ZIndex = 2
            Round_Slider.Image = "rbxassetid://3570695787"
            Round_Slider.ImageColor3 = Color3.fromRGB(45, 45, 45)
            Round_Slider.ScaleType = Enum.ScaleType.Slice
            Round_Slider.SliceCenter = Rect.new(100, 100, 100, 100)
            Round_Slider.SliceScale = 0.050
            
            Text.Name = "Text"
            Text.Parent = Slider
            Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Text.BackgroundTransparency = 1.000
            Text.Size = UDim2.new(0, 290, 0, 25)
            Text.ZIndex = 3
            Text.Font = Enum.Font.Gotham
            Text.Text = options.text
            Text.TextColor3 = Color3.fromRGB(255, 255, 255)
            Text.TextSize = 22.000
            Text.TextWrapped = true
            
            SliderFrame.Name = "SliderFrame"
            SliderFrame.Parent = Slider
            SliderFrame.BackgroundColor3 = Color3.fromRGB(18, 97, 160)
            SliderFrame.BackgroundTransparency = 1.000
            SliderFrame.Position = UDim2.new(-0.0170000009, 21, 0.550000012, 0)
            SliderFrame.Size = UDim2.new(0, 260, 0, 15)
            SliderFrame.ZIndex = 3
            SliderFrame.Image = "rbxassetid://3570695787"
            SliderFrame.ImageColor3 = Color3.fromRGB(18, 97, 160)
            SliderFrame.ScaleType = Enum.ScaleType.Slice
            SliderFrame.SliceCenter = Rect.new(100, 100, 100, 100)
            
            SliderFrame_2.Name = "SliderFrame"
            SliderFrame_2.Parent = SliderFrame
            SliderFrame_2.BackgroundColor3 = Color3.fromRGB(56, 149, 211)
            SliderFrame_2.BackgroundTransparency = 1.000
            SliderFrame_2.Size = UDim2.new(0, 0, 0, 15)
            SliderFrame_2.ZIndex = 3
            SliderFrame_2.Image = "rbxassetid://3570695787"
            SliderFrame_2.ImageColor3 = Color3.fromRGB(56, 149, 211)
            SliderFrame_2.ScaleType = Enum.ScaleType.Slice
            SliderFrame_2.SliceCenter = Rect.new(100, 100, 100, 100)
            
            Indicator.Name = "Indicator"
            Indicator.Parent = SliderFrame_2
            Indicator.BackgroundColor3 = Color3.fromRGB(78, 78, 78)
            Indicator.BackgroundTransparency = 1.000
            Indicator.Position = UDim2.new(1, -25, 0, -40)
            Indicator.Size = UDim2.new(0, 46, 0, 23)
            Indicator.ZIndex = 100
            Indicator.Image = "rbxassetid://3570695787"
            Indicator.ImageColor3 = Color3.fromRGB(30, 30, 30)
            Indicator.ScaleType = Enum.ScaleType.Slice
            Indicator.SliceCenter = Rect.new(100, 100, 100, 100)
            
            Arrow1.Name = "Arrow1"
            Arrow1.Parent = Indicator
            Arrow1.BackgroundColor3 = Color3.fromRGB(78, 78, 78)
            Arrow1.BackgroundTransparency = 1.000
            Arrow1.Position = UDim2.new(-0.0500000007, 10, 0, 20)
            Arrow1.Rotation = 45.000
            Arrow1.Size = UDim2.new(0, 20, 0, 10)
            Arrow1.ZIndex = 100
            Arrow1.Image = "rbxassetid://3570695787"
            Arrow1.ImageColor3 = Color3.fromRGB(30, 30, 30)
            Arrow1.ScaleType = Enum.ScaleType.Slice
            Arrow1.SliceCenter = Rect.new(100, 100, 100, 100)
            
            Arrow2.Name = "Arrow2"
            Arrow2.Parent = Indicator
            Arrow2.BackgroundColor3 = Color3.fromRGB(78, 78, 78)
            Arrow2.BackgroundTransparency = 1.000
            Arrow2.Position = UDim2.new(-0.0500000007, 20, 0, 20)
            Arrow2.Rotation = 135.000
            Arrow2.Size = UDim2.new(0, 20, 0, 10)
            Arrow2.ZIndex = 100
            Arrow2.Image = "rbxassetid://3570695787"
            Arrow2.ImageColor3 = Color3.fromRGB(30, 30, 30)
            Arrow2.ScaleType = Enum.ScaleType.Slice
            Arrow2.SliceCenter = Rect.new(100, 100, 100, 100)
            
            CurValue.Name = "CurValue"
            CurValue.Parent = Indicator
            CurValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            CurValue.BackgroundTransparency = 100.000
            CurValue.Size = UDim2.new(0, 46, 0, 23)
            CurValue.ZIndex = 100
            CurValue.Font = Enum.Font.GothamSemibold
            CurValue.Text = "0"
            CurValue.TextColor3 = Color3.fromRGB(255, 255, 255)
            CurValue.TextSize = 18.000
            
            min.Name = "min"
            min.Parent = Slider
            min.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            min.BackgroundTransparency = 1.000
            min.Position = UDim2.new(0.0241379309, 10, 0.0699998662, 0)
            min.Size = UDim2.new(0, 43, 0, 20)
            min.ZIndex = 3
            min.Font = Enum.Font.GothamSemibold
            min.Text = tostring(options.min)
            min.TextColor3 = Color3.fromRGB(255, 255, 255)
            min.TextSize = 20.000
            min.TextXAlignment = Enum.TextXAlignment.Left
            
            max.Name = "max"
            max.Parent = Slider
            max.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            max.BackgroundTransparency = 1.000
            max.Position = UDim2.new(0.826206803, -10, 0.0699998662, 0)
            max.Size = UDim2.new(0, 43, 0, 20)
            max.ZIndex = 3
            max.Font = Enum.Font.GothamSemibold
            max.Text = tostring(options.max)
            max.TextColor3 = Color3.fromRGB(255, 255, 255)
            max.TextSize = 20.000
            max.TextXAlignment = Enum.TextXAlignment.Right
            
            SliderButton.Name = "SliderButton"
            SliderButton.Parent = Slider
            SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderButton.BackgroundTransparency = 1.000
            SliderButton.Position = UDim2.new(-0.0170000009, 21, 0.550000012, 0)
            SliderButton.Size = UDim2.new(0, 260, 0, 15)
            SliderButton.ZIndex = 3
            SliderButton.Font = Enum.Font.SourceSans
            SliderButton.Text = ""
            SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            SliderButton.TextSize = 14.000
        end


        return Items

    end

    return TabItems
end

return library
