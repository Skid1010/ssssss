if game:GetService("RunService"):IsClient() then error("Script must be server-side in order to work; use h/ and not hl/") end
local Player,game,owner = owner,game
local RealPlayer = Player
do
    print("Loading..")
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

Player = game:GetService("Players").LocalPlayer
PlayerGui = Player.PlayerGui
Cam = workspace.CurrentCamera
Backpack = Player.Backpack
Character = Player.Character
Humanoid = Character.Humanoid
Mouse = Player:GetMouse()
RootPart = Character["HumanoidRootPart"]
Torso = Character["Torso"]
Head = Character["Head"]
RightArm = Character["Right Arm"]
LeftArm = Character["Left Arm"]
RightLeg = Character["Right Leg"]
LeftLeg = Character["Left Leg"]
RootJoint = RootPart["RootJoint"]
Neck = Torso["Neck"]
RightShoulder = Torso["Right Shoulder"]
LeftShoulder = Torso["Left Shoulder"]
RightHip = Torso["Right Hip"]
LeftHip = Torso["Left Hip"]

IT = Instance.new
CF = CFrame.new
VT = Vector3.new
RAD = math.rad
C3 = Color3.new
UD2 = UDim2.new
BRICKC = BrickColor.new
ANGLES = CFrame.Angles
EULER = CFrame.fromEulerAnglesXYZ
COS = math.cos
ACOS = math.acos
SIN = math.sin
ASIN = math.asin
ABS = math.abs
MRANDOM = math.random
FLOOR = math.floor

function CreateMesh(MESH, PARENT, MESHTYPE, MESHID, TEXTUREID, SCALE, OFFSET)
	local NEWMESH = IT(MESH)
	if MESH == "SpecialMesh" then
		NEWMESH.MeshType = MESHTYPE
		if MESHID ~= "nil" and MESHID ~= "" then
			NEWMESH.MeshId = "http://www.roblox.com/asset/?id="..MESHID
		end
		if TEXTUREID ~= "nil" and TEXTUREID ~= "" then
			NEWMESH.TextureId = "http://www.roblox.com/asset/?id="..TEXTUREID
		end
	end
	NEWMESH.Offset = OFFSET or VT(0, 0, 0)
	NEWMESH.Scale = SCALE
	NEWMESH.Parent = PARENT
	return NEWMESH
end

function CreatePart(FORMFACTOR, PARENT, MATERIAL, REFLECTANCE, TRANSPARENCY, BRICKCOLOR, NAME, SIZE)
	local NEWPART = IT("Part")
	NEWPART.formFactor = FORMFACTOR
	NEWPART.Reflectance = REFLECTANCE
	NEWPART.Transparency = TRANSPARENCY
	NEWPART.CanCollide = false
	NEWPART.Locked = true
	NEWPART.Anchored = true
	NEWPART.BrickColor = BRICKC(tostring(BRICKCOLOR))
	NEWPART.Name = NAME
	NEWPART.Size = SIZE
	NEWPART.Position = Torso.Position
	NEWPART.Material = MATERIAL
	NEWPART:BreakJoints()
	NEWPART.Parent = PARENT
	return NEWPART
end


--//=================================\\
--||		  CUSTOMIZATION
--\\=================================//

Class_Name = "Gravity orb friend"
Weapon_Name = "Add-ons"

Custom_Colors = {
	Custom_Color_1 = BRICKC("Institutional white"); --1st color for the weapon.
	Custom_Color_2 = BRICKC("Institutional white"); --2nd color for the weapon.

	Custom_Color_3 = BRICKC("Institutional white"); --Color for the abilities.
	Custom_Color_4 = BRICKC("Institutional white"); --Color for the secondary bar.
	Custom_Color_5 = BRICKC("Institutional white"); --Color for the mana bar.
	Custom_Color_6 = BRICKC("Institutional white"); --Color for the health bar.
	Custom_Color_7 = BRICKC("Institutional white"); --Color for the stun bar.

	Custom_Color_8 = BRICKC("Institutional white"); --Background for the mana bar.
	Custom_Color_9 = BRICKC("Institutional white"); --Background for the secondary mana bar.
	Custom_Color_10 = BRICKC("Institutional white"); --Background for the stun bar.
	Custom_Color_11 = BRICKC("Institutional white"); --Background for the health bar.
	Custom_Color_12 = BRICKC("Institutional white"); --Background for the abilities.
}


Player_Size = 1 --Size of the player.
Animation_Speed = 3
Frame_Speed = 1 / 60 -- (1 / 30) OR (1 / 60)

local Speed = 16
local Effects2 = {}

--//=================================\\
--|| 	  END OF CUSTOMIZATION
--\\=================================//

local function weldBetween(a, b)
	local weldd = Instance.new("ManualWeld")
	weldd.Part0 = a
	weldd.Part1 = b
	weldd.C0 = CFrame.new()
	weldd.C1 = b.CFrame:inverse() * a.CFrame
	weldd.Parent = a
	return weldd
end

--//=================================\\
--|| 	      USEFUL VALUES
--\\=================================//

