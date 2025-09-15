-- Gui to Lua
-- Version: 3.2

-- Instances:
-- SIGMA.xysLebyss.xysV.35Key1hoh
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local UICorner_2 = Instance.new("UICorner")
local UIListLayout = Instance.new("UIListLayout")
local TextButton = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local ImageLabel = Instance.new("ImageLabel")
local TextButton_2 = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local ImageLabel_2 = Instance.new("ImageLabel")
local TextButton_3 = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local ImageLabel_3 = Instance.new("ImageLabel")
local TextButton_5 = Instance.new("TextButton") -- Новая кнопка для Silent Aim
local UICorner_9 = Instance.new("UICorner")
local ImageLabel_4 = Instance.new("ImageLabel")
local Key = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local UICorner_6 = Instance.new("UICorner")
local TextButton_4 = Instance.new("TextButton")
local UICorner_7 = Instance.new("UICorner")
local UICorner_8 = Instance.new("UICorner")
local TextLabel_2 = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 0.650
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.101744182, 0, 0.213622287, 0)
Frame.Size = UDim2.new(0, 216, 0, 241) -- Увеличиваем высоту для новой кнопки
Frame.Visible = false

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.106481485, 0, -0.0418848172, 0)
TextLabel.Size = UDim2.new(0, 216, 0, 25)
TextLabel.Font = Enum.Font.Cartoon
TextLabel.Text = "Lebyss.xys Premium V.35!!!"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextSize = 14.000

UICorner.Parent = TextLabel

UICorner_2.Parent = Frame

UIListLayout.Parent = Frame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TextButton.BackgroundTransparency = 0.600
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(-0.0733945295, 0, 0.114068441, 0)
TextButton.Size = UDim2.new(0, 216, 0, 50)
TextButton.Font = Enum.Font.Cartoon
TextButton.Text = "RAGE HitBox"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 14.000

UICorner_3.Parent = TextButton

ImageLabel.Parent = TextButton
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.0925925896, 0, 0.219999999, 0)
ImageLabel.Size = UDim2.new(0, 40, 0, 40)
ImageLabel.Image = "rbxassetid://480016543"
ImageLabel.ImageColor3 = Color3.fromRGB(0, 0, 0)

TextButton_2.Parent = Frame
TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TextButton_2.BackgroundTransparency = 0.600
TextButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.BorderSizePixel = 0
TextButton_2.Position = UDim2.new(-0.0733945295, 0, 0.114068441, 0)
TextButton_2.Size = UDim2.new(0, 216, 0, 50)
TextButton_2.Font = Enum.Font.Cartoon
TextButton_2.Text = "aim trigger"
TextButton_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.TextSize = 14.000

UICorner_4.Parent = TextButton_2

ImageLabel_2.Parent = TextButton_2
ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel_2.BackgroundTransparency = 1.000
ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel_2.BorderSizePixel = 0
ImageLabel_2.Position = UDim2.new(0.106481485, 0, 0.140000001, 0)
ImageLabel_2.Size = UDim2.new(0, 34, 0, 36)
ImageLabel_2.Image = "rbxassetid://16716965570"
ImageLabel_2.ImageColor3 = Color3.fromRGB(0, 0, 0)

TextButton_3.Parent = Frame
TextButton_3.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TextButton_3.BackgroundTransparency = 0.600
TextButton_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_3.BorderSizePixel = 0
TextButton_3.Position = UDim2.new(-0.0733945295, 0, 0.114068441, 0)
TextButton_3.Size = UDim2.new(0, 216, 0, 50)
TextButton_3.Font = Enum.Font.Cartoon
TextButton_3.Text = "ESP"
TextButton_3.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_3.TextSize = 14.000

UICorner_5.Parent = TextButton_3

