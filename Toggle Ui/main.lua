
local Library = {}

function Library:Window()
	local Toggle = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")
	local Credits = Instance.new("TextLabel")
	Toggle.Name = "Toggle"
	Toggle.Parent = game.CoreGui
	Toggle.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Frame.Parent = Toggle
	Frame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.398441553, 0, 0.482954532, 0)
	Frame.Size = UDim2.new(0, 273, 0, 143)
	UICorner_3.CornerRadius = UDim.new(0, 5)
	UICorner_3.Parent = Frame
	Frame.Active = true
	Frame.Draggable = true
	
	Credits.Name = "Credits"
	Credits.Parent = Frame
	Credits.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Credits.BackgroundTransparency = 1.000
	Credits.Position = UDim2.new(0, 0, 0.832167804, 0)
	Credits.Size = UDim2.new(0, 273, 0, 24)
	Credits.Font = Enum.Font.GothamSemibold
	Credits.Text = "Made By Majora#0001"
	Credits.TextColor3 = Color3.fromRGB(255, 255, 255)
	Credits.TextSize = 25.000
	
	local ToggleHolder = {}
	
	function ToggleHolder:Toggle(name,callback)
		local TextButton = Instance.new("TextButton")
		local Text = Instance.new("TextLabel")
		local Frame_2 = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UICorner_2 = Instance.new("UICorner")




		TextButton.Parent = Frame
		TextButton.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
		TextButton.BorderSizePixel = 0
		TextButton.Position = UDim2.new(0.0842490867, 0, 0.321678311, 0)
		TextButton.Size = UDim2.new(0, 233, 0, 50)
		TextButton.Font = Enum.Font.SourceSans
		TextButton.Text = ""
		TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		TextButton.TextSize = 14.000

		Text.Name = "Text"
		Text.Parent = TextButton
		Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text.BackgroundTransparency = 1.000
		Text.Position = UDim2.new(0.0343347639, 0, 0, 0)
		Text.Text = name
		Text.Size = UDim2.new(0, 112, 0, 50)
		Text.Font = Enum.Font.SourceSans
		Text.TextColor3 = Color3.fromRGB(88, 88, 88)
		Text.TextSize = 25.000
		Text.TextXAlignment = Enum.TextXAlignment.Left

		Frame_2.Parent = TextButton
		Frame_2.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
		Frame_2.BorderSizePixel = 0
		Frame_2.Position = UDim2.new(0.802575111, 0, 0.200000003, 0)
		Frame_2.Size = UDim2.new(0, 30, 0, 30)

		UICorner.CornerRadius = UDim.new(0, 15)
		UICorner.Parent = Frame_2

		UICorner_2.CornerRadius = UDim.new(0, 5)
		UICorner_2.Parent = TextButton





		local Toggled = false

		TextButton.MouseButton1Click:Connect(function()
			if Toggled == true then
				Toggled = not Toggled
				pcall(callback, Toggled)
				game:GetService("TweenService"):Create(Frame_2, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(231, 76, 60)} ):Play()
			elseif Toggled == false then
				Toggled = not Toggled
				pcall(callback, Toggled)
				game:GetService("TweenService"):Create(Frame_2, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(11, 232, 129)} ):Play()
			end
		end)

	end
	return ToggleHolder
end

return Library
