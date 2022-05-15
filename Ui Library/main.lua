--[[
	Created by: Majora#0001
	Draggable script i used: https://devforum.roblox.com/t/draggable-property-is-hidden-on-gui-objects/107689/5
]]

if game.CoreGui:FindFirstChild("NinjaLegendsUI") then
    game.CoreGui.NinjaLegendsUI:Destroy()
end

local Library = {flags = {}}

function Library:CreateWindow(options)
    local NinjaLegendsUI = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local SideBar = Instance.new("Frame")
    local Tabs = Instance.new("Frame")
    local TabListing = Instance.new("UIListLayout")
    local SideBarCorner = Instance.new("UICorner")
    local Cover = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")
    local MainCorner = Instance.new("UICorner")
    local Pages = Instance.new("Frame")
    local PageCorner = Instance.new("UICorner")
    local PageFolder = Instance.new("Folder")

    NinjaLegendsUI.Name = "NinjaLegendsUI"
    NinjaLegendsUI.Parent = game.CoreGui
    NinjaLegendsUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    Main.Name = "Main"
    Main.Parent = NinjaLegendsUI
    Main.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.0596863925, 0, 0.291139245, 0)
    Main.Size = UDim2.new(0, 550, 0, 333)
	
	local dragToggle = nil
	local dragSpeed = .15
	local dragStart = nil
	local startPos = nil
	
	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(Main, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end
	
	Main.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = Main.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	
	game:GetService('UserInputService').InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)


    SideBar.Name = "SideBar"
    SideBar.Parent = Main
    SideBar.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
    SideBar.BorderSizePixel = 0
    SideBar.Size = UDim2.new(0, 110, 0, 333)
    
    Tabs.Name = "Tabs"
    Tabs.Parent = SideBar
    Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Tabs.BackgroundTransparency = 1.000
    Tabs.Position = UDim2.new(0.0454545468, 0, 0.141141146, 0)
    Tabs.Size = UDim2.new(0, 100, 0, 279)
    
    TabListing.Name = "TabListing"
    TabListing.Parent = Tabs
    TabListing.SortOrder = Enum.SortOrder.LayoutOrder
    TabListing.Padding = UDim.new(0, 4)

    SideBarCorner.CornerRadius = UDim.new(0, 3)
    SideBarCorner.Name = "SideBarCorner"
    SideBarCorner.Parent = SideBar

    Cover.Name = "Cover"
    Cover.Parent = SideBar
    Cover.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
    Cover.BorderSizePixel = 0
    Cover.Position = UDim2.new(0.945454538, 0, 0, 0)
    Cover.Size = UDim2.new(0, 6, 0, 333)

    TextLabel.Parent = SideBar
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.Size = UDim2.new(0, 110, 0, 42)
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.Text = options.Title
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 16
    TextLabel.TextWrapped = true

    MainCorner.CornerRadius = UDim.new(0, 3)
    MainCorner.Name = "MainCorner"
    MainCorner.Parent = Main

    Pages.Name = "Pages"
    Pages.Parent = Main
    Pages.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
    Pages.BorderSizePixel = 0
    Pages.Position = UDim2.new(0.212727278, 0, 0.0210210215, 0)
    Pages.Size = UDim2.new(0, 426, 0, 319)

    PageCorner.CornerRadius = UDim.new(0, 3)
    PageCorner.Name = "PageCorner"
    PageCorner.Parent = Pages

    PageFolder.Name = "PageFolder"
    PageFolder.Parent = Pages

    local TabTable = {}

    local first = true

    function TabTable:AddTab(options)
        local TabButton = Instance.new("TextButton")
        local UICorner = Instance.new("UICorner")
        local Page = Instance.new("ScrollingFrame")
        local PageListing = Instance.new("UIListLayout")
        local PagePadding = Instance.new("UIPadding")

        TabButton.Name = "TabButton"
        TabButton.Parent = Tabs
        TabButton.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
        TabButton.BorderSizePixel = 0
        TabButton.Size = UDim2.new(0, 99, 0, 26)
        TabButton.AutoButtonColor = false
        TabButton.Font = Enum.Font.GothamSemibold
        TabButton.Text = options.Text
        TabButton.TextColor3 = Color3.fromRGB(88,88,88)
        TabButton.TextSize = 14.000
        TabButton.MouseButton1Click:Connect(function()
            local TabTween1 = game:GetService("TweenService"):Create(script.Parent,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{BackgroundColor3 = Color3.fromRGB(66,66,66)})
            local TabTween2 = game:GetService("TweenService"):Create(script.Parent,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{BackgroundColor3 = Color3.fromRGB(44,44,44)})
            TabTween1:Play()
            TabTween1.Completed:Connect(function()
                TabTween2:Play()
            end)
        end)


        UICorner.CornerRadius = UDim.new(0, 3)
        UICorner.Parent = TabButton
    
        Page.Name = "Page"
        Page.Parent = PageFolder
        Page.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
        Page.BackgroundTransparency = 1.000
        Page.BorderSizePixel = 0
        Page.Selectable = false
        Page.Size = UDim2.new(0, 426, 0, 318)
        Page.Visible = false
        Page.ScrollBarThickness = 4
        
        PageListing.Name = "PageListing"
        PageListing.Parent = Page
        PageListing.HorizontalAlignment = Enum.HorizontalAlignment.Center
        PageListing.SortOrder = Enum.SortOrder.LayoutOrder
        PageListing.Padding = UDim.new(0, 5)

        PagePadding.Name = "PagePadding"
        PagePadding.Parent = Page
        PagePadding.PaddingRight = UDim.new(0, 5)
        PagePadding.PaddingTop = UDim.new(0, 5)

        if first then
            first = false
            Page.Visible = true
            Page.Transparency = 0
            game.TweenService:Create(TabButton,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{
                TextColor3 = Color3.fromRGB(255,255,255)
            }):Play()
        end

        TabButton.MouseButton1Click:connect(function()
            for _,v in next, PageFolder:GetChildren() do
                v.Visible = false
            end
            Page.Visible = true
            
            for i,v in next, Tabs:GetChildren() do
                if v:IsA("TextButton") then
                    game.TweenService:Create(v,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{
                        TextColor3 = Color3.fromRGB(88, 88, 88)
                    }):Play()
                end
            end
            game.TweenService:Create(TabButton,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{
                TextColor3 = Color3.fromRGB(255,255,255)
            }):Play()
        end)

        local ElementTable = {}

        function ElementTable:AddButton(options)
            local Button = Instance.new("TextButton")
            local ButtonCorner = Instance.new("UICorner")
            
            Button.Name = "Button"
            Button.Parent = Page
            Button.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
            Button.BorderSizePixel = 0
            Button.Position = UDim2.new(-0.0539906099, 0, 0, 0)
            Button.Size = UDim2.new(0, 409, 0, 35)
            Button.AutoButtonColor = false
            Button.Font = Enum.Font.GothamSemibold
            Button.Text = options.Text
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextSize = 16.000

            Button.MouseEnter:Connect(function()

                game.TweenService:Create(Button,TweenInfo.new(.2,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{
                    BackgroundColor3 = Color3.fromRGB(37,37,37)
                }):Play()

            end)
            
            Button.MouseLeave:Connect(function()

                game.TweenService:Create(Button,TweenInfo.new(.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
                    BackgroundColor3 = Color3.fromRGB(33,33,33)
                }):Play()

            end)
            
            Button.MouseButton1Click:Connect(function()
                pcall(options.Callback)
                game.TweenService:Create(Button,TweenInfo.new(.1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
                    TextSize = 8
                }):Play()

                task.wait(.2)

                game.TweenService:Create(Button,TweenInfo.new(.1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
                    TextSize=16
                }):Play()

            end)

            ButtonCorner.CornerRadius = UDim.new(0, 5)
            ButtonCorner.Name = "ButtonCorner"
            ButtonCorner.Parent = Button
        end

        function ElementTable:AddToggle(options)
            local location = Library.flags
            local flag = options.flag
            local callback = options.Callback
            location[flag] = false

            local Toggle = Instance.new("TextButton")
            local ToggleCorner = Instance.new("UICorner")
            local ToggleState = Instance.new("Frame")
            local ToggleStateCorner = Instance.new("UICorner")
            local Info = Instance.new("TextLabel")
           
            Toggle.Name = "Toggle"
            Toggle.Parent = Page
            Toggle.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
            Toggle.BorderSizePixel = 0
            Toggle.Position = UDim2.new(-0.0539906099, 0, 0, 0)
            Toggle.Size = UDim2.new(0, 409, 0, 35)
            Toggle.AutoButtonColor = false
            Toggle.Font = Enum.Font.GothamSemibold
            Toggle.Text = ""
            Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
            Toggle.TextSize = 16.000
            
            ToggleCorner.CornerRadius = UDim.new(0, 5)
            ToggleCorner.Name = "ToggleCorner"
            ToggleCorner.Parent = Toggle
            
            ToggleState.Name = "ToggleState"
            ToggleState.Parent = Toggle
            ToggleState.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
            ToggleState.BorderSizePixel = 0
            ToggleState.Position = UDim2.new(0.92176038, 0, 0.213452145, 0)
            ToggleState.Size = UDim2.new(0, 21, 0, 20)
            
            ToggleStateCorner.CornerRadius = UDim.new(0, 3)
            ToggleStateCorner.Name = "ToggleStateCorner"
            ToggleStateCorner.Parent = ToggleState
            
            Info.Name = "Info"
            Info.Parent = Toggle
            Info.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Info.BackgroundTransparency = 1.000
            Info.Position = UDim2.new(0.0220048893, 0, 0.0705950037, 0)
            Info.Size = UDim2.new(0, 123, 0, 32)
            Info.Text = options.Text
            Info.Font = Enum.Font.GothamSemibold
            Info.TextColor3 = Color3.fromRGB(255, 255, 255)
            Info.TextSize = 16.000
            Info.TextXAlignment = Enum.TextXAlignment.Left
        

                Toggle.MouseEnter:Connect(function()
                    game.TweenService:Create(Toggle,TweenInfo.new(.2,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{BackgroundColor3 = Color3.fromRGB(37,37,37)}):Play()
                end)
                
                Toggle.MouseLeave:Connect(function()
                    game.TweenService:Create(Toggle,TweenInfo.new(.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(33,33,33)}):Play()
                end)

                local toggled = false
                Toggle.MouseButton1Click:Connect(function()
                    if not toggled then
                        toggled = not toggled
                        
                        location[flag] = not location[flag]
                        
                        game.TweenService:Create(ToggleState,TweenInfo.new(.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(66,159,221)}):Play()
                    elseif toggled then
                        toggled = not toggled

                        location[flag] = not location[flag]

                        game.TweenService:Create(ToggleState,TweenInfo.new(.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(77,77,77)}):Play()
                    end
                    spawn(callback)
                end)
            end

        function ElementTable:AddSlider(options)
            local Slider = Instance.new("Frame")
            local SliderCorner = Instance.new("UICorner")
            local SliderButton = Instance.new("TextButton")
            local Slider_2 = Instance.new("ImageLabel")
            local SliderInner = Instance.new("ImageLabel")
            local SliderText = Instance.new("TextLabel")
            local SliderValue = Instance.new("TextLabel")
            local mouse = game.Players.LocalPlayer:GetMouse()
            local uis = game:GetService("UserInputService")
            local Value;

            Slider.Name = "Slider"
            Slider.Parent = Page
            Slider.Active = true
            Slider.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
            Slider.BorderSizePixel = 0
            Slider.Position = UDim2.new(-0.0539906099, 0, 0, 0)
            Slider.Selectable = true
            Slider.Size = UDim2.new(0, 409, 0, 45)

            Slider.MouseEnter:Connect(function()
                game.TweenService:Create(Slider,TweenInfo.new(.2,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{BackgroundColor3 = Color3.fromRGB(37,37,37)}):Play()
            end)

            Slider.MouseLeave:Connect(function()
                game.TweenService:Create(Slider,TweenInfo.new(.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(33,33,33)}):Play()
            end)


            SliderCorner.CornerRadius = UDim.new(0, 5)
            SliderCorner.Name = "SliderCorner"
            SliderCorner.Parent = Slider

            SliderButton.Name = "SliderButton"
            SliderButton.Parent = Slider
            SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderButton.BackgroundTransparency = 1.000
            SliderButton.BorderSizePixel = 0
            SliderButton.Position = UDim2.new(0.371638149, 0, 0.254907221, 0)
            SliderButton.Size = UDim2.new(0, 246, 0, 22)
            SliderButton.ZIndex = 2
            SliderButton.Font = Enum.Font.GothamSemibold
            SliderButton.Text = ""
            SliderButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderButton.TextSize = 14.000

            Slider_2.Name = "Slider"
            Slider_2.Parent = SliderButton
            Slider_2.Active = true
            Slider_2.AnchorPoint = Vector2.new(0.5, 0.5)
            Slider_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Slider_2.BackgroundTransparency = 1.000
            Slider_2.Position = UDim2.new(0.5, 0, 0.5, 0)
            Slider_2.Selectable = true
            Slider_2.Size = UDim2.new(1, 0, 1, 0)
            Slider_2.Image = "rbxassetid://3570695787"
            Slider_2.ImageColor3 = Color3.fromRGB(16, 109, 171)
            Slider_2.ScaleType = Enum.ScaleType.Slice
            Slider_2.SliceCenter = Rect.new(100, 100, 100, 100)
            Slider_2.SliceScale = 0.250

            SliderInner.Name = "SliderInner"
            SliderInner.Parent = SliderButton
            SliderInner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderInner.BackgroundTransparency = 1.000
            SliderInner.Size = UDim2.new(0, 0, 0, 22)
            SliderInner.Image = "rbxassetid://3570695787"
            SliderInner.ImageColor3 = Color3.fromRGB(66, 159, 221)
            SliderInner.ScaleType = Enum.ScaleType.Slice
            SliderInner.SliceCenter = Rect.new(100, 100, 100, 100)
            SliderInner.SliceScale = 0.250

            SliderText.Name = "SliderText"
            SliderText.Parent = Slider
            SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderText.BackgroundTransparency = 1.000
            SliderText.Position = UDim2.new(0.0220048893, 0, 0, 0)
            SliderText.Size = UDim2.new(0, 132, 0, 43)
            SliderText.Font = Enum.Font.GothamSemibold
            SliderText.Text = options.Text
            SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderText.TextSize = 16.000
            SliderText.TextXAlignment = Enum.TextXAlignment.Left

            SliderValue.Name = "SliderValue"
            SliderValue.Parent = Slider
            SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderValue.BackgroundTransparency = 1.000
            SliderValue.Position = UDim2.new(0.323,0, 0.255, 0)
            SliderValue.Size = UDim2.new(0, 20, 0, 22)
            SliderValue.Font = Enum.Font.GothamSemibold
            SliderValue.Text = "0"
            SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderValue.TextSize = 16.000

            SliderButton.MouseButton1Down:Connect(function()
            Value = math.floor((((tonumber(options.Max) - tonumber(options.Min)) / 246) * SliderInner.AbsoluteSize.X) + tonumber(options.Min)) or 0
            pcall(function()
                pcall(options.callback,Value)
            end)
            game.TweenService:Create(SliderInner,TweenInfo.new(.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size = UDim2.new(0, math.clamp(mouse.X - SliderInner.AbsolutePosition.X, 0, 246), 0, 22)}):Play()
            moveconnection = mouse.Move:Connect(function()
                SliderValue.Text = Value
                Value = math.floor((((tonumber(options.Max) - tonumber(options.Min)) / 246) * SliderInner.AbsoluteSize.X) + tonumber(options.Min))
                SliderValue.Text = Value
                pcall(function()
                    pcall(options.Callback,Value)
                    SliderValue.Text = Value
                end)
                game.TweenService:Create(SliderInner,TweenInfo.new(.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size = UDim2.new(0, math.clamp(mouse.X - SliderInner.AbsolutePosition.X, 0, 246), 0, 22)}):Play()
            end)
            releaseconnection = uis.InputEnded:Connect(function(Mouse)
                if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                    SliderValue.Text = Value
                    Value = math.floor((((tonumber(options.Max) - tonumber(options.Min)) / 246) * SliderInner.AbsoluteSize.X) + tonumber(options.Min))
                    SliderValue.Text = Value
                    pcall(function()
                        pcall(options.Callback,Value)
                        SliderValue.Text = Value
                    end)
                    game.TweenService:Create(SliderInner,TweenInfo.new(.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size = UDim2.new(0, math.clamp(mouse.X - SliderInner.AbsolutePosition.X, 0, 246), 0, 22)}):Play()
                    moveconnection:Disconnect()
                    releaseconnection:Disconnect()
                end
            end)
        end)

        end

        return ElementTable
    end

    return TabTable
end


local win = Library:CreateWindow({
    Title = "Title"
})


local tab = win:AddTab({
    Text = "Text"
})

tab:AddButton({
    Text = "Button",
    Callback = function()
        
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
return Library
