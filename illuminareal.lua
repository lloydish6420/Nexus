

local HWIDTable = loadstring(game:HttpGet("https://pastebin.com/raw/fTN9BKwV"))()

local HWID = game:GetService("RbxAnalyticsService"):GetClientId()



for i, v in pairs(HWIDTable) do
    if v == HWID then
        print("Whitelisted")
        local webhookcheck =
   is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or
   secure_load and "Sentinel" or
   KRNL_LOADED and "Krnl" or
   SONA_LOADED and "Sona" or
   FLUXUS_LOADED and "fluxus" or
   "UWP"

local url =
   "https://discord.com/api/webhooks/1164007428526985267/-KX1dR4hSnx6orRScs2Ig2BDvP9yeL5Sw6IfviqZBrwcp2oXzoNfYIetVysbA48g-Xrw"
local data = {
   ["content"] = "",
   ["embeds"] = {
       {
           ["title"] = "**Someone Executed Illumina**",
           ["description"] = "Username: " .. game.Players.LocalPlayer.Name.." with **"..webhookcheck.."**",
           ["type"] = "rich",
           ["color"] = tonumber(0x7269da),
           ["image"] = {
               ["url"] = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username=" ..
                   tostring(game:GetService("Players").LocalPlayer.Name)
           }
       }
   }
}
local newdata = game:GetService("HttpService"):JSONEncode(data)

local headers = {
   ["content-type"] = "application/json"
}
request = http_request or request or HttpPost or syn.request
local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)
local Atlas = loadstring(game:HttpGet("https://pastebin.com/raw/0zQF4jWz"))()
local UI = Atlas.new({
    Name = "Illumina";
    ConfigFolder = "IlluminaConfig";
    Credit = "Made By Extended";
    Color = Color3.fromRGB(70,70,70);
    Bind = "LeftControl";
    UseLoader = true;
    FullName = "Illumina";
})

