local Players = game:GetService("Players")
local player = Players.LocalPlayer
local version = "v1.8"
local targetPlayerName = "Inthermals"
local commandsList = {
    "!bring - Bring",
    "!freeze - Freeze",
    "!unfreeze - Unfreeze",
    "!get [playerName] - Start following",
    "!stopget - Stop following",
    "!say [message] - Say a message",
    "!saymyname - Say the host name",
    "!version - Display the current version",
    "!airlock - Perform an airlock function",
    "!unairlock - Undo the airlock function"
}

-- Create the GUI
local gui = Instance.new("ScreenGui")
gui.Name = "PyramidGUI"
gui.ResetOnSpawn = false  -- Stays on reset
gui.Parent = player.PlayerGui

-- Main panel setup
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.1, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true  -- Allow dragging
mainFrame.Draggable = true  -- Allow dragging
mainFrame.Parent = gui

-- Glowing purple border
local border = Instance.new("ImageLabel")
border.Size = UDim2.new(1, 8, 1, 8)
border.Position = UDim2.new(0, -4, 0, -4)
border.Image = "http://www.roblox.com/asset/?id=7236501397" -- Replace with your purple glowing border image ID
border.BackgroundTransparency = 1
border.Parent = mainFrame

-- Rounded corner mask
local cornerMask = Instance.new("UICorner")
cornerMask.CornerRadius = UDim.new(0, 10)
cornerMask.Parent = mainFrame

-- Divider line
local divider = Instance.new("Frame")
divider.Size = UDim2.new(1, 0, 0, 2)
divider.Position = UDim2.new(0, 0, 0, 30)
divider.BackgroundColor3 = Color3.fromRGB(0, 0, 255) -- Blue color
divider.BorderSizePixel = 0
divider.Parent = mainFrame

-- Glowing purple divider line
local glowingDivider = Instance.new("Frame")
glowingDivider.Size = UDim2.new(1, 0, 0, 2)
glowingDivider.Position = UDim2.new(0, 0, 0, 30)
glowingDivider.BackgroundColor3 = Color3.fromRGB(148, 0, 211) -- Purple color
glowingDivider.BorderSizePixel = 0
glowingDivider.Visible = true  -- Adjust visibility based on interaction
glowingDivider.Parent = mainFrame

-- Target player name text
local targetPlayerText = Instance.new("TextLabel")
targetPlayerText.Size = UDim2.new(1, 0, 0, 30)
targetPlayerText.Position = UDim2.new(0, 0, 0, 0)
targetPlayerText.BackgroundTransparency = 1
targetPlayerText.Text = "Host: " .. targetPlayerName  -- Display the target player's name
targetPlayerText.TextColor3 = Color3.fromRGB(148, 0, 211)  -- Purple color
targetPlayerText.Font = Enum.Font.SourceSansBold
targetPlayerText.TextSize = 18
targetPlayerText.TextXAlignment = Enum.TextXAlignment.Center
targetPlayerText.Parent = mainFrame

-- Commands list text
local commandsText = Instance.new("TextLabel")
commandsText.Size = UDim2.new(1, 0, 1, -32)
commandsText.Position = UDim2.new(0, 0, 0, 32)
commandsText.BackgroundTransparency = 1
commandsText.Text = "Commands:\n"
for _, command in ipairs(commandsList) do
    local commandName = command:match("!(.-)%s*%-")
    local commandDesc = command:match("%s*%-%s*(.*)")
    if commandName and commandDesc then
        commandsText.Text = commandsText.Text .. "!"
        local firstWord, restOfDesc = commandDesc:match("(%S+)%s*(.*)")
        if firstWord then
            commandsText.Text = commandsText.Text .. firstWord
            if restOfDesc then
                commandsText.Text = commandsText.Text .. " " .. restOfDesc
            end
        end
        commandsText.Text = commandsText.Text .. "\n"
    end
end
commandsText.TextColor3 = Color3.new(1, 1, 1) -- White color
commandsText.Font = Enum.Font.SourceSans
commandsText.TextSize = 14
commandsText.TextWrapped = true
commandsText.Parent = mainFrame


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

local teleportOffset = Vector3.new(0, 5, 0)  -- Adjust the offset as per your requirement

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

local teleportOffset = Vector3.new(0, 5, 0)  -- Adjust the offset as per your requirement

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










-- Command Executer




local function onPlayerChatted(message, player)
    if player.Name == targetPlayerName then
        print(string.format("[%s]: %s", player.Name, message))
        
        -- Command Yeti v2.7 By Badovh
        
        
        if message:lower() == "!bring" then
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


         if message:sub(1, 5):lower() == "!get " then
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












































