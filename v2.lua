local Players = game:GetService("Players")
local targetPlayerName = "Inthermals";
local player = game.Players.LocalPlayer
local character = player.Character
local LocalPlr = Players.LocalPlayer
local SelectedPlayer = ""
local TargetPlr = nil
local version = "v1.8";









-- Ignore GUI



-- Function to create a shadow for the panel




local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "PyramidGUI"
gui.Parent = player.PlayerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 600, 0, 450)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -225)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
mainFrame.BorderSizePixel = 1
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Visible = true  -- Default visibility
mainFrame.Parent = gui

local captionBar = Instance.new("Frame")
captionBar.Size = UDim2.new(1, 0, 0, 30)
captionBar.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
captionBar.BorderSizePixel = 1
captionBar.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -30, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Pyramid " .. tostring(version);
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = captionBar

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 16
closeButton.BorderSizePixel = 0
closeButton.Parent = captionBar

local header = Instance.new("TextLabel")
header.Size = UDim2.new(0.3, 0.3, 0, 45)
header.Position = UDim2.new(0, 0, 0, 35)  -- Adjusted position
header.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
header.BorderColor3 = Color3.fromRGB(16, 16, 16)  -- Set border color to match background
header.Text = "Main"
header.TextColor3 = Color3.new(1, 1, 1)
header.Font = Enum.Font.SourceSansBold
header.TextSize = 16  -- Increased text size
header.Parent = mainFrame

local subText = Instance.new("TextLabel")
subText.Size = UDim2.new(0.3, 0, 0, 30)  -- Adjusted size
subText.Position = UDim2.new(0, 0, 0, 90)  -- Adjusted position
subText.BackgroundTransparency = 1
subText.Text = "Host: " .. tostring(targetPlayerName);
subText.TextColor3 = Color3.new(1, 1, 1)
subText.Font = Enum.Font.SourceSans
subText.TextSize = 14  -- Increased text size
subText.Parent = mainFrame

local isVisible = true  -- Keeps track of GUI visibility

local function toggleGUI()
    isVisible = not isVisible
    mainFrame.Visible = isVisible
end

closeButton.MouseButton1Click:Connect(function()
    toggleGUI()
end)

game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.K then
        toggleGUI()
    end
end)



















































local function airlock()
	local a1 = game.Players.LocalPlayer
local ax = a1.Character

local teleportOffset = Vector3.new(0, 15, 0)  -- Adjust the offset as per your requirement

-- Check if the character and HumanoidRootPart exist
if ax and ax:FindFirstChild("HumanoidRootPart") then
    local humanoidRootPart = ax.HumanoidRootPart

    -- Teleport the character
    humanoidRootPart.CFrame = humanoidRootPart.CFrame + teleportOffset

    -- Lock the character in the new position
  game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
end

end




local function unairlock()
	local a1 = game.Players.LocalPlayer
local ax = a1.Character

local teleportOffset = Vector3.new(0, 15, 0)  -- Adjust the offset as per your requirement

-- Check if the character and HumanoidRootPart exist
if ax and ax:FindFirstChild("HumanoidRootPart") then
    local humanoidRootPart = ax.HumanoidRootPart

    -- Teleport the character
    humanoidRootPart.CFrame = humanoidRootPart.CFrame + teleportOffset

    -- Lock the character in the new position
  game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
end

end





local StrafeSpeed = 0

local TargetStrafe = {
    Enabled = false,
    Speed = 30,
    Distance = 1,
    Height = 3
}

local function getPlr()
    StrafeSpeed = StrafeSpeed + TargetStrafe.Speed

    if TargetPlr then
        LocalPlr.Character.HumanoidRootPart.CFrame = TargetPlr.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(StrafeSpeed), 0) * CFrame.new(0, TargetStrafe.Height, TargetStrafe.Distance)
    end
end

local heartbeatConnection
heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(getPlr)

local function getStop()
    heartbeatConnection:Disconnect()
end




-- Command Functions


local function tpHOST()
    local targetPlayer = Players:FindFirstChild(targetPlayerName)

    if targetPlayer then
        local targetCharacter = targetPlayer.Character
        if targetCharacter then
            local targetPosition = targetCharacter.PrimaryPart.Position




			local function teleportTo(position)
    local character = game.Players.LocalPlayer.Character
    if character then
        character:SetPrimaryPartCFrame(CFrame.new(position))
    end
end

local function getPreviousPosition()
    local character = game.Players.LocalPlayer.Character
    if character then
        return character.PrimaryPart.CFrame.Position
    end
end

local function handleTeleporting()
 
    local prevPosition = getPreviousPosition()

    -- Freeze the player
    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.PlatformStand = true
    end

    -- Teleport the player 500 units away
    local teleportPosition = targetCharacter.PrimaryPart.Position
    teleportTo(teleportPosition)

    -- Wait for 1 second (you can adjust the duration as needed)
    wait(1)

    -- Attempt to teleport the player back to the previous position
    repeat
        teleportTo(prevPosition)
        wait()
    until (game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - prevPosition).Magnitude <= 1

    -- Check if the player is still alive, if not, wait for them to respawn
    while game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health <= 0 do
        wait()
    end

    -- Unfreeze the player after teleporting back and respawn
    if humanoid then
        humanoid.PlatformStand = false
    end

    -- Enable checking armor again once the armor value is above 10