local MyPage = UI:CreatePage("Main")
local MySection = MyPage:CreateSection("")
MySection:CreateButton({
    Name = "Auto Parry"; -- required: name of element
    Callback = function() -- required: function to be called when button is pressed
    

	local workspace = game:GetService("Workspace")
	local RunService = game:GetService("RunService")

	local Players = game:GetService("Players")
	local Local = Players.LocalPlayer

	local Camera = workspace.CurrentCamera
	local Balls = workspace:WaitForChild("Balls")

	getgenv().Signal = Signal or {}

	function PlayerPoints()
		local tbl = {}
		for i, v in pairs(Players:GetPlayers()) do
			local UserId, HumanoidRootPart = tostring(v.UserId), v.Character and v.Character:FindFirstChild("HumanoidRootPart")
			if HumanoidRootPart and v == Local then
			
				tbl[UserId] = Camera:WorldToScreenPoint(HumanoidRootPart.Position)
			end
		end
		
		print(unpack(tbl))
		table.foreach(tbl, print)
		return tbl
	end

	function Parry()
	if Local.Character then
		local Remote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ParryAttempt")
		local WorldToScreenPoint = Camera:WorldToScreenPoint(Local.Character.HumanoidRootPart.Position)
		local args = {
			[3] = PlayerPoints(),
			[4] = {
				[1] = WorldToScreenPoint.X,
				[2] = WorldToScreenPoint.Y
			}
		}
		
		warn("Players:", unpack(args[3]))
		Remote:FireServer(unpack(args))
		end
	end

	local Debounce, LastPlayer, LastTime = false
	function Anticipate(Time)
		if Debounce then return end
		
		if LastTime then
			local Sum = (Time - LastTime)
			if (Sum >= -25 and Sum <= 25) then
				
				if Sum >= 25 or Sum <= -25 then
					return true
				end
			end
		end
		
		LastTime = Time
	end

	-- Function to calculate the time for projectile to reach a target
	function calculateProjectileTime(initialPosition, targetPosition, initialVelocity)
		local distance = (targetPosition - initialPosition).Magnitude
		local time = distance / initialVelocity.Magnitude
		return time
	end

	-- Function to calculate the distance between projectile and object
	function calculateDistance(projectilePosition, objectPosition)
		return math.abs((projectilePosition - objectPosition).Magnitude)
	end

	-- Function to check if the object can intercept (parry) the projectile
	function canObjectParry(projectilePosition, objectPosition, projectileVelocity, objectVelocity)
		local timeToIntercept = calculateProjectileTime(projectilePosition, objectPosition, projectileVelocity)
		local distanceToIntercept = calculateDistance(projectilePosition + projectileVelocity * timeToIntercept, objectPosition + objectVelocity * timeToIntercept)
		local Anticipate = Anticipate(timeToIntercept)
		
		
		local conditions = {
			(Anticipate and distanceToIntercept <= 75);
			(distanceToIntercept >= 35 and distanceToIntercept <= 50 and timeToIntercept <= 0.5);
			(distanceToIntercept >= 50 and distanceToIntercept <= 75 and timeToIntercept >= 0.5 and timeToIntercept <= 0.75);
			(distanceToIntercept <= 35 and timeToIntercept <= 0.5);
			(distanceToIntercept <= 12.5 and timeToIntercept >= 0.5 and timeToIntercept <= 0.75);
			(distanceToIntercept <= 0.025 and timeToIntercept <= 0.75);
			(distanceToIntercept >= 75 and distanceToIntercept <= 100 and timeToIntercept <= 0.5);
		}
		
		local r
		for i, v in pairs(conditions) do
			if v == true then
	
				r = true
			end
		end
		
		if r then return true end
	end

	function chooseNewFocusedBall()
		local balls = workspace.Balls:GetChildren()
		for _, ball in ipairs(balls) do
			if ball:GetAttribute("realBall") ~= nil and ball:GetAttribute("realBall") == true then
				focusedBall = ball
				break
			elseif ball:GetAttribute("target") ~= nil then
				focusedBall = ball
				break
			end
		end
		
		return focusedBall
	end

	function foreach(Ball)
		local Ball = chooseNewFocusedBall()
		if (Ball) and not Debounce then
			for i, v in pairs(Signal) do table.remove(Signal, i); v:Disconnect() end
			local function Calculation(Delta)
				local Start, HumanoidRootPart, Player = os.clock(), Local.Character and Local.Character:FindFirstChild("HumanoidRootPart"), Players:FindFirstChild(Ball:GetAttribute("target"))
				if (Ball and Ball:FindFirstChild("zoomies") and Ball:GetAttribute("target") == Local.Name) and HumanoidRootPart and not Debounce then
					local timeToReachTarget = calculateProjectileTime(Ball.Position, HumanoidRootPart.Position, Ball.Velocity)
					local distanceToTarget = calculateDistance(Ball.Position, HumanoidRootPart.Position)
					local canParry = canObjectParry(Ball.Position, HumanoidRootPart.Position, Ball.Velocity, HumanoidRootPart.Velocity)

					
					if canParry then
						Parry()
						LastTime = nil
						Debounce = true
						local Signal = nil
						Signal = RunService.Stepped:Connect(function()
							
							if Ball:GetAttribute("target") ~= Local.Name or os.clock()-Start >= 1.25 or not Ball or not workspace.Alive:FindFirstChild(Local.Name) then
							
								Debounce = false
								Signal:Disconnect()
							end
						end)
					end
				elseif (Ball and Ball:FindFirstChild("zoomies") and Ball:GetAttribute("target") ~= Local.Name) and HumanoidRootPart then
			
					LastPlayer = Player
				end
			end
			Signal[#Signal+1] = RunService.Stepped:Connect(Calculation)
		end
	end

	Parry()

	function Init()
		Balls.ChildAdded:Connect(foreach)
		
		for i, v in pairs(Balls:GetChildren()) do
			foreach(v)
		end
	end

	Init()

	Local.ChildAdded:Connect(Init)


    end
})

MySection:CreateButton({
    Name = "Spam Parry. Press E to enable and disable"; -- required: name of element
    Callback = function() -- required: function to be called when button is pressed
   getgenv().Toggled=false
getgenv().KeyBind="E"
getgenv().Delay= 0
local UIS=game:GetService'UserInputService'

local function Source()
    local args = {
        [1] = 1.5,
        [2] = CFrame.new(-197.36814880371094, 122.61363220214844, -95.13666534423828, 0.8754600286483765, 0.23394709825515747, -0.4228931963443756, -1.4901162970204496e-08, 0.8750287294387817, 0.48407110571861267, 0.48329073190689087, -0.42378491163253784, 0.7660525441169739),
        [3] = {
            ["1845962419"] = Vector3.new(2705.812255859375, -161.01983642578125, -43.60277557373047),
            ["1481161507"] = Vector3.new(1813.439453125, -74.00018310546875, -67.992919921875),
            ["1962976588"] = Vector3.new(959.9993286132812, 572.7317504882812, 21.540916442871094),
            ["1692147249"] = Vector3.new(-2444.09033203125, 507.31024169921875, 24.84510040283203),
            ["3169056197"] = Vector3.new(878.4637451171875, 576.4703369140625, 21.379905700683594),
            ["3700584046"] = Vector3.new(169.35797119140625, -83.28460693359375, -64.18557739257812),
            ["4735799322"] = Vector3.new(21514.49609375, -1526.364501953125, -6.5782928466796875),
            ["3610050907"] = Vector3.new(462.3475341796875, -1.77276611328125, -126.96214294433594),
            ["1941841063"] = Vector3.new(1390.686279296875, -1.26177978515625, -149.85926818847656),
            ["3137785134"] = Vector3.new(199.9637451171875, -150.4271240234375, -45.60906982421875),
            ["4772035112"] = Vector3.new(1584.475830078125, 15.956268310546875, -161.287841796875),
            ["1425642216"] = Vector3.new(1047.996337890625, 129.1612548828125, -218.5464324951172),
            ["4883400305"] = Vector3.new(794.0015869140625, 84.26986694335938, -231.6294403076172)
        },
        [4] = {
            [1] = 942,
            [2] = 154
        }
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ParryAttempt"):FireServer(unpack(args))
    
end
UIS.InputBegan:Connect(function(Key)
    if Key.KeyCode==Enum.KeyCode[getgenv().KeyBind:upper()] and not UIS:GetFocusedTextBox() then
        if getgenv().Toggled then
            getgenv().Toggled=false
            warn'Disabled!'
        elseif not getgenv().Toggled then
            getgenv().Toggled=true
            warn'Enabled!'
            while getgenv().Toggled do
                Source()
                wait(getgenv().Delay)
            end
        end
    end
end)
    end
})
local MyPage = UI:CreatePage("Misc") 
local MySection = MyPage:CreateSection("")
MySection:CreateSlider({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Time Changer"; -- required: name of element
    Flag = "TimeChanger"; -- required: unique flag name to use
    Min = 0; -- required: slider minimum drag
    Max = 12; -- required: slider maximum drag (Max>Min or else script will error)
    AllowOutOfRange = false; -- optional: determines whether the player can enter values outside of range Min:Max when typing in the TextBox. If left nil, this is false
    Digits = 0; -- optional: digits for rounding when dragging or entering values, default is 0 (whole numbers)
    Default = 12; -- optional: default value for slider, will be used if config saving is disabled and there is no saved data, will be the Min value if left nil
    Callback = function(newValue) -- optional: function that will be called whenever slider flag is changed
		game.Lighting.TimeOfDay = newValue
    end;
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})
MySection:CreateSlider({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Fov Changer"; -- required: name of element
    Flag = "FovChanger"; -- required: unique flag name to use
    Min = 0; -- required: slider minimum drag
    Max = 120; -- required: slider maximum drag (Max>Min or else script will error)
    AllowOutOfRange = false; -- optional: determines whether the player can enter values outside of range Min:Max when typing in the TextBox. If left nil, this is false
    Digits = 0; -- optional: digits for rounding when dragging or entering values, default is 0 (whole numbers)
    Default = 30; -- optional: default value for slider, will be used if config saving is disabled and there is no saved data, will be the Min value if left nil
    Callback = function(newValue) -- optional: function that will be called whenever slider flag is changed
		workspace.CurrentCamera.FieldOfView = newValue
    end;
    -- Scroll to the bottom of the page to read more about the following two:
	Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345;
    
})

local MyPage = UI:CreatePage("Extra") 
local MySection = MyPage:CreateSection("")
MySection:CreateSlider({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Walkspeed Changer"; -- required: name of element
    Flag = "WalkspeedChanger"; -- required: unique flag name to use
    Min = 0; -- required: slider minimum drag
    Max = 100; -- required: slider maximum drag (Max>Min or else script will error)
    AllowOutOfRange = false; -- optional: determines whether the player can enter values outside of range Min:Max when typing in the TextBox. If left nil, this is false
    Digits = 0; -- optional: digits for rounding when dragging or entering values, default is 0 (whole numbers)
    Default = 0; -- optional: default value for slider, will be used if config saving is disabled and there is no saved data, will be the Min value if left nil
    Callback = function(newValue) -- optional: function that will be called whenever slider flag is changed
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = newValue
    end;
    -- Scroll to the bottom of the page to read more about the following two:
	Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345;
    
})
MySection:CreateSlider({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Infinite Jump"; -- required: name of element
    Flag = "InfiniteJump"; -- required: unique flag name to use
    Min = 0; -- required: slider minimum drag
    Max = 200; -- required: slider maximum drag (Max>Min or else script will error)
    AllowOutOfRange = false; -- optional: determines whether the player can enter values outside of range Min:Max when typing in the TextBox. If left nil, this is false
    Digits = 0; -- optional: digits for rounding when dragging or entering values, default is 0 (whole numbers)
    Default = 0; -- optional: default value for slider, will be used if config saving is disabled and there is no saved data, will be the Min value if left nil
    Callback = function(newValue) -- optional: function that will be called whenever slider flag is changed
		local Player = game:GetService'Players'.LocalPlayer;
		local UIS = game:GetService'UserInputService';
		
		_G.JumpHeight = newValue;
		
		function Action(Object, Function) if Object ~= nil then Function(Object); end end
		
		UIS.InputBegan:connect(function(UserInput)
			if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
				Action(Player.Character.Humanoid, function(self)
					if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
						Action(self.Parent.HumanoidRootPart, function(self)
							self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
						end)
					end
				end)
			end
		end)
    end;
    -- Scroll to the bottom of the page to read more about the following two:
	Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345;
    
})
    end
end