ImageLabel_3.Parent = TextButton_3
ImageLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel_3.BackgroundTransparency = 1.000
ImageLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel_3.BorderSizePixel = 0
ImageLabel_3.Position = UDim2.new(0.0787037015, 0, 0.100000001, 0)
ImageLabel_3.Size = UDim2.new(0, 46, 0, 40)
ImageLabel_3.Image = "rbxassetid://121675214016411"
ImageLabel_3.ImageColor3 = Color3.fromRGB(0, 0, 0)

-- Новая кнопка Silent Aim
TextButton_5.Parent = Frame
TextButton_5.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TextButton_5.BackgroundTransparency = 0.600
TextButton_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_5.BorderSizePixel = 0
TextButton_5.Position = UDim2.new(-0.0733945295, 0, 0.114068441, 0)
TextButton_5.Size = UDim2.new(0, 216, 0, 50)
TextButton_5.Font = Enum.Font.Cartoon
TextButton_5.Text = "Silent Aim"
TextButton_5.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_5.TextSize = 14.000

UICorner_9.Parent = TextButton_5

ImageLabel_4.Parent = TextButton_5
ImageLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel_4.BackgroundTransparency = 1.000
ImageLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel_4.BorderSizePixel = 0
ImageLabel_4.Position = UDim2.new(0.0787037015, 0, 0.100000001, 0)
ImageLabel_4.Size = UDim2.new(0, 46, 0, 40)
ImageLabel_4.Image = "rbxassetid://121675214016411" -- Замените на подходящий ID изображения
ImageLabel_4.ImageColor3 = Color3.fromRGB(0, 0, 0)

Key.Name = "Key"
Key.Parent = ScreenGui
Key.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Key.BackgroundTransparency = 0.450
Key.BorderColor3 = Color3.fromRGB(0, 0, 0)
Key.BorderSizePixel = 0
Key.Position = UDim2.new(0.386094689, 0, 0.371670693, 0)
Key.Size = UDim2.new(0, 307, 0, 211)

TextBox.Parent = Key
TextBox.BackgroundColor3 = Color3.fromRGB(94, 94, 94)
TextBox.BackgroundTransparency = 0.350
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.214983717, 0, 0.255924165, 0)
TextBox.Size = UDim2.new(0, 170, 0, 39)
TextBox.Font = Enum.Font.SourceSans
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextSize = 14.000

UICorner_6.Parent = TextBox

TextButton_4.Parent = Key
TextButton_4.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
TextButton_4.BackgroundTransparency = 0.300
TextButton_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_4.BorderSizePixel = 0
TextButton_4.Position = UDim2.new(0.172638431, 0, 0.582938373, 0)
TextButton_4.Size = UDim2.new(0, 200, 0, 50)
TextButton_4.Font = Enum.Font.Fantasy
TextButton_4.Text = "Key up"
TextButton_4.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_4.TextSize = 20.000

UICorner_7.Parent = TextButton_4

UICorner_8.Parent = Key

TextLabel_2.Parent = Key
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.0358306207, 0, 0.0331753567, 0)
TextLabel_2.Size = UDim2.new(0, 281, 0, 34)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = "Lebyss.xys V.35!!! Покупка ключей"
TextLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.TextSize = 21.000

-- Scripts:

local function ZUIDC_fake_script() -- TextLabel.RainbowText 
	local script = Instance.new('Script', TextLabel)

	local text = script.Parent
	local add = 10
	wait(0.20)
	local k = 1
	while k <= 255 do
	text.BackgroundColor3= Color3.new(k/255,0/255,0/255)
	k = k + add
	wait()
	end
	while true do
	k = 1
	while k <= 255 do
			text.BackgroundColor3 = Color3.new(255/255,k/255,0/255)
	k = k + add
	wait()
	end
	k = 1
	while k <= 255 do
			text.BackgroundColor3 = Color3.new(255/255 - k/255,255/255,0/255)
	k = k + add
	wait()
	end
	k = 1
	while k <= 255 do
			text.BackgroundColor3 = Color3.new(0/255,255/255,k/255)
	k = k + add
	wait()
	end
	k = 1
	while k <= 255 do
			text.BackgroundColor3 = Color3.new(0/255,255/255 - k/255,255/255)
	k = k + add
	wait()
	end
	k = 1
	while k <= 255 do
			text.BackgroundColor3 = Color3.new(k/255,0/255,255/255)
	k = k + add
	wait()
	end
	k = 1
	while k <= 255 do
			text.BackgroundColor3 = Color3.new(255/255,0/255,255/255 - k/255)
	k = k + add
	wait()
	end
	while k <= 255 do
			text.BackgroundColor3 = Color3.new(255/255 - k/255,0/255,0/255)
	k = k + add
	wait()
	end
	end
