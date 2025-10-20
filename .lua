local SoundService = game:GetService("SoundService")
local Players = game:GetService("Players")

-- Функция для воспроизведения музыки и показа изображения
local function playMusicAndShowImage(player)
    -- Создаем ScreenGui для изображения
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "ToiletImageGui"
    screenGui.Parent = player.PlayerGui
    screenGui.ResetOnSpawn = false
    
    -- Создаем ImageLabel с изображением
    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Size = UDim2.new(1, 0, 1, 0) -- На весь экран
    imageLabel.Position = UDim2.new(0, 0, 0, 0)
    imageLabel.BackgroundColor3 = Color3.new(0, 0, 0)
    imageLabel.BorderSizePixel = 0
    imageLabel.Image = "rbxassetid://ЗДЕСЬ_ВСТАВЬ_АЙДИ_ИЗОБРАЖЕНИЯ" -- Замени на ID изображения
    imageLabel.ScaleType = Enum.ScaleType.Fit -- Сохраняет пропорции
    imageLabel.Parent = screenGui
    
    -- Создаем звук
    local sound = Instance.new("Sound")
    sound.Name = "LebyssSong"
    sound.SoundId = "rbxassetid://ЗДЕСЬ_ВСТАВЬ_АЙДИ_АУДИО" -- Замени на ID аудио
    sound.Volume = 1
    sound.Looped = false
    sound.Parent = player.PlayerGui
    
    -- Воспроизводим звук
    sound:Play()
    
    -- Останавливаем через 3 секунды и убираем изображение
    delay(3, function()
        -- Останавливаем и удаляем звук
        if sound then
            sound:Stop()
            sound:Destroy()
        end
        
        -- Удаляем изображение
        if screenGui.Parent then
            screenGui:Destroy()
        end
    end)
end

-- Обработчик для нового игрока
Players.PlayerAdded:Connect(playMusicAndShowImage)

-- Обработчик для уже подключенных игроков
for _, player in ipairs(Players:GetPlayers()) do
    playMusicAndShowImage(player)
end
