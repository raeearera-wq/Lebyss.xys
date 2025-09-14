

local Players = game:GetService("Players")

local function createFullscreenGui(player)
    -- Создаем ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "RainbowMessage"
    screenGui.Parent = player.PlayerGui
    screenGui.ResetOnSpawn = false
    
    -- Создаем текстовый лейбл
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0) -- На весь экран
    textLabel.Position = UDim2.new(0, 0, 0, 0)
    textLabel.BackgroundColor3 = Color3.new(0, 0, 0) -- Черный фон
    textLabel.Text = "Чит закрылся он на обнове"
    textLabel.TextColor3 = Color3.new(1, 1, 1) -- Начальный цвет текста
    textLabel.TextScaled = true -- Автоматическое масштабирование текста
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextStrokeTransparency = 0.8 -- Обводка текста
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    textLabel.Parent = screenGui
    
    -- Цвета радуги
    local rainbowColors = {
        Color3.fromRGB(255, 0, 0),    -- Красный
        Color3.fromRGB(255, 165, 0),  -- Оранжевый
        Color3.fromRGB(255, 255, 0),  -- Желтый
        Color3.fromRGB(0, 255, 0),    -- Зеленый
        Color3.fromRGB(0, 0, 255),    -- Синий
        Color3.fromRGB(75, 0, 130),   -- Индиго
        Color3.fromRGB(238, 130, 238) -- Фиолетовый
    }
    
    -- Анимация радужных цветов
    local currentColorIndex = 1
    local colorChangeSpeed = 0.2 -- Скорость смены цветов
    
    local colorCoroutine = coroutine.wrap(function()
        while textLabel.Parent do
            textLabel.TextColor3 = rainbowColors[currentColorIndex]
            currentColorIndex = (currentColorIndex % #rainbowColors) + 1
            wait(colorChangeSpeed)
        end
    end)
    
    colorCoroutine()
    
    -- Удаление через 3 секунды
    delay(3, function()
        if screenGui.Parent then
            screenGui:Destroy()
        end
    end)
end

-- Обработчик для нового игрока
Players.PlayerAdded:Connect(createFullscreenGui)

-- Обработчик для уже подключенных игроков
for _, player in ipairs(Players:GetPlayers()) do
    createFullscreenGui(player)
end