end
coroutine.wrap(ZUIDC_fake_script)()
local function OGAP_fake_script() -- Frame.RainbowText 
	local script = Instance.new('Script', Frame)

	local text = script.Parent
	local add = 10
	wait(0.20)
	local k = 1
	while k <= 255 do
	text.BackgroundColor3= Color3.new(k/255,0/255,0/255)
	k = k + add
	wait()
	end
	while true do
	k = 1
	while k <= 255 do
			text.BackgroundColor3 = Color3.new(255/255,k/255,0/255)
	k = k + add
	wait()
	end
	k = 1
	while k <= 255 do
			text.BackgroundColor3 = Color3.new(255/255 - k/255,255/255,0/255)
	k = k + add
	wait()
	end
	k = 1
	while k <= 255 do
			text.BackgroundColor3 = Color3.new(0/255,255/255,k/255)
	k = k + add
	wait()
	end
	k = 1
	while k <= 255 do
			text.BackgroundColor3 = Color3.new(0/255,255/255 - k/255,255/255)
	k = k + add
	wait()
	end
	k = 1
	while k <= 255 do
			text.BackgroundColor3 = Color3.new(k/255,0/255,255/255)
	k = k + add
	wait()
	end
	k = 1
	while k <= 255 do
			text.BackgroundColor3 = Color3.new(255/255,0/255,255/255 - k/255)
	k = k + add
	wait()
	end
	while k <= 255 do
			text.BackgroundColor3 = Color3.new(255/255 - k/255,0/255,0/255)
	k = k + add
	wait()
	end
	end
end
coroutine.wrap(OGAP_fake_script)()
local function KEJI_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	script.Parent.MouseButton1Click:Connect(function()
		local SelectPart = "Head"
		local HBSizeX = 7
		local HBSizeY = 7
		local HBSizeZ = 7
		local HBTrans = 0.5
	
		local PurpleColor = BrickColor.new("Pink")
	
		local hitboxlist1 = {}
	
		local RunService = game:GetService("RunService")  
	
		task.spawn(function ()
			while wait(0.1) do
				for v, i in pairs(workspace:GetChildren()) do
					if i:FindFirstChild("HumanoidRootPart") and not i:FindFirstChild("Fake1") then
						local FakeHead = Instance.new("Part", i)
						FakeHead.CFrame = i.Head.CFrame
						FakeHead.Name = SelectPart
						FakeHead.Size = Vector3.new(HBSizeX, HBSizeY, HBSizeZ)
						FakeHead.Anchored = true
						FakeHead.CanCollide = false
						FakeHead.Transparency = HBTrans
						FakeHead.BrickColor = PurpleColor  -- Apply the purple color to the hitbox part
						local subndom = Instance.new("Part", i)
						subndom.Name = "Fake1"
						table.insert(hitboxlist1, FakeHead)
						table.insert(hitboxlist1, subndom)
						for d, obj in ipairs(hitboxlist1) do
							print(i, obj)  -- Выводит путь к объекту в иерархии
						end
					end
				end
			end
		end)
	end)
