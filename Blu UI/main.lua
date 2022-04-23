if game.CoreGui:FindFirstChild("UI") then
    game.CoreGui.UI:Destroy()
end

local Majora = {}

function Majora:Window(name)
    local UI = Instance.new("ScreenGui")
    local Main = Instance.new("ImageLabel")
    local Sidebar = Instance.new("ImageLabel")
    local Tabs = Instance.new("Frame")
    local tabListing = Instance.new("UIListLayout")
    local Pages = Instance.new("ScrollingFrame")
    local pageFolder = Instance.new("Folder")
    local Title = Instance.new("TextLabel")

    UI.Name = "UI"
    UI.Parent = game.CoreGui

    Main.Name = "Main"
    Main.Parent = UI
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Main.BackgroundTransparency = 1.000
    Main.Position = UDim2.new(0.503172934, 0, 0.5, 0)
    Main.Size = UDim2.new(0, 576, 0, 453)
    Main.Image = "rbxassetid://3570695787"
    Main.ImageColor3 = Color3.fromRGB(35, 35, 35)
    Main.ScaleType = Enum.ScaleType.Slice
    Main.SliceCenter = Rect.new(100, 100, 100, 100)
    Main.SliceScale = 0.130

    Sidebar.Name = "Sidebar"
    Sidebar.Parent = Main
    Sidebar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Sidebar.BackgroundTransparency = 1.000
    Sidebar.Position = UDim2.new(-0.213541672, 0, 0, 0)
    Sidebar.Size = UDim2.new(0, 111, 0, 453)
    Sidebar.Image = "rbxassetid://3570695787"
    Sidebar.ImageColor3 = Color3.fromRGB(35, 35, 35)
    Sidebar.ScaleType = Enum.ScaleType.Slice
    Sidebar.SliceCenter = Rect.new(100, 100, 100, 100)
    Sidebar.SliceScale = 0.130

    local UserInputService = game:GetService("UserInputService")

    local gui = Main

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
    Tabs.Name = "Tabs"
    Tabs.Parent = Sidebar
    Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Tabs.BackgroundTransparency = 1.000
    Tabs.Position = UDim2.new(0.0450450443, 0, 0.0176600441, 0)
    Tabs.Size = UDim2.new(0, 100, 0, 438)

    tabListing.Name = "tabListing"
    tabListing.Parent = Tabs
    tabListing.SortOrder = Enum.SortOrder.LayoutOrder
    tabListing.Padding = UDim.new(0, 2)

    Pages.Name = "Pages"
    Pages.Parent = Sidebar
    Pages.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Pages.BackgroundTransparency = 1.000
    Pages.BorderSizePixel = 0
    Pages.Position = UDim2.new(1.10810816, 0, 0.0905077234, 0)
    Pages.Selectable = false
    Pages.Size = UDim2.new(0, 576, 0, 412)
    Pages.ScrollBarThickness = 6

    pageFolder.Name = "pageFolder"
    pageFolder.Parent = Pages

    Title.Parent = Main
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.Size = UDim2.new(0, 576, 0, 41)
    Title.Font = Enum.Font.GothamSemibold
    Title.Text = name
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 27.000

    local TabHandler = {}

    local first = true

    function TabHandler:Tab(name)
        local newTab = Instance.new("TextButton")
        local round = Instance.new("ImageLabel")
        local newPage = Instance.new("Frame")
        local Listing = Instance.new("UIListLayout")
        local Padding = Instance.new("UIPadding")
        
        newTab.Name = "newTab"
        newTab.Parent = Tabs
        newTab.BackgroundColor3 = Color3.fromRGB(52, 152, 219)
        newTab.BackgroundTransparency = 1.000
        newTab.BorderSizePixel = 0
        newTab.Size = UDim2.new(0, 100, 0, 33)
        newTab.ZIndex = 2
        newTab.Font = Enum.Font.Gotham
        newTab.Text = name
        newTab.TextColor3 = Color3.fromRGB(255, 255, 255)
        newTab.TextSize = 14.000


        round.Name = "round"
        round.Parent = newTab
        round.Active = true
        round.AnchorPoint = Vector2.new(0.5, 0.5)
        round.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        round.BackgroundTransparency = 1.000
        round.Position = UDim2.new(0.5, 0, 0.5, 0)
        round.Selectable = true
        round.Size = UDim2.new(1, 0, 1, 0)
        round.Image = "rbxassetid://3570695787"
        round.ImageColor3 = Color3.fromRGB(52, 152, 219)
        round.ScaleType = Enum.ScaleType.Slice
        round.SliceCenter = Rect.new(100, 100, 100, 100)
        round.SliceScale = 0.050
        
        newPage.Name = "newPage"
        newPage.Parent = pageFolder
        newPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        newPage.BackgroundTransparency = 1.000
        newPage.Size = UDim2.new(0, 576, 0, 412)
        if first then
            first = false
            newPage.Visible = true
        else
            newPage.Visible = false
        end
        newTab.MouseButton1Click:Connect(function()
            for i,v in next, pageFolder:GetChildren() do
                v.Visible = false
            end 
            newPage.Visible = true
        end)
        Listing.Name = "Listing"
        Listing.Parent = newPage
        Listing.HorizontalAlignment = Enum.HorizontalAlignment.Center
        Listing.SortOrder = Enum.SortOrder.LayoutOrder
        Listing.Padding = UDim.new(0, 5)
        
        Padding.Name = "Padding"
        Padding.Parent = newPage
        Padding.PaddingRight = UDim.new(0, 5)
        Padding.PaddingTop = UDim.new(0, 5)

        local StuffHandler = {}

        function StuffHandler:Button(name,callback)
            callback = callback or function() end
    
            local Button = Instance.new("TextButton")
            local UICorner = Instance.new("UICorner")
    
            Button.Name = "Button"
            Button.Parent = newPage
            Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            Button.BorderSizePixel = 0
            Button.Size = UDim2.new(0, 500, 0, 50)
            Button.AutoButtonColor = false
            Button.Text = name
            Button.Font = Enum.Font.Gotham
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextSize = 25.000
            Button.MouseEnter:Connect(function()
                game:GetService("TweenService"):Create(Button,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(45,45,45)}):Play()
            end)
            
            Button.MouseLeave:Connect(function()
                game:GetService("TweenService"):Create(Button,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(30,30,30)}):Play()
            end)
            
            Button.MouseButton1Click:Connect(function()
                pcall(callback)
                game:GetService("TweenService"):Create(Button,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(52, 152, 219)}):Play()
                wait(0.15)
                game:GetService("TweenService"):Create(Button,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(30,30,30)}):Play()
            end)

            
            UICorner.Parent = Button
        end

        function StuffHandler:Toggle(name, callback)
            local Toggle = Instance.new("TextButton")
            local UICorner = Instance.new("UICorner")
            local info = Instance.new("TextLabel")
            local img = Instance.new("ImageButton")
            local imgback = Instance.new("Frame")

            Toggle.Name = "Toggle"
            Toggle.Parent = newPage
            Toggle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            Toggle.BorderSizePixel = 0
            Toggle.Size = UDim2.new(0, 500, 0, 50)
            Toggle.AutoButtonColor = false
            Toggle.Font = Enum.Font.Gotham
            Toggle.Text = ""
            Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
            Toggle.TextSize = 25.000

            UICorner.Parent = Toggle

            info.Name = "info"
            info.Parent = Toggle
            info.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            info.BackgroundTransparency = 1.000
            info.Position = UDim2.new(0.0260000005, 0, 0, 0)
            info.Size = UDim2.new(0, 373, 0, 50)
            info.Font = Enum.Font.Gotham
            info.Text = name
            info.TextColor3 = Color3.fromRGB(255, 255, 255)
            info.TextSize = 25.000
            info.TextXAlignment = Enum.TextXAlignment.Left

            img.Name = "img"
            img.Parent = Toggle
            img.BackgroundTransparency = 1.000
            img.LayoutOrder = 4
            img.Position = UDim2.new(0.905370593, 0, 0.109128416, 0)
            img.Size = UDim2.new(0, 40, 0, 40)
            img.ZIndex = 2
            img.AutoButtonColor = false
            img.Image = "rbxassetid://3926311105"
            img.ImageColor3 = Color3.fromRGB(77, 77, 77)
            img.ImageRectOffset = Vector2.new(4, 836)
            img.ImageRectSize = Vector2.new(48, 48)

            imgback.Name = "imgback"
            imgback.Parent = Toggle
            imgback.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
            imgback.BorderColor3 = Color3.fromRGB(27, 42, 53)
            imgback.Position = UDim2.new(0.921000123, 0, 0.229000241, 0)
            imgback.Size = UDim2.new(0, 25, 0, 28)

            Toggle.MouseEnter:Connect(function()
                game:GetService("TweenService"):Create(Toggle,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(45,45,45)}):Play()
            end)
            
            Toggle.MouseLeave:Connect(function()
                game:GetService("TweenService"):Create(Toggle,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(30,30,30)}):Play()
            end)
	



	        local on = false
	
            Toggle.MouseButton1Down:Connect(function()
                if on == true then
                    on = not on
                    pcall(callback,on)
                    game:GetService("TweenService"):Create(img, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(77,77,77)} ):Play()
                    game:GetService("TweenService"):Create(imgback, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(77,77,77)} ):Play()
                elseif on == false then
                    on = not on
                    pcall(callback,on)
                    game:GetService("TweenService"):Create(img, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(52, 152, 219)} ):Play()
                    game:GetService("TweenService"):Create(imgback, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(255,255,255)} ):Play()
                end
            end)

        end

        return StuffHandler
    end

    return TabHandler
end

return Majora





