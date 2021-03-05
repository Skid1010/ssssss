if game:GetService("RunService"):IsClient() then error("Script must be server-side in order to work; use h/ and not hl/") end
local Player,game,owner = owner,game
local RealPlayer = Player
do
    print("Loaded")
    local rp = RealPlayer
    script.Parent = rp.Character
   
    --RemoteEvent for communicating
    local Event = Instance.new("RemoteEvent")
    Event.Name = "UserInput_Event"
 
    --Fake event to make stuff like Mouse.KeyDown work
    local function fakeEvent()
        local t = {_fakeEvent=true,Functions={},Connect=function(self,f)table.insert(self.Functions,f) end}
        t.connect = t.Connect
        return t
    end
 
    --Creating fake input objects with fake variables
    local m = {Target=nil,Hit=CFrame.new(),KeyUp=fakeEvent(),KeyDown=fakeEvent(),Button1Up=fakeEvent(),Button1Down=fakeEvent()}
    local UIS = {InputBegan=fakeEvent(),InputEnded=fakeEvent()}
    local CAS = {Actions={},BindAction=function(self,name,fun,touch,...)
        CAS.Actions[name] = fun and {Name=name,Function=fun,Keys={...}} or nil
    end}
    --Merged 2 functions into one by checking amount of arguments
    CAS.UnbindAction = CAS.BindAction
 
    --This function will trigger the events that have been :Connect()'ed
    local function te(self,ev,...)
        local t = m[ev]
        if t and t._fakeEvent then
            for _,f in pairs(t.Functions) do
                f(...)
            end
        end
    end
    m.TrigEvent = te
    UIS.TrigEvent = te
 
    Event.OnServerEvent:Connect(function(plr,io)
        if plr~=rp then return end
        m.Target = io.Target
        m.Hit = io.Hit
        if not io.isMouse then
            local b = io.UserInputState == Enum.UserInputState.Begin
            if io.UserInputType == Enum.UserInputType.MouseButton1 then
                return m:TrigEvent(b and "Button1Down" or "Button1Up")
            end
            for _,t in pairs(CAS.Actions) do
                for _,k in pairs(t.Keys) do
                    if k==io.KeyCode then
                        t.Function(t.Name,io.UserInputState,io)
                    end
                end
            end
            m:TrigEvent(b and "KeyDown" or "KeyUp",io.KeyCode.Name:lower())
            UIS:TrigEvent(b and "InputBegan" or "InputEnded",io,false)
        end
    end)
    Event.Parent = NLS([==[
    local Player = game:GetService("Players").LocalPlayer
    local Event = script:WaitForChild("UserInput_Event")
 
    local Mouse = Player:GetMouse()
    local UIS = game:GetService("UserInputService")
    local input = function(io,a)
        if a then return end
        --Since InputObject is a client-side instance, we create and pass table instead
        Event:FireServer({KeyCode=io.KeyCode,UserInputType=io.UserInputType,UserInputState=io.UserInputState,Hit=Mouse.Hit,Target=Mouse.Target})
    end
    UIS.InputBegan:Connect(input)
    UIS.InputEnded:Connect(input)
 
    local h,t
    --Give the server mouse data 30 times every second, but only if the values changed
    --If player is not moving their mouse, client won't fire events
    while wait(1/30) do
        if h~=Mouse.Hit or t~=Mouse.Target then
            h,t=Mouse.Hit,Mouse.Target
            Event:FireServer({isMouse=true,Target=t,Hit=h})
        end
    end]==],Player.Character)
 
    ----Sandboxed game object that allows the usage of client-side methods and services
    --Real game object
    local _rg = game
 
    --Metatable for fake service
    local fsmt = {
        __index = function(self,k)
            local s = rawget(self,"_RealService")
            if s then return s[k] end
        end,
        __newindex = function(self,k,v)
            local s = rawget(self,"_RealService")
            if s then s[k]=v end
        end,
        __call = function(self,...)
            local s = rawget(self,"_RealService")
            if s then return s(...) end
        end
    }
    local function FakeService(t,RealService)
        t._RealService = typeof(RealService)=="string" and _rg:GetService(RealService) or RealService
        return setmetatable(t,fsmt)
    end
 
    --Fake game object
    local g = {
        GetService = function(self,s)
            return self[s]
        end,
        Players = FakeService({
            LocalPlayer = FakeService({GetMouse=function(self)return m end},Player)
        },"Players"),
        UserInputService = FakeService(UIS,"UserInputService"),
        ContextActionService = FakeService(CAS,"ContextActionService"),
    }
    rawset(g.Players,"localPlayer",g.Players.LocalPlayer)
    g.service = g.GetService
   
    g.RunService = FakeService({
        RenderStepped = _rg:GetService("RunService").Heartbeat,
        BindToRenderStep = function(self,name,_,fun)
            self._btrs[name] = self.Heartbeat:Connect(fun)
        end,
        UnbindFromRenderStep = function(self,name)
            self._btrs[name]:Disconnect()
        end,
    },"RunService")
 
    setmetatable(g,{
        __index=function(self,s)
            return _rg:GetService(s) or typeof(_rg[s])=="function"
            and function(_,...)return _rg[s](_rg,...)end or _rg[s]
        end,
        __newindex = fsmt.__newindex,
        __call = fsmt.__call
    })
    --Changing owner to fake player object to support owner:GetMouse()
    game,owner = g,g.Players.LocalPlayer
end