end
coroutine.wrap(KEJI_fake_script)()
local function UKICMG_fake_script() -- TextButton_2.LocalScript 
	local script = Instance.new('LocalScript', TextButton_2)

	script.Parent.MouseButton1Click:Connect(function()
		local circle = Drawing.new("Circle")
		circle.Visible = true
		circle.Radius = 30
		circle.Color = Color3.fromRGB(255, 255, 255)
		circle.Transparency = 0.5
		circle.Thickness = 1
		circle.Position = Vector2.new(workspace.CurrentCamera.ViewportSize.X/2, workspace.CurrentCamera.ViewportSize.Y/2)
		local smoothFactor = 0.25
	
	
		local function getHeadScreenPosition(character)
			local head = character:FindFirstChild("Head")
			if head then
				local screenPos, visible = workspace.CurrentCamera:WorldToViewportPoint(head.Position)
				return Vector2.new(screenPos.X, screenPos.Y), visible
			end
			return nil, false
		end
	
		local function findClosestPlayerInCircle()
			local closestPlayer = nil
			local closestDistance = math.huge
			local mousePos = circle.Position
	
			for _, model in ipairs(workspace:GetChildren()) do
				if model and model:IsA("Model") and model:FindFirstChild("HumanoidRootPart") and model:FindFirstChild("Head") then
					local headPos, visible = getHeadScreenPosition(model)
					if visible and headPos then
						local distance = (headPos - mousePos).Magnitude
						if distance <= circle.Radius and distance < closestDistance then
							closestDistance = distance
							closestPlayer = model
						end
					end
				end
			end
			return closestPlayer
		end
	
		-- Основной цикл
		game:GetService("RunService").RenderStepped:Connect(function()
			circle.Position = Vector2.new(workspace.CurrentCamera.ViewportSize.X/2, workspace.CurrentCamera.ViewportSize.Y/2)
	
			if game:GetService("UserInputService"):IsMouseButtonPressed(Enum.UserInputType.MouseButton3) then
				local target = findClosestPlayerInCircle()
				if target then
					local head = target:FindFirstChild("Head")
					if head then
						local screenPos = workspace.CurrentCamera:WorldToViewportPoint(head.Position)
						local targetPos = Vector2.new(screenPos.X, screenPos.Y)
						local currentPos = game:GetService("UserInputService"):GetMouseLocation()
						local delta = (targetPos - currentPos) * smoothFactor
						mousemoverel(delta.X, delta.Y)
					end
				end
			end
		end)
	end)
end
coroutine.wrap(UKICMG_fake_script)()
local function XOWNIUF_fake_script() -- TextButton_3.LocalScript 
	local script = Instance.new('LocalScript', TextButton_3)

	script.Parent.MouseButton1Click:Connect(function()
		local BoxESP = {}
		function BoxESP.Create(Player)
			local Box = Drawing.new("Square")
			Box.Visible = false
			Box.Color = Color3.fromRGB(255, 2, 213)
			Box.Filled = false
			Box.Transparency = 1
			Box.Thickness = 1
	
			local Updater
	
			local function UpdateBox()
				if Player and Player:IsA("Model") and Player:FindFirstChild("HumanoidRootPart") and Player:FindFirstChild("Head") then
					local Target2dPosition, IsVisible = workspace.CurrentCamera:WorldToViewportPoint(Player.HumanoidRootPart.Position)
					local scale_factor = 1 / (Target2dPosition.Z * math.tan(math.rad(workspace.CurrentCamera.FieldOfView * 0.5)) * 2) * 100
					local width, height = math.floor(40 * scale_factor), math.floor(62 * scale_factor)
					Box.Visible = IsVisible
					Box.Size = Vector2.new(width, height)
					Box.Position = Vector2.new(Target2dPosition.X - Box.Size.X / 2, Target2dPosition.Y - Box.Size.Y / 2)
				else
					Box.Visible = false
					if not Player then
						Box:Remove()
						Updater:Disconnect()
					end
				end
			end
	
			Updater = game:GetService("RunService").RenderStepped:Connect(UpdateBox)
	
			return Box
		end
	
		local Boxes = {}
	
		local function EnableBoxESP()
			for _, Player in pairs(game:GetService("Workspace"):GetChildren()) do
				if Player:IsA("Model") and Player:FindFirstChild("HumanoidRootPart") and Player:FindFirstChild("Head") then
					local Box = BoxESP.Create(Player)
					table.insert(Boxes, Box)
				end
			end
		end
	
		game.Workspace.DescendantAdded:Connect(function(i)
			if i:IsA("Model") and i:FindFirstChild("HumanoidRootPart") and i:FindFirstChild("Head") then
				local Box = BoxESP.Create(i)
				table.insert(Boxes, Box)
			end
		end)
	
		EnableBoxESP()
	end)
