if game.CoreGui:FindFirstChild("Sex") then
    game.CoreGui.Sex:Destroy()
end

local Library = {}

function Library:Window(name)
    local Sex = Instance.new("ScreenGui")
    local Top = Instance.new("Frame")
    local Name = Instance.new("TextLabel")
    local close = Instance.new("ImageButton")
    local Main = Instance.new("ScrollingFrame")
    local UIGridLayout = Instance.new("UIGridLayout")
    local UIPadding = Instance.new("UIPadding")

    Sex.Name = "Sex"
    Sex.Parent = game.CoreGui
    Sex.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Top.Name = "Top"
    Top.Parent = Sex
    Top.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
    Top.BorderSizePixel = 0
    Top.Position = UDim2.new(0.220779225, 0, 0.265151501, 0)
    Top.Size = UDim2.new(0, 464, 0, 37)
    local UserInputService = game:GetService("UserInputService")

    local gui = Top
    
    local dragging
    local dragInput
    local dragStart
    local startPos
    
    local function update(input)
    local delta = input.Position - dragStart
    gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    gui.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
    dragging = true
    dragStart = input.Position
    startPos = gui.Position
    
    input.Changed:Connect(function()
    if input.UserInputState == Enum.UserInputState.End then
    dragging = false
    end
    end)
    end
    end)
    
    gui.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
    dragInput = input
    end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
    update(input)
    end
    end)

    Name.Name = "name"
    Name.Parent = Top
    Name.BackgroundColor3 = Color3.fromRGB(88, 88, 88)
    Name.BackgroundTransparency = 1.000
    Name.Size = UDim2.new(0, 464, 0, 34)
    Name.Text = name
    Name.Font = Enum.Font.Gotham
    Name.TextColor3 = Color3.fromRGB(77, 77, 77)
    Name.TextSize = 25.000

    close.Name = "close"
    close.Parent = Top
    close.AnchorPoint = Vector2.new(0, 1)
    close.BackgroundTransparency = 1.000
    close.Position = UDim2.new(0.920258641, 0, 0.82432431, 0)
    close.Rotation = 180.000
    close.Size = UDim2.new(0, 25, 0, 25)
    close.ZIndex = 2
    close.Image = "rbxassetid://3926305904"
    close.ImageColor3 = Color3.fromRGB(88, 88, 88)
    close.ImageRectOffset = Vector2.new(284, 4)
    close.ImageRectSize = Vector2.new(24, 24)

    Main.Name = "Main"
    Main.Parent = Top
    Main.Active = true
    Main.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0, 0, 0.972973406, 0)
    Main.Size = UDim2.new(0, 464, 0, 292)
    Main.CanvasSize = UDim2.new(0, 0, 15, 0)
    Main.ScrollBarThickness = 4
	local opened = true
	close.MouseButton1Click:Connect(function()
		if opened == true then		
			Main:TweenSize(UDim2.new(0, 464, 0, 0))
			game:GetService("TweenService"):Create(close,TweenInfo.new(1, Enum.EasingStyle.Elastic),{Rotation = 45}):Play()
	
			repeat wait(0.1) until Main.Size.Y == UDim.new(0,0)
            Main.ScrollBarThickness = 0
			opened = false
		elseif opened == false then 
			Main:TweenSize(UDim2.new(0, 464, 0, 292))
            Main.ScrollBarThickness = 4
			game:GetService("TweenService"):Create(close,TweenInfo.new(1, Enum.EasingStyle.Elastic),{Rotation = 180}):Play()
	
			repeat wait(0.1) until Main.Size.Y == UDim.new(0,292)
			opened = true
		end
	end)

    UIGridLayout.Parent = Main
    UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIGridLayout.CellSize = UDim2.new(0, 441, 0, 35)

    UIPadding.Parent = Main
    UIPadding.PaddingTop = UDim.new(0, 9)

    local Holder = {}

    function Holder:Button(name,callback)
        local Button = Instance.new("TextButton")
        local UICorner = Instance.new("UICorner")
        Button.Name = "Button"
        Button.Parent = Main
        Button.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
        Button.BorderSizePixel = 0
        Button.Position = UDim2.new(0.0223430954, 0, 0.0239726026, 0)
        Button.Size = UDim2.new(0, 441, 0, 35)
        Button.AutoButtonColor = false
        Button.Text = name
        Button.Font = Enum.Font.Gotham
        Button.TextColor3 = Color3.fromRGB(77, 77, 77)
        Button.TextSize = 25.000
        Button.MouseEnter:Connect(function()
            game:GetService("TweenService"):Create(Button,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(55, 55, 55)}):Play()
        end)
        Button.MouseLeave:Connect(function()
            game:GetService("TweenService"):Create(Button,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(44,44,44)}):Play()
        end)
        Button.MouseButton1Click:Connect(function()
            pcall(callback)
        end)
        UICorner.Parent = Button
    end
    function Holder:Toggle(name,callback)
        local Toggle = Instance.new("TextButton")
        local Text = Instance.new("TextLabel")
        local Status = Instance.new("Frame")
        local UICorner_2 = Instance.new("UICorner")
        local UICorner_3 = Instance.new("UICorner")
          
        Toggle.Name = "Toggle"
        Toggle.Parent = Main
        Toggle.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
        Toggle.BorderSizePixel = 0
        Toggle.Position = UDim2.new(-0.000166535378, 0, 0.143596053, 0)
        Toggle.Size = UDim2.new(0, 462, 0, 50)
        Toggle.AutoButtonColor = false
        Toggle.Text = ""
        Toggle.Font = Enum.Font.Gotham
        Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
        Toggle.TextSize = 14.000
        
	Toggle.MouseEnter:Connect(function()
            game:GetService("TweenService"):Create(Toggle,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(55, 55, 55)}):Play()
        end)
        Toggle.MouseLeave:Connect(function()
            game:GetService("TweenService"):Create(Toggle,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(44,44,44)}):Play()
        end)
	 local toggled = false
        Toggle.MouseButton1Down:Connect(function()
            if toggled == true then
                toggled = not toggled
                pcall(callback, toggled)
                game:GetService("TweenService"):Create(Status, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(77,77,77)} ):Play()
            elseif toggled == false then
                toggled = not toggled
                pcall(callback, toggled)
                game:GetService("TweenService"):Create(Status, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(11, 232, 129)} ):Play()
            end
        end)
        Text.Name = "Text"
        Text.Parent = Toggle
        Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Text.BackgroundTransparency = 1.000
        Text.Position = UDim2.new(0.0138515206, 0, -0.0190473292, 0)
        Text.Size = UDim2.new(0, 112, 0, 37)
        Text.Text = name
        Text.Font = Enum.Font.Gotham
        Text.TextColor3 = Color3.fromRGB(88, 88, 88)
        Text.TextSize = 25.000
        Text.TextXAlignment = Enum.TextXAlignment.Left
        
        Status.Name = "Status"
        Status.Parent = Toggle
        Status.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
        Status.BorderSizePixel = 0
        Status.Position = UDim2.new(0.927600861, 0, 0.142857134, 0)
        Status.Size = UDim2.new(0, 25, 0, 25)
        
        UICorner_2.CornerRadius = UDim.new(0, 10)
        UICorner_2.Parent = Status
        
        UICorner_3.Parent = Toggle      
    end
    return Holder
end
return Library