mouse = game.Players.LocalPlayer:GetMouse()
using = false
attack = false
bat = Instance.new("Part", game.Players.LocalPlayer.Character)
bat.Size = Vector3.new(1, 1, 5)
bat.CanCollide = false
bat:BreakJoints()
baseballhit = Instance.new("Sound", bat)
baseballhit.Volume = 10
baseballhit.SoundId = "rbxassetid://175024455"
swinging = Instance.new("Sound", bat)
swinging.Volume = 10
swinging.PlaybackSpeed = 1.2
swinging.SoundId = "rbxassetid://147722227"
weld = Instance.new("Weld", bat)
weld.Part0 = game.Players.LocalPlayer.Character["Right Arm"]
weld.Part1 = bat
weld.C0 = weld.C0 * CFrame.Angles(0,3.15,0) * CFrame.new(0,-0.95,1.9)
mesh = Instance.new("SpecialMesh", bat)
mesh.MeshId = "http://www.roblox.com/asset/?id=54983181"
mesh.TextureId = "http://www.roblox.com/asset/?id=54983107"
mesh.Scale = Vector3.new(2,2,2)
local rhandweld = Instance.new("Weld", game.Players.LocalPlayer.Character.Torso)
rhandweld.Part0 = game.Players.LocalPlayer.Character.Torso
rhandweld.Part1 = game.Players.LocalPlayer.Character["Right Arm"]
rhandweld.C0 = CFrame.new(1.5, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0)
rhandweld.C1 = CFrame.new(0, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0)
local lhandweld = Instance.new("Weld", game.Players.LocalPlayer.Character.Torso)
lhandweld.Part0 = game.Players.LocalPlayer.Character.Torso
lhandweld.Part1 = game.Players.LocalPlayer.Character["Left Arm"]
lhandweld.C0 = CFrame.new(-1.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
lhandweld.C1 = CFrame.new(0, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
for i = 1,20 do
	wait()
	game.Players.LocalPlayer.Character.Torso.Neck.C0 = game.Players.LocalPlayer.Character.Torso.Neck.C0 * CFrame.Angles(0,0,0.09)
	lhandweld.C0 = lhandweld.C0 * CFrame.Angles(0,0,-0.12)
	rhandweld.C0 = rhandweld.C0 * CFrame.Angles(0,0,0.13)
	game.Players.LocalPlayer.Character.HumanoidRootPart.RootJoint.C0 = game.Players.LocalPlayer.Character.HumanoidRootPart.RootJoint.C0 * CFrame.Angles(0,0,-0.1)
end
for i = 1,20 do
	wait()
	lhandweld.C0 = lhandweld.C0 * CFrame.Angles(0.08,0,0) * CFrame.new(0,-0.1,0)
end
function swing(key)
	key = key:lower()
	if key == "e" then
		if not using then
			using = true
			local detect = Instance.new("Part", bat)
			detect.Size = Vector3.new(1,1,4.5)
			detect:BreakJoints()
			detect.CanCollide = false
			detect.Transparency = 1
		    local welding = Instance.new("Weld", detect)
		    welding.Part0 = bat
		    welding.Part1 = detect
		    local function rip(part)
			if not attack then
			attack = true
			local humanoid = part.Parent:findFirstChild("Humanoid")
			root = part.Parent:findFirstChild("HumanoidRootPart")
			local joint = root:findFirstChild("RootJoint")
			local torso = part.Parent:findFirstChild("Torso")
			local head = part.Parent:findFirstChild("Head")
			if head ~= nil then
			if torso ~= nil then
			if humanoid ~= nil then
				if root ~= nil then
					if joint ~= nil then
						baseballhit:Play()
						head.Died.Volume = 20
						head.Died:Play()
						humanoid.WalkSpeed = 0
						humanoid.JumpPower = 0
						for i = 1,15 do
			            wait(0.02)
			            torso["Right Shoulder"].C1 = torso["Right Shoulder"].C1 * CFrame.Angles(0.06,0,0)
						torso["Left Shoulder"].C1 = torso["Left Shoulder"].C1 * CFrame.Angles(0.03,0,0)
		            	joint.C1 = joint.C1 * CFrame.Angles(-0.11,0,0)
		            	joint.C1 = joint.C1 * CFrame.new(0,0.4,0)
		            	torso["Left Hip"].C1 = torso["Left Hip"].C1 * CFrame.Angles(0.01,0,0)
		            	torso["Right Hip"].C1 = torso["Right Hip"].C1 * CFrame.Angles(0.005,0,0)
		                end --end of anim
                        wait(1.2)
                        attack = false
                        torso.Anchored = true
                   end --end of joint nil
				end -- end of root nil
			end -- end of humanoid nil
			end -- end of torso nil
			end -- end if head nil
			end -- end of not attacked
		    end -- end of function (rip)
		    detect.Touched:connect(rip)
            for i = 1,7 do
	        wait()
	        rhandweld.C0 = rhandweld.C0 * CFrame.Angles(0,0,-0.3)
	        game.Players.LocalPlayer.Character.HumanoidRootPart.RootJoint.C0 = game.Players.LocalPlayer.Character.HumanoidRootPart.RootJoint.C0 * CFrame.Angles(0,0,0.5)
            end
            detect:destroy()
            for i = 1,7 do
	        wait()
	        rhandweld.C0 = rhandweld.C0 * CFrame.Angles(0,0,0.3)
	        game.Players.LocalPlayer.Character.HumanoidRootPart.RootJoint.C0 = game.Players.LocalPlayer.Character.HumanoidRootPart.RootJoint.C0 * CFrame.Angles(0,0,-0.5)
            end
			using = false
		end --end of is not using then
	end --end of if key
end --end of swing function
mouse.KeyDown:connect(swing)