end
coroutine.wrap(XOWNIUF_fake_script)()

-- Новый скрипт для Silent Aim
local function SILENTAIM_fake_script() -- TextButton_5.LocalScript 
	local script = Instance.new('LocalScript', TextButton_5)

	local silentAimEnabled = false
	local silentAimConnection = nil
	
	script.Parent.MouseButton1Click:Connect(function()
		silentAimEnabled = not silentAimEnabled
		
		if silentAimEnabled then
			-- Включаем Silent Aim
			script.Parent.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Зеленый при включении
			
			-- Создаем круг прицеливания
			local circle = Drawing.new("Circle")
			circle.Visible = true
			circle.Radius = 60
			circle.Color = Color3.fromRGB(255, 0, 0)
			circle.Transparency = 0.5
			circle.Thickness = 2
			circle.Position = Vector2.new(workspace.CurrentCamera.ViewportSize.X/2, workspace.CurrentCamera.ViewportSize.Y/2)
			
			-- Функция для получения ближайшего игрока в круге
			local function getClosestPlayer()
				local closestPlayer = nil
				local closestDistance = math.huge
				local mousePos = Vector2.new(workspace.CurrentCamera.ViewportSize.X/2, workspace.CurrentCamera.ViewportSize.Y/2)
				
				for _, player in ipairs(game.Players:GetPlayers()) do
					if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
						local headPos, visible = workspace.CurrentCamera:WorldToViewportPoint(player.Character.Head.Position)
						if visible then
							local distance = (Vector2.new(headPos.X, headPos.Y) - mousePos).Magnitude
							if distance <= circle.Radius and distance < closestDistance then
								closestDistance = distance
								closestPlayer = player.Character
							end
						end
					end
				end
				return closestPlayer
			end
			
			-- Перехватываем выстрелы
			local oldNamecall
			oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
				local args = {...}
				local method = getnamecallmethod()
				
				if silentAimEnabled and method == "FindPartOnRayWithIgnoreList" and tostring(self) == "Workspace" then
					local closestPlayer = getClosestPlayer()
					if closestPlayer and closestPlayer:FindFirstChild("Head") then
						-- Меняем луч на направление к голове ближайшего игрока
						local origin = args[1].Origin
						local direction = (closestPlayer.Head.Position - origin).Unit * 1000
						args[1] = Ray.new(origin, direction)
						return oldNamecall(self, unpack(args))
					end
				end
				return oldNamecall(self, ...)
			end)
			
			-- Обновляем позицию круга
			silentAimConnection = game:GetService("RunService").RenderStepped:Connect(function()
				circle.Position = Vector2.new(workspace.CurrentCamera.ViewportSize.X/2, workspace.CurrentCamera.ViewportSize.Y/2)
			end)
		else
			-- Выключаем Silent Aim
			script.Parent.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Красный при выключении
			if silentAimConnection then
				silentAimConnection:Disconnect()
				silentAimConnection = nil
			end
		end
	end)
end
coroutine.wrap(SILENTAIM_fake_script)()

local function ZEKC_fake_script() -- Frame.Drag 
	local script = Instance.new('LocalScript', Frame)

	local parent: Frame = script.Parent
	parent.Draggable = true
	parent.Selectable = true
	parent.Active = true