end

handleTeleporting()


			


			
        end
    end
end



-- Function to freeze the character's movement
local function freeze()
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
end


local function unfreeze()
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
end




-- Assuming you have these defined somewhere in your script
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local TargetStrafe = {
    Enabled = false,
    Speed = 40,
    Radius = 6,
    Height = 3
}

local TargetUsername = targetPlayerName  

local TargetPlr = Players:FindFirstChild(TargetUsername)
local Angle = 0

-- Function to enable/disable strafing
local function setStrafeEnabled(enabled)
    TargetStrafe.Enabled = enabled
end

-- Function to update strafing
local function updateStrafe()
    if TargetStrafe.Enabled and TargetPlr then
        local TargetHRP = TargetPlr.Character and TargetPlr.Character:FindFirstChild("HumanoidRootPart")
        local LocalHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if TargetHRP and LocalHRP then
            Angle = Angle + math.rad(TargetStrafe.Speed)
            local offsetX = TargetStrafe.Radius * math.cos(Angle)
            local offsetZ = TargetStrafe.Radius * math.sin(Angle)
            local newCFrame = TargetHRP.CFrame * CFrame.new(offsetX, TargetStrafe.Height, offsetZ)
            LocalHRP.CFrame = newCFrame
        end
    end
end

-- Command Handlers
local isChained = false







-- Command Executer




local function onPlayerChatted(message, player)
    if player.Name == targetPlayerName then
        print(string.format("[%s]: %s", player.Name, message))
        
        -- Command Yeti v2.7 By Badovh
        
        
        if message:lower() == "!tp" then
            print("Bringing Account!")
            tpHOST()
        end
        
        
          if message:lower() == "!freeze" then
            print("Freezing Account!")
            freeze()
        end
        
        
          if message:lower() == "!unfreeze" then
            print("Unfreezing Account!")
            unfreeze()
        end


         if message:sub(1, 5):lower() == "!bring " then
            local playerName = message:sub(6) -- Extract the player name from the message

            if playerName ~= "" then
                print("Getting player: " .. playerName)
                SelectedPlayer = playerName -- Set the player name in the SelectedPlayer variable
                TargetPlr = Players:FindFirstChild(SelectedPlayer)
                getPlr() -- Start following the selected player
            else
                print("Invalid player name")
            end
        end

        if message:lower() == "!stopget" then
            print("Stopping!")
            getStop()
        end

	 if message:lower() == "!chain" then
            print("Starting chaining!")
            setStrafeEnabled(true)
            isChained = true
        end

        if message:lower() == "!unchain" then
            print("Stopping chaining!")
            setStrafeEnabled(false)
            isChained = false
        end



		  if message:lower() == "!getff" then
            print("Usage")
            -- Game: HoodModded
-- Developer: Stella
-- Version: 1.0.3
-- Type: Paid Model

local player = game.Players.LocalPlayer

local loggedCFrame = nil

local function killSelf()
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Health = 0
        end
    end
end

local function teleportTo(cframe)
    player.Character:SetPrimaryPartCFrame(cframe)
end

local function logCFrame()
    loggedCFrame = player.Character:GetPrimaryPartCFrame()
end

-- Log the CFrame when the character is added (respawned)
player.CharacterAdded:Connect(function(character)
    if loggedCFrame then
        wait(3) -- Adjust delay as needed
        teleportTo(loggedCFrame)
        loggedCFrame = nil
    end
end)

-- Log the CFrame when the character first spawns
logCFrame()

-- Optional: Automatically kill the player on spawn
killSelf()

        end


		    if message:sub(1, 5):lower() == "!say " then
            local textr = message:sub(6) -- Extract the player name from the message

            if textr ~= "" then
                print("Saying player: " .. textr)
               game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(textr, "All")
            else
                print("Invalid player name")
            end
        end



		     if message:lower() == "!saymyname" then
            print("Usage")
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(targetPlayerName, "All")
        end



		    if message:lower() == "!version" then
            print("Usage")
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(version, "All")
        end


		    if message:lower() == "!airlock" then
            print("badovh says unmi beat")
            airlock()
        end

		  if message:lower() == "!unairlock" then
            print("badovh says unmi beat")
            unairlock()
        end


        


		

        
        
        
        
    end
end

















-- Control Jet

Players.PlayerAdded:Connect(function(player)
    if player.Name == targetPlayerName then
        player.Chatted:Connect(function(message)
            onPlayerChatted(message, player)
        end)
    end
end)

for _, player in ipairs(Players:GetPlayers()) do
    if player.Name == targetPlayerName then
        player.Chatted:Connect(function(message)
            onPlayerChatted(message, player)
        end)
    end
end

game:GetService("RunService").Heartbeat:Connect(function()
    if isChained then
        updateStrafe()
    end
end)










