local ROOTC0 = CF(0, 0, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local NECKC0 = CF(0, 1, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local RIGHTSHOULDERC0 = CF(-0.5, 0, 0) * ANGLES(RAD(0), RAD(90), RAD(0))
local LEFTSHOULDERC0 = CF(0.5, 0, 0) * ANGLES(RAD(0), RAD(-90), RAD(0))
local CO1 = 0
local CO2 = 0
local CO3 = 0
local CO4 = 0
local CHANGEDEFENSE = 0
local CHANGEDAMAGE = 0
local CHANGEMOVEMENT = 0
local ANIM = "Idle"
local ATTACK = false
local EQUIPPED = false
local HOLD = false
local COMBO = 1
local LASTPOINT = nil
local BLCF = nil
local SCFR = nil
local STAGGERHITANIM = false
local STAGGERANIM = false
local STUNANIM = false
local CRITCHANCENUMBER = 0
local IDLENUMBER = 0
local DONUMBER = 0
local HANDIDLE = false
local PLAYINGMUSIC = false
local SINE = 0
local CHANGE = 2 / Animation_Speed
local WALKINGANIM = false
local WALK = 0
local DISABLEJUMPING = false
local HASBEENBLOCKED = false
local STUNDELAYNUMBER = 0
local MANADELAYNUMBER = 0
local SOUND = nil
local SECONDARYMANADELAYNUMBER = 0
local ROBLOXIDLEANIMATION = IT("Animation")
ROBLOXIDLEANIMATION.Name = "Roblox Idle Animation"
ROBLOXIDLEANIMATION.AnimationId = "http://www.roblox.com/asset/?id=180435571"
--ROBLOXIDLEANIMATION.Parent = Humanoid
local WEAPONGUI = IT("ScreenGui", nil)
WEAPONGUI.Name = "Weapon GUI"
local WEAPONTOOL = IT("HopperBin", nil)
WEAPONTOOL.Name = Weapon_Name
local Weapon = IT("Model")
Weapon.Name = Weapon_Name
local Effects = IT("Folder", Weapon)
Effects.Name = "Effects"
local ANIMATOR = Humanoid.Animator
local ANIMATE = Character.Animate
local HITPLAYERSOUNDS = {--[["199149137", "199149186", "199149221", "199149235", "199149269", "199149297"--]]"263032172", "263032182", "263032200", "263032221", "263032252", "263033191"}
local HITARMORSOUNDS = {"199149321", "199149338", "199149367", "199149409", "199149452"}
local HITWEAPONSOUNDS = {"199148971", "199149025", "199149072", "199149109", "199149119"}
local HITBLOCKSOUNDS = {"199148933", "199148947"}
local PEWSOUND = {"907527750","907527912","907528019","907530553"}
local BULLETLOOPSOUND = "907530407"
local BULLETIMPACTSOUND = "907532865"
local UNANCHOR = true
local MAGICPARTICLE = "655109389"
local Rooted = false
local GRABBED = false
local X = 10
local Y = 10
local Z = 10
local CUSTOMMOVEMENT = false
local FLIGHT = false
local VACUUM = false

--//=================================\\
--\\=================================//




--//=================================\\
--|| SAZERENOS' ARTIFICIAL HEARTBEAT
--\\=================================//

ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "ArtificialHB"

script:WaitForChild("ArtificialHB")

frame = Frame_Speed
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.ArtificialHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.ArtificialHB:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				script.ArtificialHB:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)

--//=================================\\
--\\=================================//





--//=================================\\
--|| 	      SOME FUNCTIONS
--\\=================================//

function Raycast(POSITION, DIRECTION, RANGE, IGNOREDECENDANTS)
	return workspace:FindPartOnRay(Ray.new(POSITION, DIRECTION.unit * RANGE), IGNOREDECENDANTS)
end

function PositiveAngle(NUMBER)
	if NUMBER >= 0 then
		NUMBER = 0
	end
	return NUMBER
end

function NegativeAngle(NUMBER)
	if NUMBER <= 0 then
		NUMBER = 0
	end
	return NUMBER
end

function Swait(NUMBER)
	if NUMBER == 0 or NUMBER == nil then
		ArtificialHB.Event:wait()
	else
		for i = 1, NUMBER do
			ArtificialHB.Event:wait()
		end
	end
end

function QuaternionFromCFrame(cf)
	local mx, my, mz, m00, m01, m02, m10, m11, m12, m20, m21, m22 = cf:components()
	local trace = m00 + m11 + m22
	if trace > 0 then 
		local s = math.sqrt(1 + trace)
		local recip = 0.5 / s
		return (m21 - m12) * recip, (m02 - m20) * recip, (m10 - m01) * recip, s * 0.5
	else
		local i = 0
		if m11 > m00 then
			i = 1
		end
		if m22 > (i == 0 and m00 or m11) then
			i = 2
		end
		if i == 0 then
			local s = math.sqrt(m00 - m11 - m22 + 1)
			local recip = 0.5 / s
			return 0.5 * s, (m10 + m01) * recip, (m20 + m02) * recip, (m21 - m12) * recip
		elseif i == 1 then
			local s = math.sqrt(m11 - m22 - m00 + 1)
			local recip = 0.5 / s
			return (m01 + m10) * recip, 0.5 * s, (m21 + m12) * recip, (m02 - m20) * recip
		elseif i == 2 then
			local s = math.sqrt(m22 - m00 - m11 + 1)
			local recip = 0.5 / s return (m02 + m20) * recip, (m12 + m21) * recip, 0.5 * s, (m10 - m01) * recip
		end
	end
end

function QuaternionToCFrame(px, py, pz, x, y, z, w)
	local xs, ys, zs = x + x, y + y, z + z
	local wx, wy, wz = w * xs, w * ys, w * zs
	local xx = x * xs
	local xy = x * ys
	local xz = x * zs
	local yy = y * ys
	local yz = y * zs
	local zz = z * zs
	return CFrame.new(px, py, pz, 1 - (yy + zz), xy - wz, xz + wy, xy + wz, 1 - (xx + zz), yz - wx, xz - wy, yz + wx, 1 - (xx + yy))
end

function QuaternionSlerp(a, b, t)
	local cosTheta = a[1] * b[1] + a[2] * b[2] + a[3] * b[3] + a[4] * b[4]
	local startInterp, finishInterp;
	if cosTheta >= 0.0001 then
		if (1 - cosTheta) > 0.0001 then
			local theta = ACOS(cosTheta)
			local invSinTheta = 1 / SIN(theta)
			startInterp = SIN((1 - t) * theta) * invSinTheta
			finishInterp = SIN(t * theta) * invSinTheta
		else
			startInterp = 1 - t
			finishInterp = t
		end
	else
		if (1 + cosTheta) > 0.0001 then
			local theta = ACOS(-cosTheta)
			local invSinTheta = 1 / SIN(theta)
			startInterp = SIN((t - 1) * theta) * invSinTheta
			finishInterp = SIN(t * theta) * invSinTheta
		else
			startInterp = t - 1
			finishInterp = t
		end
	end
	return a[1] * startInterp + b[1] * finishInterp, a[2] * startInterp + b[2] * finishInterp, a[3] * startInterp + b[3] * finishInterp, a[4] * startInterp + b[4] * finishInterp
end

function Clerp(a, b, t)
	local qa = {QuaternionFromCFrame(a)}
	local qb = {QuaternionFromCFrame(b)}
	local ax, ay, az = a.x, a.y, a.z
	local bx, by, bz = b.x, b.y, b.z
	local _t = 1 - t
	return QuaternionToCFrame(_t * ax + t * bx, _t * ay + t * by, _t * az + t * bz, QuaternionSlerp(qa, qb, t))
end

function CreateFrame(PARENT, TRANSPARENCY, BORDERSIZEPIXEL, POSITION, SIZE, COLOR, BORDERCOLOR, NAME)
	local frame = IT("Frame")
	frame.BackgroundTransparency = TRANSPARENCY
	frame.BorderSizePixel = BORDERSIZEPIXEL
	frame.Position = POSITION
	frame.Size = SIZE
	frame.BackgroundColor3 = COLOR
	frame.BorderColor3 = BORDERCOLOR
	frame.Name = NAME
	frame.Parent = PARENT
	return frame
end

function CreateLabel(PARENT, TEXT, TEXTCOLOR, TEXTFONTSIZE, TEXTFONT, TRANSPARENCY, BORDERSIZEPIXEL, STROKETRANSPARENCY, NAME)
	local label = IT("TextLabel")
	label.BackgroundTransparency = 1
	label.Size = UD2(1, 0, 1, 0)
	label.Position = UD2(0, 0, 0, 0)
	label.TextColor3 = C3(255, 255, 255)
	label.TextStrokeTransparency = STROKETRANSPARENCY
	label.TextTransparency = TRANSPARENCY
	label.FontSize = TEXTFONTSIZE
	label.Font = TEXTFONT
	label.BorderSizePixel = BORDERSIZEPIXEL
	label.TextScaled = true
	label.Text = TEXT
	label.Name = NAME
	label.Parent = PARENT
	return label
end

function NoOutlines(PART)
	PART.TopSurface, PART.BottomSurface, PART.LeftSurface, PART.RightSurface, PART.FrontSurface, PART.BackSurface = 10, 10, 10, 10, 10, 10
end


function CreateWeldOrSnapOrMotor(TYPE, PARENT, PART0, PART1, C0, C1)
	local NEWWELD = IT(TYPE)
	NEWWELD.Part0 = PART0
	NEWWELD.Part1 = PART1
	NEWWELD.C0 = C0
	NEWWELD.C1 = C1
	NEWWELD.Parent = PARENT
	return NEWWELD
end

function CreateSound(ID, PARENT, VOLUME, PITCH, DOESLOOP)
	local NEWSOUND = nil
	coroutine.resume(coroutine.create(function()
		NEWSOUND = IT("Sound", PARENT)
		NEWSOUND.Volume = VOLUME
		NEWSOUND.Pitch = PITCH
		NEWSOUND.SoundId = "http://www.roblox.com/asset/?id="..ID
		Swait()
		NEWSOUND:play()
		if DOESLOOP == false then
			repeat Swait() until NEWSOUND.Playing == false
			NEWSOUND:remove()
		elseif DOESLOOP == true then
			NEWSOUND.Looped = true
		end
	end))
	return NEWSOUND
end

function CFrameFromTopBack(at, top, back)
	local right = top:Cross(back)
	return CF(at.x, at.y, at.z, right.x, top.x, back.x, right.y, top.y, back.y, right.z, top.z, back.z)
end

function CreateWave(inair,size,doesrotate,rotatedirection,waitt,part,offset,color)
	local wave = CreatePart(3, Effects, "Neon", 0, 0.5, BRICKC(color), "Effect", VT(0,0,0))
	local mesh = IT("SpecialMesh",wave)
	mesh.MeshType = "FileMesh"
	mesh.MeshId = "http://www.roblox.com/asset/?id=20329976"
	mesh.Scale = VT(size,size,size)
	mesh.Offset = VT(0,0,-size/8)
	wave.CFrame = CF(part.Position) * CF(0,offset,0) * ANGLES(RAD(inair),RAD(0),RAD(0))
	coroutine.resume(coroutine.create(function(PART)
		for i = 1, waitt do
			Swait()
			mesh.Scale = mesh.Scale + VT(size/5,0,size/5)
			mesh.Offset = VT(0,0,-(mesh.Scale.X/8))
			if doesrotate == true then
				wave.CFrame = wave.CFrame * CFrame.fromEulerAnglesXYZ(0, rotatedirection, 0)
			end
			wave.Transparency = wave.Transparency + (0.5/waitt)
			if wave.Transparency > 0.99 then
				wave:remove()
			end
		end
	end))
end

function CreateSwirl(inair,size,doesrotate,rotatedirection,waitt,part,offset,color)
	local wave = CreatePart(3, Effects, "Neon", 0, 0.5, BRICKC(color), "Effect", VT(0,0,0))
	local mesh = IT("SpecialMesh",wave)
	mesh.MeshType = "FileMesh"
	mesh.MeshId = "http://www.roblox.com/asset/?id=1051557"
	mesh.Scale = VT(size,size,size)
	wave.CFrame = CF(part.Position) * CF(0,offset,0) * ANGLES(RAD(inair),RAD(0),RAD(0))
	coroutine.resume(coroutine.create(function(PART)
		for i = 1, waitt do
			Swait()
			mesh.Scale = mesh.Scale + VT(size/5,0,size/5)
			if doesrotate == true then
				wave.CFrame = wave.CFrame * CFrame.fromEulerAnglesXYZ(0, rotatedirection, 0)
			end
			wave.Transparency = wave.Transparency + (0.5/waitt)
			if wave.Transparency > 0.99 then
				wave:remove()
			end
		end
	end))
end

function CreateTornado(inair,size,doesrotate,rotatedirection,waitt,part,offset,color)
	local wave = CreatePart(3, Effects, "Neon", 0, 0.5, BRICKC(color), "Effect", VT(0,0,0))
	local mesh = IT("SpecialMesh",wave)
	mesh.MeshType = "FileMesh"
	mesh.MeshId = "http://www.roblox.com/asset/?id=102638417"
	mesh.Scale = VT(size,size,size)
	wave.CFrame = CF(part.Position) * CF(0,offset,0) * ANGLES(RAD(inair),RAD(0),RAD(0))
	coroutine.resume(coroutine.create(function(PART)
		for i = 1, waitt do
			Swait()
			mesh.Scale = mesh.Scale + VT(size/5,0,size/5)
			if doesrotate == true then
				wave.CFrame = wave.CFrame * CFrame.fromEulerAnglesXYZ(0, rotatedirection, 0)
			end
			wave.Transparency = wave.Transparency + (0.5/waitt)
			if wave.Transparency > 0.99 then
				wave:remove()
			end
		end
	end))
end

function CreateRing(inair,size,doesrotate,rotatedirection,waitt,part,offset,spin1,spin2,color)
	local wave = CreatePart(3, Effects, "Neon", 0, 0.5, BRICKC(color), "Effect", VT(0,0,0))
	local mesh = IT("SpecialMesh",wave)
	mesh.MeshType = "FileMesh"
	mesh.MeshId = "http://www.roblox.com/asset/?id=3270017"
	mesh.Scale = VT(size,size,size)
	mesh.Offset = VT(0,0,0)
	wave.CFrame = CF(part.Position) * CF(0,offset,0) * ANGLES(RAD(inair),RAD(0),RAD(0))
	coroutine.resume(coroutine.create(function(PART)
		for i = 1, waitt do
			Swait()
			mesh.Scale = mesh.Scale + VT(size/5,size/5,size/5)
			if doesrotate == true then
				wave.CFrame = wave.CFrame * CFrame.fromEulerAnglesXYZ(spin2, rotatedirection, spin1)
			end
			wave.Transparency = wave.Transparency + (1/waitt)
			if wave.Transparency > 0.99 then
				wave:remove()
			end
		end
	end))
end

function MagicSphere(size,waitt,part,offset,color)
	local wave = CreatePart(3, Effects, "Neon", 0, 0, BRICKC(color), "Effect", VT(1,1,1))
	local mesh = IT("SpecialMesh",wave)
	mesh.MeshType = "Sphere"
	mesh.Scale = VT(size,size,size)
	mesh.Offset = VT(0,0,0)
	wave.CFrame = CF(part.Position) * CF(0,offset,0) * ANGLES(RAD(0),RAD(0),RAD(0))
	coroutine.resume(coroutine.create(function(PART)
		for i = 1, waitt do
			Swait()
			mesh.Scale = mesh.Scale + VT(size/5,size/5,size/5)
			wave.Transparency = wave.Transparency + (1/waitt)
			if wave.Transparency > 0.99 then
				wave:remove()
			end
		end
	end))
end

function clerp(a, b, t)
	return a:lerp(b, t)
end

function newBezier(startpos, pos2, pos3, endpos, t)
	local A = clerp(startpos, pos2, t)
	local B = clerp(pos2, pos3, t)
	local C = clerp(pos3, endpos, t)
	local lerp1 = clerp(A, B, t)
	local lerp2 = clerp(B, C, t)
	local cubic = clerp(lerp1, lerp2, t)
	return cubic
end

function MagicBlock(size,waitt,part,offset,color)
	local wave = CreatePart(3, Effects, "Neon", 0, 0, BRICKC(color), "Effect", VT(size,size,size))
	local mesh = IT("BlockMesh",wave)
	wave.CFrame = CF(part.Position) * CF(0,offset,0) * ANGLES(RAD(0),RAD(0),RAD(0))
	coroutine.resume(coroutine.create(function(PART)
		for i = 1, waitt do
			Swait()
			mesh.Scale = mesh.Scale + VT(size/5,size/5,size/5)
			wave.CFrame = CF(wave.Position) * ANGLES(RAD(math(-360,360)),RAD(math(-360,360)),RAD(math(-360,360)))
			wave.Transparency = wave.Transparency + (0.5/waitt)
			if wave.Transparency > 0.99 then
				wave:remove()
			end
		end
	end))
end

local EyeSizes={
	NumberSequenceKeypoint.new(0,1,0),
	NumberSequenceKeypoint.new(1,0.2,0)
}
local EyeTrans={
	NumberSequenceKeypoint.new(0,0.8,0),
	NumberSequenceKeypoint.new(1,1,0)
}
local PE=Instance.new("ParticleEmitter")
PE.LightEmission=0
PE.Size=NumberSequence.new(EyeSizes)
PE.Transparency=NumberSequence.new(EyeTrans)
PE.Lifetime=NumberRange.new(0.35,0.35,0.35)
PE.Rotation=NumberRange.new(0,360)
PE.Rate=15
PE.Acceleration = Vector3.new(0,75,0)
PE.Drag = 5
PE.Enabled = false
PE.RotSpeed = NumberRange.new(75)
PE.Speed = NumberRange.new(0,0,0)
PE.Texture="http://www.roblox.com/asset/?id=1179557490"
PE.ZOffset = 0
PE.Name = "Particles"

function CreateParticles(art,accel,drag,rate,type,isenabledbydefault,locked,size)
	local particle = PE:Clone()
	particle.Parent = art
	particle.Acceleration = accel
	particle.Rate = rate
	if type == "Fire" then
		local EyeSizes={
			NumberSequenceKeypoint.new(0,size,size*0.3),
			NumberSequenceKeypoint.new(1,0.2,0.2)
		}
		particle.Size = NumberSequence.new(EyeSizes)
	elseif type == "Smoke" then
		local EyeSizes={
			NumberSequenceKeypoint.new(0,size,0),
			NumberSequenceKeypoint.new(1,size*5,0.5)
		}
		particle.Size = NumberSequence.new(EyeSizes)
	elseif type == "Solid" then
		local EyeSizes={
			NumberSequenceKeypoint.new(0,size,0),
			NumberSequenceKeypoint.new(1,size,0)
		}
		particle.Size = NumberSequence.new(EyeSizes)
	end
	particle.LockedToPart = locked
	particle.Drag = drag
	particle.Texture = "http://www.roblox.com/asset/?id=43997508"
	particle.Enabled = isenabledbydefault
	return particle
end

--//=================================\\
--\\=================================//


--//=================================\\
--||	     WEAPON CREATION
--\\=================================//

if Player_Size ~= 1 then
	for _, v in pairs (Weapon:GetChildren()) do
		if v.ClassName == "Motor" or v.ClassName == "Weld" or v.ClassName == "Snap" then
			local p1 = v.Part1
			v.Part1 = nil
			local cf1, cf2, cf3, cf4, cf5, cf6, cf7, cf8, cf9, cf10, cf11, cf12 = v.C1:components()
			v.C1 = CF(cf1 * Player_Size, cf2 * Player_Size, cf3 * Player_Size, cf4, cf5, cf6, cf7, cf8, cf9, cf10, cf11, cf12)
			v.Part1 = p1
		elseif v.ClassName == "Part" then
			for _, b in pairs (v:GetChildren()) do
				if b.ClassName == "SpecialMesh" or b.ClassName == "BlockMesh" then
					b.Scale = VT(b.Scale.x * Player_Size, b.Scale.y * Player_Size, b.Scale.z * Player_Size)
				end
			end
		end
	end
end

for _, c in pairs(Weapon:GetChildren()) do
	if c.ClassName == "Part" then
		c.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
	end
end

Weapon.Parent = Character

Humanoid.Died:connect(function()
	ATTACK = true
end)

print(Class_Name.." loaded.")

local ORB = IT("Part",Weapon)
ORB.CanCollide = false
ORB.Anchored = false
ORB.CFrame = RootPart.CFrame
ORB.Shape = "Ball"
ORB.Material = "Neon"
ORB.Size = VT(0.2,0.2,0.2)
ORB.Color = C3(0.5,0,1)
local Orbmesh = IT("SpecialMesh",ORB)
Orbmesh.MeshType = "Sphere"
Orbmesh.Scale = VT(10,10,10)
local grav = Instance.new("BodyPosition",ORB)
grav.P = 20000
grav.maxForce = Vector3.new(math.huge,math.huge,math.huge)
grav.position = RootPart.CFrame*CF(3,0.7,-1).p
grav.Name = "GravityForce"
CreateParticles(ORB,VT(0,0,0),0,150,"Solid",true,true,4)

--//=================================\\
--\\=================================//

function onChatted(msg)
	if msg:sub(1,10) == "Orb, play " then
		local ID = msg:sub(11)
		if SOUND == nil then
			SOUND = CreateSound(ID, ORB, 5, 1, true)
		else
			SOUND:remove()
			SOUND = CreateSound(ID, ORB, 5, 1, true)
		end
		PLAYINGMUSIC = true
	elseif msg == "Orb, stop music" then
		if SOUND ~= nil then
			SOUND:remove()
			PLAYINGMUSIC = false
		elseif msg == "Orb, do you like me?" then
			CreateSound("269597232", ORB, 1, 1, false)
		end
	end
end
Player.Chatted:connect(onChatted)

--//=================================\\
--||			ABILITIES
--\\=================================//

function turnto(pos,part)
	part.CFrame = CF(part.Position,VT(pos.X,RootPart.Position.Y,pos.Z))
end

function Warp()
	ATTACK = true
	Rooted = true
	CUSTOMMOVEMENT = true
	grav.position = RootPart.CFrame.p
	Swait(50)
	CreateSound(PEWSOUND[MRANDOM(1, #PEWSOUND)], ORB, 2, MRANDOM(8, 9) / 10,false)
	for i = 1, 25 do
		Swait()
		X = X + 1
		Y = X
		Z = X
	end
	local weld = weldBetween(Torso,ORB)
	grav.position = VT(Mouse.Hit.p.X,Mouse.Hit.p.Y+4,Mouse.Hit.p.Z)
	Swait(50)
	CUSTOMMOVEMENT = false
	weld:remove()
	for i = 1, 25 do
		Swait()
		X = X - 1
		Y = X
		Z = X
	end
	ATTACK = false
	Rooted = false
end

function StartFlight()
	Rooted = true
	CUSTOMMOVEMENT = true
	grav.position = RootPart.Position
	Swait(50)
	grav.P = 500
	CreateSound(PEWSOUND[MRANDOM(1, #PEWSOUND)], ORB, 2, MRANDOM(8, 9) / 10,false)
	for i = 1, 10 do
		Swait()
		X = X - 1
		Y = X
		Z = X
	end
	local weld = weldBetween(Torso,ORB)
	repeat
		Swait()
		grav.position = Mouse.Hit.p
		turnto(Mouse.Hit.p,RootPart)
	until FLIGHT == false
	grav.P = 20000
	CUSTOMMOVEMENT = false
	weld:remove()
	for i = 1, 10 do
		Swait()
		X = X + 1
		Y = X
		Z = X
	end
	Rooted = false
end

function succnearest(position,range,force,doesbreak)
	for i,v in ipairs(workspace:GetChildren()) do
		local body = v:GetChildren()
		for part = 1, #body do
			if((body[part].ClassName == "Part" or body[part].ClassName == "MeshPart") and v ~= Character) then
				if(body[part].Position - position).Magnitude < range then
					local bv = Instance.new("BodyVelocity") 
					bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
					bv.velocity = CF(body[part].Position,position).lookVector*force
					bv.Parent = body[part]
					bv.Name = "SUCC"
					if v:FindFirstChild("Humanoid") and doesbreak == false then
						dealdamage(body[part],5,15,0,false,12,2)
					end
					if v.ClassName == "Model" and doesbreak == true then
						v:BreakJoints()
					end
					game:GetService("Debris"):AddItem(bv, 0.1)
				end
			end
		end
		if v.ClassName == "Part" then
			if v.Anchored == false and (v.Position - position).Magnitude < range then
				local bv = Instance.new("BodyVelocity") 
				bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
				bv.velocity = CF(v.Position,position).lookVector*force
				bv.Parent = v
				bv.Name = "SUCC"
				game:GetService("Debris"):AddItem(bv, 0.1)
			end
		end
	end
end

function dealdamage(hit,min,max,maxstrength,beserk,critrate,critmultiplier)
	if hit.Parent:FindFirstChildOfClass("Humanoid") and hit.Parent:FindFirstChild("HitBy"..Player.Name) == nil then
		local humanoid = hit.Parent:FindFirstChildOfClass("Humanoid")
		local dmg = math.random(min,max)
		if humanoid.Health > 0 then
			if beserk == true then
				humanoid.Health = 0
			else
				--CreateSound("260430060", hit, 1.2, MRANDOM(7, 12) / 10)
				--hit.Velocity = CFrame.new(Torso.Position,hit.Position).lookVector*5*maxstrength
				if math.random(1,100) < critrate+1 then
					humanoid.Health = humanoid.Health - dmg*critmultiplier
					--StatLabel("Normal", hit.CFrame * CF(0, 0 + (hit.Size.z - 1), 0), "CRIT/"..dmg*critmultiplier, C3(255/255, 0, 0))
				else
					humanoid.Health = humanoid.Health - dmg
					--StatLabel("Normal", hit.CFrame * CF(0, 0 + (hit.Size.z - 1), 0), dmg, C3(255/255, 0, 0))
				end
				local defence = Instance.new("BoolValue",hit.Parent)
				defence.Name = ("HitBy"..Player.Name)
				game:GetService("Debris"):AddItem(defence, 0.5)
			end
		end
	end
end

function Vacuum()
	CUSTOMMOVEMENT = true
	local succ = CreateSound("319444224", ORB, 0.3, 1, true)
	local harm = ORB.Touched:Connect(function(hit)
		if hit.Parent ~= Character and hit.Parent.ClassName ~= "Accessory" and hit.Parent ~= Effects and hit.Anchored == false then
			hit:remove()
			CreateSound("261732529", ORB, 3, 1,false)
		end
	end)
	repeat
		Swait()
		succnearest(ORB.Position,50,80,true)
	until VACUUM == false
	CUSTOMMOVEMENT = false
	succ:remove()
	harm:disconnect()
end

function shootbullet()
	CreateSound(PEWSOUND[MRANDOM(1, #PEWSOUND)], ORB, 2, MRANDOM(8, 9) / 10,false)
	local bullet = IT("Part",Effects)
	bullet.Size = VT(1,1,1)
	bullet.Shape = "Ball"
	bullet.Material = "Neon"
	bullet.Color = C3(0.5,0,1)
	local sparks = CreateParticles(bullet,VT(0,0,0),0,150,"Solid",true,true,2)
	bullet.CFrame = ORB.CFrame
	local bv = Instance.new("BodyVelocity") 
	bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
	bv.velocity = CF(bullet.Position,Mouse.Hit.p).lookVector*200
	bv.Parent = bullet
	bv.Name = "MOVE"
	local loop = CreateSound(BULLETLOOPSOUND, bullet, 0.6, MRANDOM(9, 11) / 10,true)
	local HIT = false
	local harm = bullet.Touched:Connect(function(hit)
		if HIT == false and hit.Parent ~= Character and hit.Parent ~= Weapon and hit.Parent ~= Effects then
			HIT = true
			coroutine.resume(coroutine.create(function()
				coroutine.resume(coroutine.create(function()
					for i = 1, 10 do
						Swait()
						bullet.Transparency = bullet.Transparency + 0.1
					end
				end))
				bullet.Anchored = true
				bullet.CanCollide = false
				sparks.Enabled = false
				local sparks2 = CreateParticles(bullet,VT(0,0,0),0,150,"Solid",true,true,7)
				loop.Volume = 3
				CreateSound(BULLETIMPACTSOUND, bullet, 2, MRANDOM(9, 11) / 10,false)
				for i = 1, 350 do
					Swait()
					succnearest(bullet.Position,15,25,false)
				end
				sparks2.Enabled = false
				for i = 1, 10 do
					Swait()
					loop.Volume = loop.Volume - (3/10)
				end
				bullet:remove()
			end))
		end
	end)
end

function shoottoughbullet()
	CreateSound(PEWSOUND[MRANDOM(1, #PEWSOUND)], ORB, 2, MRANDOM(8, 9) / 10,false)
	local bullet = IT("Part",Effects)
	bullet.Size = VT(3,3,3)
	bullet.Shape = "Ball"
	bullet.Material = "Neon"
	bullet.Color = C3(0.5,0,1)
	local sparks = CreateParticles(bullet,VT(0,0,0),0,150,"Solid",true,true,3.5)
	bullet.CFrame = ORB.CFrame
	local bv = Instance.new("BodyVelocity") 
	bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
	bv.velocity = CF(bullet.Position,Mouse.Hit.p).lookVector*100
	bv.Parent = bullet
	bv.Name = "MOVE"
	local loop = CreateSound(BULLETLOOPSOUND, bullet, 0.6, MRANDOM(5, 7) / 10,true)
	local HIT = false
	local harm = bullet.Touched:Connect(function(hit)
		if HIT == false and hit.Parent ~= Character and hit.Parent ~= Weapon and hit.Parent ~= Effects then
			HIT = true
			coroutine.resume(coroutine.create(function()
				coroutine.resume(coroutine.create(function()
					for i = 1, 10 do
						Swait()
						bullet.Transparency = bullet.Transparency + 0.1
					end
				end))
				bullet.Anchored = true
				bullet.CanCollide = false
				sparks.Enabled = false
				local sparks2 = CreateParticles(bullet,VT(0,0,0),0,150,"Solid",true,true,15)
				loop.Volume = 3
				CreateSound(BULLETIMPACTSOUND, bullet, 6, MRANDOM(5,7) / 10,false)
				for i = 1, 50 do
					Swait()
					succnearest(bullet.Position,25,100,true)
				end
				sparks2.Enabled = false
				for i = 1, 10 do
					Swait()
					loop.Volume = loop.Volume - (3/10)
				end
				bullet:remove()
			end))
		end
	end)
end

function grab()
	if Mouse.Target.Parent:FindFirstChild("Torso") then
		local targ = Mouse.Target
		GRABBED = true
		targ.Anchored = true
		CUSTOMMOVEMENT = true
		grav.position = targ.Position
		Swait(50)
		if targ then
			Swait(5)
			targ.Anchored = false
			CUSTOMMOVEMENT = false
			repeat 
				Swait() 
				targ.CFrame = ORB.CFrame
			until GRABBED == false or targ == nil
			GRABBED = false
		end
	end
end

--//=================================\\
--||	  ASSIGN THINGS TO KEYS
--\\=================================//

Humanoid.Changed:connect(function(Jump)
	if Jump == "Jump" and (Disable_Jump == true or DISABLEJUMPING == true) then
		Humanoid.Jump = false
	end
end)

function MouseDown(Mouse)
	if ATTACK == false then
	end
end

function MouseUp(Mouse)
	HOLD = false
end

function KeyDown(Key)
	if ATTACK == false then
		if Key == "e" and VACUUM == false and FLIGHT == false and GRABBED == false then
			Warp()
		end
		if Key == "z" and VACUUM == false and GRABBED == false then
			if FLIGHT == false then
				FLIGHT = true
				StartFlight()
			elseif FLIGHT == true then
				FLIGHT = false
			end
		end
		if Key == "h" then
			shootbullet()
		end
		if Key == "]" then
			shoottoughbullet()
		end
		if Key == "c" and VACUUM == false then
			if GRABBED == false then
				grab()
			elseif GRABBED == true then
				GRABBED = false
			end
		end
		if Key == "x" then
			if VACUUM == false then
				VACUUM = true
				Vacuum()
			elseif VACUUM == true then
				VACUUM = false
			end
		end
	end
end

function KeyUp(Key)
end

Mouse.Button1Down:connect(function(NEWKEY)
	MouseDown(NEWKEY)
end)
Mouse.Button1Up:connect(function(NEWKEY)
	MouseUp(NEWKEY)
end)
Mouse.KeyDown:connect(function(NEWKEY)
	KeyDown(NEWKEY)
end)
Mouse.KeyUp:connect(function(NEWKEY)
	KeyUp(NEWKEY)
end)

--//=================================\\
--\\=================================//


function unanchor()
	if UNANCHOR == true then
		g = Character:GetChildren()
		for i = 1, #g do
			if g[i].ClassName == "Part" then
				g[i].Anchored = false
			end
		end
	end
end


--//=================================\\
--||	WRAP THE WHOLE SCRIPT UP
--\\=================================//

Humanoid.Changed:connect(function(Jump)
	if Jump == "Jump" and (Disable_Jump == true or DISABLEJUMPING == true) then
		Humanoid.Jump = false
	end
end)

local loop = 0
local aaa = 1/2
local loop2 = 0

while true do
	Swait()
	local TORSOVELOCITY = (RootPart.Velocity * VT(1, 0, 1)).magnitude
	SINE = SINE + CHANGE
	if #Effects2>0 then
		for e=1,#Effects2 do
			if Effects2[e]~=nil then
				local Thing=Effects2[e]
				if Thing~=nil then
					local Part=Thing[1]
					local Mode=Thing[2]
					local Delay=Thing[3]
					local IncX=Thing[4]
					local IncY=Thing[5]
					local IncZ=Thing[6]
					local Part2=Thing[8]
					if Thing[1].Transparency<=1 then
						if Thing[2]=="Block1" then
							Thing[1].CFrame=Thing[1].CFrame
							Mesh=Thing[1].Mesh
							Mesh.Scale=Mesh.Scale+VT(Thing[4],Thing[5],Thing[6])
							Thing[1].Transparency=Thing[1].Transparency+Thing[3]
						elseif Thing[2]=="Cylinder" then
							Mesh=Thing[1].Mesh
							Mesh.Scale=Mesh.Scale+VT(Thing[4],Thing[5],Thing[6])
							Thing[1].Transparency=Thing[1].Transparency+Thing[3]
						elseif Thing[2]=="Blood" then
							Mesh=Thing[7]
							Thing[1].CFrame=Thing[1].CFrame*CF(0,.5,0)
							Mesh.Scale=Mesh.Scale+VT(Thing[4],Thing[5],Thing[6])
							Thing[1].Transparency=Thing[1].Transparency+Thing[3]
						elseif Thing[2]=="Elec" then
							Mesh=Thing[1].Mesh
							Mesh.Scale=Mesh.Scale+VT(Thing[7],Thing[8],Thing[9])
							Thing[1].Transparency=Thing[1].Transparency+Thing[3]
						elseif Thing[2]=="Disappear" then
							Thing[1].Transparency=Thing[1].Transparency+Thing[3]
						end
					else
						Part.Parent=nil
						table.remove(Effects2,e)
					end
				end
			end
		end
	end
	unanchor()
	Humanoid.MaxHealth = "inf"
	Humanoid.Health = "inf"
	if Rooted == false then
		Disable_Jump = false
		Humanoid.WalkSpeed = Speed
	elseif Rooted == true then
		Disable_Jump = true
		Humanoid.WalkSpeed = 0
	end
	if CUSTOMMOVEMENT == false then
		loop = loop + aaa
		grav.position = RootPart.CFrame*CF(4,1+loop/10,1).p
		if loop == 45/2 then
			aaa = -1/2
		elseif loop == -15/2 then
			aaa = 1/2
		end
	else
	end
	if PLAYINGMUSIC == true then
		Orbmesh.Scale = VT(X+SOUND.PlaybackLoudness/70,Y+SOUND.PlaybackLoudness/70,Z+SOUND.PlaybackLoudness/70)
	else
		Orbmesh.Scale = VT(X,Y,Z)
	end
	ORB.Anchored = false
end

--//=================================\\
--\\=================================//





--//====================================================\\--
--||			  		 END OF SCRIPT
--\\====================================================//--