end
coroutine.wrap(ZEKC_fake_script)()
local function LKGI_fake_script() -- TextButton_4.LocalScript 
	local script = Instance.new('LocalScript', TextButton_4)
   
	script.Parent.MouseButton1Click:Connect(function()
		if script.Parent.Parent.TextBox.Text == "SIGMA.xysLebyss.xysV.35Key1hoh" then
			script.Parent.Parent.Parent.Frame.Visible = true
			script.Parent.Parent.Parent.Key:Destroy()
			script.Parent.Parent.Parent.Key:Destroy()
		else
			script.Parent.Parent.TextBox.Text = "Wrong Key!"
		end
	end)
end
coroutine.wrap(LKGI_fake_script)()
local function BQNRSX_fake_script() -- Key.RainbowText 
	local script = Instance.new('Script', Key)

	local text = script.Parent
	local add = 10
	wait(0.20)
	local k = 1
	while k <= 255 do
	text.BackgroundColor3= Color3.new(k/255,0/255,0/255)
	k = k + add
	wait()
	end
	while true do
	k = 1
	while k <= 255 do
			text.BackgroundColor3 = Color3.new(255/255,k/255,0/255)
	k = k + add
	wait()
	end
	k = 1
	while k <= 255 do
			text.BackgroundColor3 = Color3.new(255/255 - k/255,255/255,0/255)
	k = k + add
	wait()
	end
	k = 1
	while k <= 255 do
			text.BackgroundColor3 = Color3.new(0/255,255/255,k/255)
	k = k + add
	wait()
	end
	k = 1
	while k <= 255 do
			text.BackgroundColor3 = Color3.new(0/255,255/255 - k/255,255/255)
	k = k + add
	wait()
	end
	k = 1
	while k <= 255 do
			text.BackgroundColor3 = Color3.new(k/255,0/255,255/255)
	k = k + add
	wait()
	end
	k = 1
	while k <= 255 do
			text.BackgroundColor3 = Color3.new(255/255,0/255,255/255 - k/255)
	k = k + add
	wait()
	end
	while k <= 255 do
			text.BackgroundColor3 = Color3.new(255/255 - k/255,0/255,0/255)
	k = k + add
	wait()
	end
	end
end
coroutine.wrap(BQNRSX_fake_script)()
local function DIPX_fake_script() -- TextLabel_2.RainbowText 
	local script = Instance.new('Script', TextLabel_2)

	local text = script.Parent
	local add = 10
	wait(1)
	local k = 1
	while k <= 255 do
	text.TextColor3 = Color3.new(k/255,0/255,0/255)
	k = k + add
	wait()
	end
	while true do
	k = 1
	while k <= 255 do
	text.TextColor3 = Color3.new(255/255,k/255,0/255)
	k = k + add
	wait()
	end
	k = 1
	while k <= 255 do
	text.TextColor3 = Color3.new(255/255 - k/255,255/255,0/255)
	k = k + add
	wait()
	end
	k = 1
	while k <= 255 do
	text.TextColor3 = Color3.new(0/255,255/255,k/255)
	k = k + add
	wait()
	end
	k = 1
	while k <= 255 do
	text.TextColor3 = Color3.new(0/255,255/255 - k/255,255/255)
	k = k + add
	wait()
	end
	k = 1
	while k <= 255 do
	text.TextColor3 = Color3.new(k/255,0/255,255/255)
	k = k + add
	wait()
	end
	k = 1
	while k <= 255 do
	text.TextColor3 = Color3.new(255/255,0/255,255/255 - k/255)
	k = k + add
	wait()
	end
	while k <= 255 do
	text.TextColor3 = Color3.new(255/255 - k/255,0/255,0/255)
	k = k + add
	wait()
	end
	end
end
coroutine.wrap(DIPX_fake_script)()
