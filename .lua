local type_custom = typeof
if not LPH_OBFUSCATED then
	LPH_JIT = function(...)
		return ...;
	end;
	LPH_JIT_MAX = function(...)
		return ...;
	end;
	LPH_NO_VIRTUALIZE = function(...)
		return ...;
	end;
	LPH_NO_UPVALUES = function(f)
		return (function(...)
			return f(...);
		end);
	end;
	LPH_ENCSTR = function(...)
		return ...;
	end;
	LPH_ENCNUM = function(...)
		return ...;
	end;
	LPH_ENCFUNC = function(func, key1, key2)
		if key1 ~= key2 then return print("LPH_ENCFUNC mismatch") end
		return func
	end
	LPH_CRASH = function()
		return print(debug.traceback());
	end;
    SWG_DiscordUser = "Lebyss.xys"
    SWG_DiscordID = 1337
    SWG_Private = true
    SWG_Dev = false
    SWG_Version = "V3.2"
    SWG_Title = 'Lebyss.xys Premium [Admin] 30d https://discord.gg/GyJyfXwp'
    SWG_ShortName = 'Premium 30d'
    SWG_FullName = 'ts'
    SWG_FFA = false
end;
--- FABRICATED VALUES END!!!

local workspace = cloneref(game:GetService("Workspace"))
local Players = cloneref(game:GetService("Players"))
local RunService = cloneref(game:GetService("RunService"))
local Lighting = cloneref(game:GetService("Lighting"))
local UserInputService = cloneref(game:GetService("UserInputService"))
local HttpService = cloneref(game:GetService("HttpService"))
local GuiInset = cloneref(game:GetService("GuiService")):GetGuiInset()
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera

local function getfile(name)
    local repo = "https://raw.githubusercontent.com/SWIMHUBISWIMMING/swimhub/main/"
    local success, content = pcall(game.HttpGet, game, repo..name)
    if success then return content else return print("getfile returned error \""..content.."\"") end
end
local function isswimhubfile(file)
    return isfile("Lebyss.xys/new/files/"..file)
end
local function readswimhubfile(file)
    if not isswimhubfile(file) then return false end
    local success, returns = pcall(readfile, "Lebyss.xys/new/files/"..file)
    if success then return returns else return print(returns) end
end
local function loadswimhubfile(file)
    if not isswimhubfile(file) then return false end
    local success, returns = pcall(loadstring, readswimhubfile(file))
    if success then return returns else return print(returns) end
end
local function getswimhubasset(file)
    if isswimhubfile(file) then return false end
    local success, returns = pcall(getcustomasset, "Lebyss.xys/new/files/"..file)
    if success then return returns else return print(returns) end
end
do
    if not isfolder("Lebyss.xys") then makefolder("Lebyss.xys") end
    if not isfolder("Lebyss.xys/new") then makefolder("Lebyss.xys/new") end
    if not isfolder("Lebyss.xys/new/files") then makefolder("Lebyss.xys/new/files") end
    local function getfiles(force, list)
        for _, file in list do
            if (force or not force and not isswimhubfile(file)) then
                writefile("Lebyss.xys/new/files/"..file, getfile(file))
            end
        end
    end
    local gotassets = getfile("assets.json")
    local assets = HttpService:JSONDecode(gotassets)
    local localassets = readswimhubfile("assets.json")
    if localassets then
        localassets = HttpService:JSONDecode(localassets)
        if localassets.version ~= assets.version then
            writefile("Lebyss.xys/new/files/assets.json", gotassets)
            getfiles(true, assets.list)
        end
    else
        writefile("Lebyss.xys/new/files/assets.json", gotassets)
    end
    getfiles(false, assets.list)
end

-- swimhub main

local cheat = {
    Library = nil,
    Toggles = nil,
    Options = nil,
    ThemeManager = nil,
    SaveManager = nil,
    connections = {
        heartbeats = {},
        renderstepped = {}
    },
    drawings = {},
    hooks = {}
}
cheat.utility = {} do
    cheat.utility.new_heartbeat = function(func)
        local obj = {}
        cheat.connections.heartbeats[func] = func
        function obj:Disconnect()
            if func then
                cheat.connections.heartbeats[func] = nil
                func = nil
            end
        end
        return obj
    end
    cheat.utility.new_renderstepped = function(func)
        local obj = {}
        cheat.connections.renderstepped[func] = func
        function obj:Disconnect()
            if func then
                cheat.connections.renderstepped[func] = nil
                func = nil
            end
        end
        return obj
    end
    cheat.utility.new_drawing = function(drawobj, args)
        local obj = Drawing.new(drawobj)
        for i, v in pairs(args) do
            obj[i] = v
        end
        cheat.drawings[obj] = obj
        return obj
    end
    cheat.utility.new_hook = function(f, newf, usecclosure) LPH_NO_VIRTUALIZE(function()
        if usecclosure then
            local old; old = hookfunction(f, newcclosure(function(...)
                return newf(old, ...)
            end))
            cheat.hooks[f] = old
            return old
        else
            local old; old = hookfunction(f, function(...)
                return newf(old, ...)
            end)
            cheat.hooks[f] = old
            return old
        end
    end)() end
    local connection; connection = RunService.Heartbeat:Connect(LPH_NO_VIRTUALIZE(function(delta)
        for _, func in pairs(cheat.connections.heartbeats) do
            func(delta)
        end
    end))
    local connection1; connection1 = RunService.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function(delta)
        for _, func in pairs(cheat.connections.renderstepped) do
            func(delta)
        end
    end))
    cheat.utility.unload = function()
        connection:Disconnect()
        connection1:Disconnect()
        for key, _ in pairs(cheat.connections.heartbeats) do
            cheat.connections.heartbeats[key] = nil
        end
        for key, _ in pairs(cheat.connections.renderstepped) do
            cheat.connections.heartbeats[key] = nil
        end
        for _, drawing in pairs(cheat.drawings) do
            drawing:Remove()
            cheat.drawings[_] = nil
        end
        for hooked, original in pairs(cheat.hooks) do
            if type(original) == "function" then
                hookfunction(hooked, clonefunction(original))
            else
                hookmetamethod(original["instance"], original["metamethod"], clonefunction(original["func"]))
            end
        end
    end
end

cheat.Library, cheat.Toggles, cheat.Options = loadstring(game:HttpGet('https://raw.githubusercontent.com/some1strange/builds/refs/heads/main/LinoriaModded.lua'))()
cheat.ThemeManager = loadswimhubfile("library_theme.lua")()
cheat.SaveManager = loadswimhubfile("library_save.lua")()
local ui = {
    window = cheat.Library:CreateWindow({
        Title=string.format(
            SWG_Title,
            SWG_Version,
            SWG_FullName
        ),
    Center=true,AutoShow=true,TabPadding=8})
}

local _CFramenew = CFrame.new
local _Vector2new = Vector2.new
local _Vector3new = Vector3.new
local _IsDescendantOf = game.IsDescendantOf
local _FindFirstChild = game.FindFirstChild
local _FindFirstChildOfClass = game.FindFirstChildOfClass
local _Raycast = workspace.Raycast
local _IsKeyDown = UserInputService.IsKeyDown
local _WorldToViewportPoint = Camera.WorldToViewportPoint
local _Vector3zeromin = Vector3.zero.Min
local _Vector2zeromin = Vector2.zero.Min
local _Vector3zeromax = Vector3.zero.Max
local _Vector2zeromax = Vector2.zero.Max
local _IsA = game.IsA
local tablecreate = table.create
local mathfloor = math.floor
local mathround = math.round
local mathclamp = math.clamp
local tostring = tostring
local unpack = unpack
local getupvalues = debug.getupvalues
local getupvalue = debug.getupvalue
local setupvalue = debug.setupvalue
local getconstants = debug.getconstants
local getconstant = debug.getconstant
local setconstant = debug.setconstant
local getstack = debug.getstack
local setstack = debug.setstack
local getinfo = debug.getinfo
local rawget = rawget

ui.tabs = {
    combat = ui.window:AddTab('combat'),
    rage = ui.window:AddTab('rage'),
    legit = ui.window:AddTab('legit'),
    visuals = ui.window:AddTab('visuals'),
    misc = ui.window:AddTab('misc'),
    config = ui.window:AddTab('config'),
}
ui.box = {
    aimbot = ui.tabs.combat:AddLeftTabbox(),
    esp = ui.tabs.visuals:AddLeftTabbox(),
    cheatvis = ui.tabs.visuals:AddRightTabbox(),
    world = ui.tabs.visuals:AddRightTabbox(),
    move = ui.tabs.misc:AddLeftTabbox(),
    atvfly = ui.tabs.misc:AddLeftTabbox(),
    misc = ui.tabs.misc:AddRightTabbox(),
    themeconfig = ui.tabs.config:AddLeftGroupbox('theme config'),
}

local trident = {
    loaded = false,
    lastpos = nil,
    middlepart = nil,
    tcp = nil,
    original_model = nil
}
--[[
-- no recoil
debug.setconstant(debug.getupvalue(trident.recoil, 10), 2, rawget(rawget(trident.classes, "InputManager"), "InputDevice"))
-- jump shoot

-- no spread / silent
local old; old = hookmetamethod(Random.new(), "__namecall", newcclosure(function(self, ...)
    local args = {...}
    if args[1] == -100 and args[2] == 100 then
        print('nospread')
        return old(self, -1, 1)
    end
    return old(self, ...)
end))
]]
repeat if not pcall(function()
    trident.middlepart = workspace.Const.Ignore.LocalCharacter.Middle
    trident.original_model = game:GetService("ReplicatedStorage").Shared.entities.Player.Model
    trident.tcp = LocalPlayer.TCP
end) then task.wait(0.5) end until trident.middlepart and trident.original_model and trident.tcp

cheat.EspLibrary = {}; LPH_NO_VIRTUALIZE(function()
    local esp_table = {}
    local workspace = cloneref(game:GetService("Workspace"))
    local rservice = cloneref(game:GetService("RunService"))
    local plrs = cloneref(game:GetService("Players"))
    local lplr = plrs.LocalPlayer
    local container = Instance.new("Folder", game:GetService("CoreGui").RobloxGui)
    esp_table = {
        __loaded = false,
        main_settings = {
            textSize = 15,
            textFont = Drawing.Fonts.Monospace,
            distancelimit = false,
            maxdistance = 200,
            useteamcolor = false,
            teamcheck = false,
            sleepcheck = false,
            simplecalc = false
        },
        main_object_settings = {
            textSize = 15,
            textFont = Drawing.Fonts.Monospace,
            distancelimit = false,
            maxdistance = 200,
            useteamcolor = false,
            teamcheck = false,
            sleepcheck = false,
            allowed = {}
        },
        settings = {
            enemy = {
                enabled = false,
    
                box = false,
                box_fill = false,
                realname = false,
                dist = false,
                weapon = false,
                skeleton = false,
    
                box_outline = false,
                realname_outline = false,
                dist_outline = false,
                weapon_outline = false,
    
                box_color = { Color3.new(1, 1, 1), 1 },
                box_fill_color = { Color3.new(1, 0, 0), 0.3 },
                realname_color = { Color3.new(1, 1, 1), 1 },
                dist_color = { Color3.new(1, 1, 1), 1 },
                weapon_color = { Color3.new(1, 1, 1), 1 },
                skeleton_color = { Color3.new(1, 1, 1), 1 },
    
                box_outline_color = { Color3.new(), 1 },
                realname_outline_color = Color3.new(),
                dist_outline_color = Color3.new(),
                weapon_outline_color = Color3.new(),
    
                chams = false,
                chams_visible_only = false,
                chams_fill_color = { Color3.new(1, 1, 1), 0.5 },
                chamsoutline_color = { Color3.new(1, 1, 1), 0 }
            },
            object = {
                enabled = false,

                realname = false,
                realname_outline = false,

                realname_color = { Color3.new(1, 1, 1), 1 },
                realname_outline_color = Color3.new(),

                chams = false,
                chams_visible_only = false,
                chams_fill_color = { Color3.new(1, 1, 1), 0.5 },
                chamsoutline_color = { Color3.new(1, 1, 1), 0 }
            }
        }
    }
    local loaded_plrs = {}
    -- (please update me) vars
    local camera = workspace.CurrentCamera

    -- constants
    local VERTICES = {
        _Vector3new(-1, -1, -1),
        _Vector3new(-1, 1, -1),
        _Vector3new(-1, 1, 1),
        _Vector3new(-1, -1, 1),
        _Vector3new(1, -1, -1),
        _Vector3new(1, 1, -1),
        _Vector3new(1, 1, 1),
        _Vector3new(1, -1, 1)
    }
    local skeleton_order = {
        ["LeftFoot"] = "LeftLowerLeg",
        ["LeftLowerLeg"] = "LeftUpperLeg",
        ["LeftUpperLeg"] = "LowerTorso",
    
        ["RightFoot"] = "RightLowerLeg",
        ["RightLowerLeg"] = "RightUpperLeg",
        ["RightUpperLeg"] = "LowerTorso",
    
        ["LeftHand"] = "LeftLowerArm",
        ["LeftLowerArm"] = "LeftUpperArm",
        ["LeftUpperArm"] = "Torso",
    
        ["RightHand"] = "RightLowerArm",
        ["RightLowerArm"] = "RightUpperArm",
        ["RightUpperArm"] = "Torso",
    
        ["LowerTorso"] = "Torso",
        ["Torso"] = "Head"
    }
    -- functions
    local esp = {}
    esp.create_obj = function(type, args)
        local obj = Drawing.new(type)
        for i, v in args do
            obj[i] = v
        end
        return obj
    end
    local function isBodyPart(name)
        return name == "Head" or name:find("Torso") or name:find("Leg") or name:find("Arm")
    end
    local function getBoundingBox(parts)
        local min, max
        for i = 1, #parts do
            local part = parts[i]
            local cframe, size = part.CFrame, part.Size
    
            min = _Vector3zeromin(min or cframe.Position, (cframe - size * 0.5).Position)
            max = _Vector3zeromax(max or cframe.Position, (cframe + size * 0.5).Position)
        end
    
        local center = (min + max) * 0.5
        local front = _Vector3new(center.X, center.Y, max.Z)
        return _CFramenew(center, front), max - min
    end
    local function worldToScreen(world)
        local screen, inBounds = _WorldToViewportPoint(camera, world)
        return _Vector2new(screen.X, screen.Y), inBounds, screen.Z
    end
    
    local function calculateCorners(cframe, size)
        local corners = tablecreate(#VERTICES)
        for i = 1, #VERTICES do
            corners[i] = worldToScreen((cframe + size * 0.5 * VERTICES[i]).Position)
        end
    
        local min = _Vector2zeromin(camera.ViewportSize, unpack(corners))
        local max = _Vector2zeromax(Vector2.zero, unpack(corners))
        return {
            corners = corners,
            topLeft = _Vector2new(mathfloor(min.X), mathfloor(min.Y)),
            topRight = _Vector2new(mathfloor(max.X), mathfloor(min.Y)),
            bottomLeft = _Vector2new(mathfloor(min.X), mathfloor(max.Y)),
            bottomRight = _Vector2new(mathfloor(max.X), mathfloor(max.Y))
        }
    end

    local function calculateCornersSimple(head, hrp)
        --[[
            auto head_position = roblox::WorldToScreen(vector3_sub(head.GetPartPosition(), { 0, -0.5, 0 }), dimensions, viewmatrix);
			auto leg_position = roblox::WorldToScreen(vector3_sub(rootpart.GetPartPosition(), { 0, 3.5, 0 }), dimensions, viewmatrix);
            float height = leg_position.y - head_position.y;
			float width = height / 3.6f;
            corners = {
			    {
			        static_cast<int>(round(head_position.x - width)),
			        static_cast<int>(round(head_position.y))
			    }, // up left corner
				{
			        static_cast<int>(round(head_position.x - width)),
			        static_cast<int>(round(leg_position.y))
			    }, // down left corner
				{
			        static_cast<int>(round(head_position.x + width)),
			        static_cast<int>(round(head_position.y))
			    }, // up right corner
			    {
			        static_cast<int>(round(head_position.x + width)),
			        static_cast<int>(round(leg_position.y))
			    } // down right corner
			};
        ]]
        local head_position = worldToScreen(head.Position - Vector3.yAxis * 0.5)
        local leg_position = worldToScreen(hrp.Position - Vector3.yAxis * 3.5)
        local headx, heady = head_position.X, head_position.Y
        local legx, legy = leg_position.X, leg_position.Y
        local height = legy - heady;
        local width = height / 3.6
        return {
            topLeft = _Vector2new(headx - width, heady),
            topRight = _Vector2new(headx - width, legy),
            bottomLeft = _Vector2new(headx + width, heady),
            bottomRight =_Vector2new(headx + width, legy)
        }
    end

    local enttiyidentification = {}
    for i, v in game:GetService("ReplicatedStorage").Shared.entities:GetChildren() do
        local model = _FindFirstChild(v, "Model")
        if model and model.PrimaryPart then
            enttiyidentification[v.Name] = {
                CollisionGroup = model.PrimaryPart.CollisionGroup,
                Material = model.PrimaryPart.Material,
                Color = model.PrimaryPart.Color
            }
        end
    end
    local function identify_model(model)
        if model.ClassName ~= "Model" then return false, false end
        if _FindFirstChildOfClass(model, "MeshPart") and _FindFirstChildOfClass(model, "MeshPart").MeshId == "rbxassetid://12939036056" then
            if #model:GetChildren() == 1 then
                return "Stone", model:GetChildren()[1]
            else
                for _, part in model:GetChildren() do
                    if part.Color == Color3.fromRGB(248, 248, 248) then
                        return "Nitrate", part
                    elseif part.Color == Color3.fromRGB(199, 172, 120) then
                        return "Iron", part
                    end
                end
            end
        end
        if not model.PrimaryPart then return end
        local primpart = model.PrimaryPart
        for name, entity in enttiyidentification do
            if entity.Color == primpart.Color and entity.Material == primpart.Material and entity.CollisionGroup == primpart.CollisionGroup then
                return name, primpart
            end
        end
        return false, false
    end

    local function deepcopy(original)	
        local copy = {}
        for key, value in original do
            copy[key] = type(value) == "table" and deepcopy(value) or value
        end
        return copy
    end

    -- MAINN
    local function create_esp(model)
        if model and _FindFirstChild(model, "Head") and _FindFirstChild(model, "LowerTorso") then
            local settings = esp_table.settings.enemy
            loaded_plrs[model] = {
                obj = {
                    box_fill = esp.create_obj("Square", { Filled = true, Visible = false }),
                    box_outline = esp.create_obj("Square", { Filled = false, Thickness = 3, Visible = false, ZIndex = -1}),
                    box = esp.create_obj("Square", { Filled = false, Thickness = 1, Visible = false }),
                    realname = esp.create_obj("Text", { Center = true, Visible = false }),
                    dist = esp.create_obj("Text", { Center = true, Visible = false }),
                    weapon = esp.create_obj("Text", { Center = true, Visible = false }),
                },
                chams_object = Instance.new("Highlight", container),
            }
            for required, _ in next, skeleton_order do
                loaded_plrs[model].obj["skeleton_" .. required] = esp.create_obj("Line", { Visible = false })
            end

            local character = model
            local head = _FindFirstChild(character, "Head")
            local lowertorso = _FindFirstChild(character, "LowerTorso")


            local plr = loaded_plrs[model]
            local obj = plr.obj

            local cham = plr.chams_object
            local box = obj.box
            local box_outline = obj.box_outline
            local box_fill = obj.box_fill
            local realname = obj.realname
            local dist = obj.dist
            local weapon = obj.weapon

            local main_settings = esp_table.main_settings
            local settings = esp_table.settings.enemy
            local setvis_cache = false

            function plr:forceupdate()
                cham.DepthMode = settings.chams_visible_only and Enum.HighlightDepthMode.Occluded or not settings.chams_visible_only and Enum.HighlightDepthMode.AlwaysOnTop 
                cham.FillColor = settings.chams_fill_color[1]
                cham.FillTransparency = settings.chams_fill_color[2]
                cham.OutlineColor = settings.chamsoutline_color[1]
                cham.OutlineTransparency = settings.chamsoutline_color[2]

                box.Transparency = settings.box_color[2]
                box.Color = settings.box_color[1]
                box_outline.Transparency = settings.box_outline_color[2]
                box_outline.Color = settings.box_outline_color[1]
                box_fill.Color = settings.box_fill_color[1]
                box_fill.Transparency = settings.box_fill_color[2]

                realname.Size = main_settings.textSize
                realname.Font = main_settings.textFont
                realname.Color = settings.realname_color[1]
                realname.Outline = settings.realname_outline
                realname.OutlineColor = settings.realname_outline_color
                realname.Transparency = settings.realname_color[2]

                dist.Size = main_settings.textSize
                dist.Font = main_settings.textFont
                dist.Color = settings.dist_color[1]
                dist.Outline = settings.dist_outline
                dist.OutlineColor = settings.dist_outline_color
                dist.Transparency = settings.dist_color[2]

                weapon.Size = main_settings.textSize
                weapon.Font = main_settings.textFont
                weapon.Color = settings.weapon_color[1]
                weapon.Outline = settings.weapon_outline
                weapon.OutlineColor = settings.weapon_outline_color
                weapon.Transparency = settings.weapon_color[2]

                cham.Enabled = setvis_cache
                box.Visible = setvis_cache
                box_outline.Visible = setvis_cache
                box_fill.Visible = setvis_cache
                realname.Visible = setvis_cache
                dist.Visible = setvis_cache
                weapon.Visible = setvis_cache

                for required, _ in next, skeleton_order do
                    local skeletonobj = obj["skeleton_" .. required]
                    if (skeletonobj) then
                        skeletonobj.Color = settings.skeleton_color[1]
                        skeletonobj.Transparency = settings.skeleton_color[2]
                        skeletonobj.Visible = setvis_cache
                    end
                end
            end

            function plr:togglevis(bool)
                if setvis_cache ~= bool then
                    setvis_cache = bool
                    if not bool then
                        for _, v in obj do v.Visible = false end
                        cham.Enabled = false
                    else
                        cham.Enabled = settings.chams
                        box.Visible = settings.box
                        box_outline.Visible = settings.box_outline
                        box_fill.Visible = settings.box_fill
                        realname.Visible = settings.realname
                        dist.Visible = settings.dist
                        weapon.Visible = settings.weapon
                        for required, _ in next, skeleton_order do
                            local skeletonobj = obj["skeleton_" .. required]
                            if (skeletonobj) then
                                skeletonobj.Visible = settings.skeleton
                            end
                        end
                    end
                end
            end

            plr.connection = cheat.utility.new_renderstepped(function(delta)
                if not (
                    settings.enabled and
                    head and
                    character
                ) then
                    return plr:togglevis(false)
                end
                local _, onScreen = worldToScreen(head.Position)
                if not onScreen then
                    return plr:togglevis(false)
                end

                local distance = (camera.CFrame.p - head.Position).Magnitude

                local corners if main_settings.simplecalc then
                    corners = calculateCornersSimple(head, lowertorso)
                else
                    local cache = {}
                    local children = character:GetChildren()
                    for i = 1, #children do
                        local part = children[i]
                        if _IsA(part, "BasePart") and part ~= character.PrimaryPart and isBodyPart(part.Name) then
                            cache[#cache + 1] = part
                        end
                    end
                    corners = calculateCorners(getBoundingBox(cache))
                end

                if not corners then
                    return plr:togglevis(false)
                end

                plr:togglevis(true)

                cham.Adornee = character
                do
                    local pos = corners.topLeft
                    local size = corners.bottomRight - corners.topLeft
                    box.Position = pos
                    box.Size = size
                    box_outline.Position = pos + Vector2.one
                    box_outline.Size = size - Vector2.one
                    box_fill.Position = pos
                    box_fill.Size = size
                end

                do
                    realname.Text = "Player"
                    realname.Position = (corners.topLeft + corners.topRight) * 0.5 -
                        Vector2.yAxis * realname.TextBounds.Y - _Vector2new(0, 2)
                end

                do
                    local bottom = (corners.bottomLeft + corners.bottomRight) * 0.5
                    dist.Text = tostring(mathround(distance)) .. " studs"
                    dist.Position = bottom
                    weapon.Text = "unknown"
                    weapon.Position = bottom + (dist.Visible and Vector2.yAxis * dist.TextBounds.Y - _Vector2new(0, 2) or Vector2.zero)
                end

                if settings.skeleton then
                    for _, part in next, character:GetChildren() do
                        local skeletonobj = obj["skeleton_" .. part.Name]
                        local parent_part = skeleton_order[part.Name] and _FindFirstChild(character, skeleton_order[part.Name])
                        if skeletonobj and parent_part then
                            local part_position, _ = _WorldToViewportPoint(camera, part.Position)
                            local parent_part_position, _ = _WorldToViewportPoint(
                                camera, parent_part.CFrame.p
                            )
                            skeletonobj.From = _Vector2new(part_position.X, part_position.Y)
                            skeletonobj.To = _Vector2new(parent_part_position.X, parent_part_position.Y)
                        end
                    end
                end
            end)

            plr:forceupdate()
        else
            local espname, mainpart = identify_model(model)
            if not (espname and mainpart) then return end
            loaded_plrs[model] = {
                obj = {
                    name = esp.create_obj("Text", { Center = true, Visible = false, Text = espname }),
                }
            }
            local plr = loaded_plrs[model]
            local obj = plr.obj

            local realname = obj.name

            local setvis_cache = false
            local main_settings = esp_table.main_object_settings
            local settings = esp_table.settings.object
            local allowedobjs = main_settings.allowed

            function plr:forceupdate()
                realname.Size = main_settings.textSize
                realname.Font = main_settings.textFont
                realname.Color = settings.realname_color[1]
                realname.Outline = settings.realname_outline
                realname.OutlineColor = settings.realname_outline_color
                realname.Transparency = settings.realname_color[2]
            end

            function plr:togglevis(bool)
                if setvis_cache ~= bool then
                    for _, v in obj do v.Visible = bool end
                    setvis_cache = bool
                end
            end

            plr.connection = cheat.utility.new_heartbeat(function(delta)
                local plr = loaded_plrs[model]
                if not (settings.enabled and mainpart and allowedobjs[espname]) then
                    return plr:togglevis(false)
                end
                local position, onscreen = worldToScreen(mainpart.Position)
                if not onscreen then
                    return plr:togglevis(false)
                end
                plr:togglevis(true)
                realname.Position = position
            end)

            plr:forceupdate()
        end
    end
    local function destroy_esp(model)
        local plr_object = loaded_plrs[model]
        if not plr_object then return end
        plr_object.connection:Disconnect()
        for i, v in plr_object.obj do
            v:Remove()
        end
        if plr_object.chams_object then
            plr_object.chams_object:Destroy()
        end
        loaded_plrs[model] = nil
    end

    function esp_table.load()
        assert(not esp_table.__loaded, "[ESP] already loaded");
    
        for i, v in next, workspace:GetChildren() do
           create_esp(v)
        end
    
        esp_table.playerAdded = workspace.ChildAdded:Connect(create_esp);
        esp_table.playerRemoving = workspace.ChildRemoved:Connect(destroy_esp);
        esp_table.__loaded = true;
    end
    
    function esp_table.unload()
        assert(esp_table.__loaded, "[ESP] not loaded yet");
    
        for i, v in next, workspace:GetChildren() do
            destroy_esp(v)
        end
    
        esp_table.playerAdded:Disconnect();
        esp_table.playerRemoving:Disconnect();
        esp_table.__loaded = false;
    end
    
    function esp_table.icaca()
        for _, v in loaded_plrs do
            task.spawn(function() v:forceupdate() end)
        end
    end

    cheat.EspLibrary = esp_table
end)();

local validcharacters = {} do
    local function addtovc(obj)
        if not obj then return end
        if not obj:FindFirstChild("Head") and not obj:FindFirstChild("LowerTorso") then return end
        validcharacters[obj] = obj
    end

    local function removefromvc(obj)
        if not validcharacters[obj] then return end
        validcharacters[obj] = nil
    end

    for i, v in next, workspace:GetChildren() do addtovc(v) end
    workspace.ChildAdded:Connect(addtovc);
    workspace.ChildRemoved:Connect(removefromvc);
end

local aimbot = {
    enabled = false,
    camera = false,
    silent = false, -- camera, silent
    sleep_check = false,
    team_check = false,
    part = "Head",
    manipulation = false,
    manipulation_range = 5,
    fov = false,
    fov_show = false,
    fov_color = Color3.new(1, 1, 1),
    fov_outline = false,
    fov_outline_color = Color3.new(0, 0, 0),
    fov_size = 100,
    indicator = false,
    indicator_text = "",
    jumpshoot = false,
    noslowdown = false,
    nospread = false,
    forcehead = false,
    invis = false,
    mathhuge = false,
    hitboxes = false,
    hbbypass = false,
    instant = false,
    fly = false,
    silentwalk = false
}

local function get_closest_target(usefov, fov_size)
    local part, spos = nil, nil
    local maximum_distance = usefov and fov_size or math.huge
    local center_screen = _Vector2new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    LPH_JIT_MAX(function()
        for _, character in validcharacters do
            local hitpart = _FindFirstChild(character, "LowerTorso")
            if hitpart then
                local position, onscreen = _WorldToViewportPoint(Camera, hitpart.Position)
                local distance = (_Vector2new(position.X, position.Y) - center_screen).Magnitude
                if (usefov and onscreen or not usefov) and distance < maximum_distance then
                    part = hitpart
                    maximum_distance = distance
                    spos = _Vector2new(position.X, position.Y)
                end
            end
        end
    end)()
    return part, spos
end
do
    local magicsize, domagic, magicsee, snapline = 0.5, false, false, false
    local fov, fov_show, fov_color, fov_outline, fov_size = false, false, Color3.new(1, 1, 1), false, 100

    local CircleOutline = cheat.utility.new_drawing("Circle", {
        Thickness = 3,
        Color = Color3.new(),
        ZIndex = 1
    })
    local CircleInline = cheat.utility.new_drawing("Circle", {
        Transparency = 1,
        Thickness = 1,
        ZIndex = 2
    })
    local snaplinedrawing = cheat.utility.new_drawing("Line", {
        Transparency = 1,
        Thickness = 1,
        ZIndex = 1,
        Color = Color3.new(1, 1, 1),
        Visible = false
    })
    local function update_fov()
        CircleInline.Radius = fov_size
        CircleInline.Color = fov_color
        CircleInline.Visible = fov and fov_show
        CircleOutline.Radius = fov_size
        CircleOutline.Visible = (fov and fov_show and fov_outline)
    end
    local function find_special(_v)
        if not _v then return end
        for i, v in _v:GetChildren() do if v.Name == "Head" and v.Material == Enum.Material.Neon then
            return v
        end end
        local new_instance = Instance.new("Part")
        new_instance.Parent = _v
        new_instance.Name = "Head"
        new_instance.Anchored = true
        new_instance.Material = Enum.Material.Neon
        new_instance.CollisionGroup = "Players"
        new_instance.Transparency = 1
        new_instance.Size = _Vector3new(5, 1, 5)
        return new_instance
    end

    local magicbullet = ui.box.aimbot:AddTab("player")
    magicbullet:AddToggle('aimbot_ultraexploit',{Text = 'player redirection',Default = false,Callback = function(v)
        domagic = v
    end}):AddKeyPicker('aimbot_ultraexploit_bind', {Default = 'None',SyncToggleState = true,Mode = 'Toggle',Text = 'player redirection',NoUI = false})
    magicbullet:AddToggle('aimbot_ultraexploit_snapline', {Text = 'snapline to target',Default = false,Callback = function(Value)
        snapline = Value
    end})
    magicbullet:AddToggle('aimbot_fov', {Text = 'use fov',Default = false,Callback = function(Value)
        fov = Value; update_fov()
    end})
    local Depbox1 = magicbullet:AddDependencyBox();
    Depbox1:AddToggle('aimbot_fov_show', {Text = 'show fov',Default = false,Callback = function(Value)
        fov_show = Value; update_fov()
    end}):AddColorPicker('aimbot_fov_color',{Default = Color3.new(1, 1, 1),Title = 'fov color',Transparency = 0,Callback = function(Value)
        fov_color = Value; update_fov()
    end})
    Depbox1:AddToggle('aimbot_fov_outline', {Text = 'fov outline',Default = false,Callback = function(Value)
        fov_outline = Value; update_fov()
    end})
    Depbox1:AddToggle('aimbot_fov_outline', {Text = 'FOV 120 BAN!',Default = false,Callback = function(Value)
        fov_outline = Value; update_fov()
    end})
    Depbox1:AddToggle('aimbot_fov_outline', {Text = 'FOV 100 NO BAN!',Default = false,Callback = function(Value)
        fov_outline = Value; update_fov()
    end})
    Depbox1:AddSlider('aimbot_fov_size',{Text = 'target fov',Default = 100,Min = 100,Max = 10000,Rounding = 0,Compact = true,Callback = function(State)
        fov_size = State; update_fov()
    end})
    local target, spos, cachedtarget;
    cheat.utility.new_renderstepped(function()
        if not cachedtarget then
            target, spos = get_closest_target(fov, fov_size)
        end
        if target and spos then
            snaplinedrawing.Visible = snapline
            snaplinedrawing.From = _Vector2new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
            snaplinedrawing.To = spos
        else
            snaplinedrawing.Visible = false
        end
        CircleOutline.Position = _Vector2new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        CircleInline.Position = _Vector2new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    end)
    do
        local function addtovc(obj)
            if not obj then return end
            if not obj:FindFirstChild("whiz") then return end
            if not domagic then return end
            local confirmed = false
            obj:GetPropertyChangedSignal("CFrame"):Connect(function()
                if not confirmed and (Camera.CFrame.p - obj.CFrame.p).Magnitude < 1 then
                    confirmed = true
                end
                if confirmed and (cachedtarget or target) then
                    if not cachedtarget then cachedtarget = target end
                    --local magicpart = find_special(cachedtarget.Parent)
                    local bulletpos = obj.CFrame.Position
                    --magicpart.Position = _Vector3new(bulletpos.X, cachedtarget.Position.Y + 4, bulletpos.Z)
                    cachedtarget.Parent.PrimaryPart.CFrame = _CFramenew(_Vector3new(bulletpos.X, cachedtarget.Position.Y, bulletpos.Z))
                end
            end)
            cheat.utility.new_heartbeat(function()
                if not obj or not obj.Parent then
                    cachedtarget = false
                end
            end)
        end
        workspace.Const.Ignore.ChildAdded:Connect(addtovc);
    end
end
do
    local hbc, original_size, hbsize = nil, trident.original_model.Head.Size, _Vector3new(0.5, 1, 0.5)
    local dynamic, alwayshead = false, false
    local hitboxheadsizex, hitboxheadsizey, hitboxheadtransparency, cancollide = 10, 10, 0.5, false
    local function change_size(_v)
        for i, v in _v:GetChildren() do if v.Name == "Head" and v.Material == Enum.Material.Plastic then
            v.Size = hbsize
            v.Transparency = hitboxheadtransparency
            v.CanCollide = cancollide
            return
        end end
    end
    local function restore_original(_v)
        for i, v in _v:GetChildren() do if v.Name == "Head" and v.Material == Enum.Material.Plastic then
            v.Size = hbsize
            v.Transparency = hitboxheadtransparency
            v.CanCollide = cancollide
            return
        end end
    end
     
    local hbb = ui.box.aimbot:AddTab("scammed")
    hbb:AddToggle('scammed_enabled', {
        Text = 'scammed expander',
        Default = false,
        Callback = function(value)
            aimbot.hitboxes = value
            if hbc then hbc:Disconnect() end
            if value then
                hbc = cheat.utility.new_heartbeat(function()
                    for _, _v in validcharacters do change_size(_v) end
                end)
            else
                if hbc then hbc:Disconnect() end
                for i, _v in validcharacters do restore_original(_v) end
            end
        end
    })
    hbb:AddToggle('scammed_cancollide',{Text = 'Rame Aim',Default = false,Callback = function(v)
        cancollide = v
    end})
    hbb:AddToggle('scammed_cancollide',{Text = 'Trade Scam Legit',Default = false,Callback = function(v)
        cancollide = v
    end})
    hbb:AddToggle('scammed_cancollide',{Text = 'scam',Default = false,Callback = function(v)
        cancollide = v
    end})

    local hbb = ui.box.aimbot:AddTab("rage")
    hbb:AddToggle('rage_enabled', {
        Text = 'rage expander',
        Default = false,
        Callback = function(value)
            aimbot.hitboxes = value
            if hbc then hbc:Disconnect() end
            if value then
                hbc = cheat.utility.new_heartbeat(function()
                    for _, _v in validcharacters do change_size(_v) end
                end)
            else
                if hbc then hbc:Disconnect() end
                for i, _v in validcharacters do restore_original(_v) end
            end
        end
    })
    hbb:AddToggle('rage_cancollide',{Text = 'RAGE',Default = false,Callback = function(v)
        cancollide = v
    end})
    hbb:AddToggle('rage_cancollide',{Text = 'ABOBYC',Default = false,Callback = function(v)
        cancollide = v
    end})
    hbb:AddToggle('rage_cancollide',{Text = 'HVH',Default = false,Callback = function(v)
        cancollide = v
    end})

    local hbb = ui.box.aimbot:AddTab("hitbox")
    hbb:AddToggle('hitbox_enabled', {
        Text = 'hitbox expander',
        Default = false,
        Callback = function(value)
            aimbot.hitboxes = value
            if hbc then hbc:Disconnect() end
            if value then
                hbc = cheat.utility.new_heartbeat(function()
                    for _, _v in validcharacters do change_size(_v) end
                end)
            else
                if hbc then hbc:Disconnect() end
                for i, _v in validcharacters do restore_original(_v) end
            end
        end
    })
    hbb:AddToggle('hitbox_cancollide',{Text = 'hitbot',Default = false,Callback = function(v)
        cancollide = v
    end})
    hbb:AddToggle('hitbox_cancollide',{Text = 'Aimbot',Default = false,Callback = function(v)
        cancollide = v
    end})
    hbb:AddToggle('SlientAim_cancollide',{Text = 'Slient Aim',Default = false,Callback = function(v)
        cancollide = v
    end})
    hbb:AddToggle('BotAim_cancollide',{Text = 'bot aim',Default = false,Callback = function(v)
        cancollide = v
    end})
    hbb:AddToggle('Fov120_cancollide',{Text = 'Fov 120',Default = false,Callback = function(v)
        cancollide = v
    end})
    hbb:AddToggle('AegoMegotHibot_cancollide',{Text = 'Aego Megot Hibot',Default = false,Callback = function(v)
        cancollide = v
    end})
    hbb:AddSlider('hitbox_head_transparency', { Text = 'transparency', Default = 0.5, Min = 0, Max = 1, Rounding = 1, Compact = false }):OnChanged(function(State)
        hitboxheadtransparency = State
    end)
    hbb:AddSlider('hitbox_head_size_x', { Text = 'size x', Default = 10, Min = 1, Max = 50, Rounding = 1, Compact = false }):OnChanged(function(State)
        hitboxheadsizex = State
        hbsize = _Vector3new(hitboxheadsizex, hitboxheadsizey, hitboxheadsizex)
    end)
    hbb:AddSlider('hitbox_head_size_y', { Text = 'size y', Default = 10, Min = 1, Max = 50, Rounding = 1, Compact = false }):OnChanged(function(State)
        hitboxheadsizey = State
        hbsize = _Vector3new(hitboxheadsizex, hitboxheadsizey, hitboxheadsizex)
    end)
end
do
    local espb = ui.box.esp:AddTab("player esp")
    local es = cheat.EspLibrary.settings.enemy
    espb:AddDropdown('espfont', {Values = { 'UI', 'System', 'Plex', 'Monospace' },Default = 1,Multi = false,Text = 'esp font',Tooltip = 'select font',Callback = function(Value)
        cheat.EspLibrary.main_settings.textFont = Drawing.Fonts[Value]
        cheat.EspLibrary.icaca()
    end})
    espb:AddSlider('espfontsize', { Text = 'esp font size', Default = 13, Min = 1, Max = 30, Rounding = 0, Compact = true }):OnChanged(function(State)
        cheat.EspLibrary.main_settings.textSize = State
        cheat.EspLibrary.icaca()
    end)
    espb:AddToggle('espsimplecalc', {
        Text = 'simpler corner calc (fps)',
        Default = false,
        Callback = function(first)
            cheat.EspLibrary.main_settings.simplecalc = first
            cheat.EspLibrary.icaca()
        end
    })
    espb:AddToggle('espswitch', {
        Text = 'enable esp',
        Default = false,
        Callback = function(first)
            es.enabled = first
            cheat.EspLibrary.icaca()
        end
    })
    espb:AddToggle('espteamswitch', {
        Text = 'team/ai check',
        Default = false,
        Callback = function(first)
            cheat.EspLibrary.main_settings.teamcheck = first
            cheat.EspLibrary.icaca()
        end
    })
    espb:AddToggle('espsleeperswitch', {
        Text = 'sleeper check',
        Default = false,
        Callback = function(first)
            cheat.EspLibrary.main_settings.sleepcheck = first
            cheat.EspLibrary.icaca()
        end
    })
    ----------------------------------------------------------
    espb:AddToggle('espbox', {
        Text = 'box esp',
        Default = false,
        Callback = function(first)
            es.box = first
            cheat.EspLibrary.icaca()
        end
    }):AddColorPicker('espboxcolor', {
        Default = Color3.new(1, 1, 1),
        Title = 'box color',
        Transparency = 0,
        Callback = function(Value)
            es.box_color[1] = Value
            cheat.EspLibrary.icaca()
        end
    })
    ---
    espb:AddToggle('espboxfill', {
        Text = 'box fill',
        Default = false,
        Callback = function(first)
            es.box_fill = first
            cheat.EspLibrary.icaca()
        end
    }):AddColorPicker('espboxfillcolor',
        {
            Default = Color3.new(1, 1, 1),
            Title = 'box fill color',
            Transparency = 0,
            Callback = function(Value)
                es.box_fill_color[1] = Value
                cheat.EspLibrary.icaca()
            end
        })
    ---
    espb:AddToggle('espoutlinebox', {
        Text = 'box outline',
        Default = false,
        Callback = function(first)
            es.box_outline = first
            cheat.EspLibrary.icaca()
        end
    }):AddColorPicker('espboxoutlinecolor',
        {
            Default = Color3.new(),
            Title = 'box outline color',
            Transparency = 0,
            Callback = function(Value)
                es.box_outline_color[1] = Value
                cheat.EspLibrary.icaca()
            end
        })
    ---
    espb:AddSlider('espboxtransparency',
        { Text = 'box transparency', Default = 0, Min = 0, Max = 1, Rounding = 1, Compact = false }):OnChanged(function(
        State)
        es.box_color[2] = 1-State
        cheat.EspLibrary.icaca()
    end)
    espb:AddSlider('espoutlineboxtransparency',
        { Text = 'box outline transparency', Default = 0, Min = 0, Max = 1, Rounding = 1, Compact = false }):OnChanged(function(
        State)
        es.box_outline_color[2] = State
        cheat.EspLibrary.icaca()
    end)
    espb:AddSlider('espboxfilltransparency',
        { Text = 'box fill transparency', Default = 0.5, Min = 0, Max = 1, Rounding = 1, Compact = false }):OnChanged(function(
        State)
        es.box_fill_color[2] = 1-State
        cheat.EspLibrary.icaca()
    end)
    ----------------------------------------------------------
    espb:AddToggle('esprealname', {
        Text = 'name esp',
        Default = false,
        Callback = function(first)
            es.realname = first
            cheat.EspLibrary.icaca()
        end
    }):AddColorPicker('esprealnamecolor',
        {
            Default = Color3.new(1, 1, 1),
            Title = 'name color',
            Transparency = 0,
            Callback = function(Value)
                es.realname_color[1] = Value
                cheat.EspLibrary.icaca()
            end
        })
    espb:AddSlider('esprealnametransparency',
        { Text = 'name transparency', Default = 0, Min = 0, Max = 1, Rounding = 1, Compact = false }):OnChanged(function(
        State)
        es.realname_color[2] = 1-State
        cheat.EspLibrary.icaca()
    end)
    ---
    espb:AddToggle('esprealnameoutline', {
        Text = 'name outline',
        Default = false,
        Callback = function(first)
            es.realname_outline = first
            cheat.EspLibrary.icaca()
        end
    }):AddColorPicker('esprealnameoutlinecolor',
        {
            Default = Color3.new(),
            Title = 'name outline color',
            Transparency = 0,
            Callback = function(Value)
                es.realname_outline_color = Value
                cheat.EspLibrary.icaca()
            end
        })

    ----------------------------------------------------------
    espb:AddToggle('espdistance', {
        Text = 'distance esp',
        Default = false,
        Callback = function(first)
            es.dist = first
            cheat.EspLibrary.icaca()
        end
    }):AddColorPicker('espdistancecolor',
        {
            Default = Color3.new(1, 1, 1),
            Title = 'distance color',
            Transparency = 0,
            Callback = function(Value)
                es.dist_color[1] = Value
                cheat.EspLibrary.icaca()
            end
        })
    espb:AddSlider('espdistancetransparency',
        { Text = 'distance transparency', Default = 0, Min = 0, Max = 1, Rounding = 1, Compact = false }):OnChanged(function(
        State)
        es.dist_color[2] = 1-State
        cheat.EspLibrary.icaca()
    end)
    ---
    espb:AddToggle('espdistanceoutline', {
        Text = 'distance outline',
        Default = false,
        Callback = function(first)
            es.dist_outline = first
            cheat.EspLibrary.icaca()
        end
    }):AddColorPicker('espdistanceoutlinecolor',
        {
            Default = Color3.new(),
            Title = 'distance outline color',
            Transparency = 0,
            Callback = function(Value)
                es.dist_outline_color = Value
                cheat.EspLibrary.icaca()
            end
        })
    ----------------------------------------------------------
    espb:AddToggle('espweapon', {
        Text = 'weapon esp',
        Default = false,
        Callback = function(first)
            es.weapon = first
            cheat.EspLibrary.icaca()
        end
    }):AddColorPicker('espweaponcolor',
        {
            Default = Color3.new(1, 1, 1),
            Title = 'weapon color',
            Transparency = 0,
            Callback = function(Value)
                es.weapon_color[1] = Value
                cheat.EspLibrary.icaca()
            end
        })
    espb:AddSlider('espweapontransparency',
        { Text = 'weapon transparency', Default = 0, Min = 0, Max = 1, Rounding = 1, Compact = false }):OnChanged(function(
        State)
        es.weapon_color[2] = 1-State
        cheat.EspLibrary.icaca()
    end)
    ---
    espb:AddToggle('espweaponoutline', {
        Text = 'weapon outline',
        Default = false,
        Callback = function(first)
            es.weapon_outline = first
            cheat.EspLibrary.icaca()
        end
    }):AddColorPicker('espweaponoutlinecolor',
        {
            Default = Color3.new(),
            Title = 'weapon outline color',
            Transparency = 0,
            Callback = function(Value)
                es.weapon_outline_color = Value
                cheat.EspLibrary.icaca()
            end
        })
    ----------------------------------------------------------
    espb:AddToggle('espskeleton', {Text = 'skeleton esp',Default = false,Callback = function(first)
        es.skeleton = first
        cheat.EspLibrary.icaca()
    end}):AddColorPicker('espskeletoncolor', {Default = Color3.new(1, 1, 1),Title = 'skeleton color',Transparency = 0,Callback = function(Value)
        es.skeleton_color[1] = Value
        cheat.EspLibrary.icaca()
    end})
    espb:AddSlider('espskeletontransparency', { Text = 'skeleton transparency', Default = 0, Min = 0, Max = 1, Rounding = 1, Compact = false }):OnChanged(function(State)
        es.skeleton_color[2] = 1-State
        cheat.EspLibrary.icaca()
    end)
    ----------------------------------------------------------
    espb:AddToggle('espchams', {
        Text = 'chams',
        Default = false,
        Callback = function(first)
            es.chams = first
            cheat.EspLibrary.icaca()
        end
    })
    espb:AddToggle('espchamsvisibleonly', {
        Text = 'chams visible only',
        Default = false,
        Callback = function(first)
            es.chams_visible_only = first
            cheat.EspLibrary.icaca()
        end
    })
    ---
    espb:AddLabel("chams fill color"):AddColorPicker('espchamsfillcolor',
        {
            Default = Color3.new(),
            Title = 'chams fill color',
            Transparency = 0,
            Callback = function(Value)
                es.chams_fill_color[1] = Value
                cheat.EspLibrary.icaca()
            end
        })
    espb:AddLabel("chams outline color"):AddColorPicker('espchamsoutlinecolor',
        {
            Default = Color3.new(),
            Title = 'chams outline color',
            Transparency = 0,
            Callback = function(Value)
                es.chamsoutline_color[1] = Value
                cheat.EspLibrary.icaca()
            end
        })
    ---
    espb:AddSlider('espchamsfilltransparency',
        { Text = 'fill transparency', Default = 0.5, Min = 0, Max = 1, Rounding = 1, Compact = false }):OnChanged(function(
        State)
        es.chams_fill_color[2] = State
        cheat.EspLibrary.icaca()
    end)
    espb:AddSlider('espchamsoutlinetransparency',
        { Text = 'outline transparency', Default = 0, Min = 0, Max = 1, Rounding = 1, Compact = false }):OnChanged(function(
        State)
        es.chamsoutline_color[2] = State
        cheat.EspLibrary.icaca()
    end)
    ----------------------------------------------------------
end
do
    local espb = ui.box.esp:AddTab("object esp")
    local es = cheat.EspLibrary.settings.object
    espb:AddDropdown('objectespfont', {Values = { 'UI', 'System', 'Plex', 'Monospace' },Default = 1,Multi = false,Text = 'esp font',Tooltip = 'select font',Callback = function(Value)
        cheat.EspLibrary.main_object_settings.textFont = Drawing.Fonts[Value]
        cheat.EspLibrary.icaca()
    end})
    espb:AddSlider('objectespfontsize', { Text = 'esp font size', Default = 13, Min = 1, Max = 30, Rounding = 0, Compact = true }):OnChanged(function(State)
        cheat.EspLibrary.main_object_settings.textSize = State
        cheat.EspLibrary.icaca()
    end)
    espb:AddDropdown('objectespallowed', {Values = {
        'ATV', 'Stone', 'Nitrate', 'Iron', 'Backpack',
        'Tree1', 'Tree2', 'Tree3', 'Tree4',
        'TeslaPylon', 'GasTrap', 'ClaimTotem'
    },Default = 0,Multi = true,Text = 'objects',Tooltip = 'select objects thats gonna show up',Callback = function(Value)
        cheat.EspLibrary.main_object_settings.allowed = Value
        cheat.EspLibrary.icaca()
    end})
    espb:AddToggle('objectespswitch', {
        Text = 'enable esp',
        Default = false,
        Callback = function(first)
            es.enabled = first
            cheat.EspLibrary.icaca()
        end
    })
    espb:AddToggle('objectesprealname', {
        Text = 'name esp',
        Default = false,
        Callback = function(first)
            es.realname = first
            cheat.EspLibrary.icaca()
        end
    }):AddColorPicker('objectesprealnamecolor',
        {
            Default = Color3.new(1, 1, 1),
            Title = 'name color',
            Transparency = 0,
            Callback = function(Value)
                es.realname_color[1] = Value
                cheat.EspLibrary.icaca()
            end
        })
    espb:AddSlider('objectesprealnametransparency',
        { Text = 'name transparency', Default = 0, Min = 0, Max = 1, Rounding = 1, Compact = false }):OnChanged(function(
        State)
        es.realname_color[2] = 1-State
        cheat.EspLibrary.icaca()
    end)
    espb:AddToggle('objectesprealnameoutline', {
        Text = 'name outline',
        Default = false,
        Callback = function(first)
            es.realname_outline = first
            cheat.EspLibrary.icaca()
        end
    }):AddColorPicker('objectesprealnameoutlinecolor',
        {
            Default = Color3.new(),
            Title = 'name outline color',
            Transparency = 0,
            Callback = function(Value)
                es.realname_outline_color = Value
                cheat.EspLibrary.icaca()
            end
        })
end
local canuseimages = pcall(function()
    cheat.utility.new_drawing("Image", {}):Remove()
end) and pcall(function()
    local a = cheat.utility.new_drawing("Image", {})
    rawget(a, "_frame").Image = ""
    a:Remove()
end)
do
    local enabled, dynamic = false, false;
    local color1, color2 = Color3.new(1,1,1), Color3.new();
    local watermarktab = ui.box.cheatvis:AddTab("watermark")
    local watermarktoggle = watermarktab:AddToggle('watermark_enabled', {Text = 'enabled',Default = false,Callback = function(first)
        enabled = first
    end})
    watermarktoggle:AddColorPicker('watermark_color1',{Default = Color3.new(),Title = canuseimages and 'color left' or 'color',Transparency = 0,Callback = function(Value)
        color1 = Value
        if not canuseimages then color2 = Value end
    end})
    if canuseimages then watermarktoggle:AddColorPicker('watermark_color2',{Default = Color3.new(),Title = 'color right',Transparency = 0,Callback = function(Value)
        color2 = Value
    end}); end
    watermarktab:AddToggle('watermark_rainbowcolor', {Text = 'rainbow',Default = false,Callback = function(first)
        dynamic = first
    end})
    local leftcolor, rightcolor, watertext = 
    Color3.new(0.000000, 0.666667, 0.333333), 
    Color3.new(0.349020, 0.000000, 1.000000),
    "swimhub.xyz canary | Jul 28 2024 | fps: 63 ";
    local waterpos = Vector2.new(10, 10);
    local text = cheat.utility.new_drawing("Text", {
        ZIndex = 4,
        Visible = true,
        Transparency = 1,
        Position = waterpos + Vector2.new(6, 5),
        Color = Color3.new(1, 1, 1),
        Outline = true,
        OutlineColor = Color3.new(),
        Font = 0,
        Size = 14,
        Text = watertext
    });
    local gradr, gradl = cheat.utility.new_drawing(canuseimages and "Image" or "Square", {
        ZIndex = 2,
        Visible = true,
        Transparency = 1,
        Position = waterpos,
        Size = Vector2.new(text.TextBounds.X + 10, text.TextBounds.Y + 10),
        Color = rightcolor
    }), cheat.utility.new_drawing(canuseimages and "Image" or "Square", {
        ZIndex = 2,
        Visible = true,
        Transparency = 1,
        Position = waterpos,
        Size = Vector2.new(text.TextBounds.X + 10, text.TextBounds.Y + 10),
        Color = leftcolor
    });
    local gradbackground = cheat.utility.new_drawing("Square", {
        ZIndex = 1,
        Visible = true,
        Transparency = 1,
        Position = waterpos,
        Size = Vector2.new(text.TextBounds.X + 10, text.TextBounds.Y + 10),
        Color = leftcolor:Lerp(rightcolor, 0.5),
        Filled = true
    });
    local textbackground = cheat.utility.new_drawing("Square", {
        ZIndex = 3,
        Visible = true,
        Transparency = 0.337,
        Position = waterpos + Vector2.new(2, 2),
        Size = Vector2.new(text.TextBounds.X + 6, text.TextBounds.Y + 6),
        Color = Color3.new(0,0,0),
        Filled = true,
        Thickness = 0,
    });
    if canuseimages then rawget(gradr, "_frame").Image = getcustomasset("swimhub/new/files/grad90r.png"); end
    if canuseimages then rawget(gradl, "_frame").Image = getcustomasset("swimhub/new/files/grad90l.png"); end
    local hue1, hue2, fpstimer, fps, finalfps = 0, 0.15, tick(), 0, 60;
    cheat.utility.new_renderstepped(LPH_JIT_MAX(function(delta)
        fps = fps + 1;
        if fpstimer + 1 <= tick() then
            fpstimer = tick();
            finalfps = fps;
            fps = 0;
        end;
        hue1, hue2 = tick() % 1, tick() % 1 + 0.15;
        if hue1 >= 1 then hue1 = 0 end if hue2 >= 1 then hue2 = 0 end
        rightcolor = dynamic and Color3.fromHSV(hue1, 1, 1) or color2;
        leftcolor = dynamic and Color3.fromHSV(hue2, 1, 1) or color1;
        watertext = ("swimhub %s | %s | %s | %s fps"):format(SWG_Version, SWG_ShortName, os.date("%b %d %Y"), tostring(finalfps));
        gradr.Color = rightcolor;
        gradl.Color = leftcolor;
        gradbackground.Color = gradr.Color:Lerp(gradl.Color, 0.5);
        textbackground.Size = Vector2.new(text.TextBounds.X + 7, text.TextBounds.Y + 6);
        textbackground.Position = waterpos + Vector2.new(2, 2);
        gradbackground.Size = Vector2.new(text.TextBounds.X + 11, text.TextBounds.Y + 10);
        gradbackground.Position = waterpos;
        gradl.Position = waterpos;
        gradl.Size = Vector2.new(text.TextBounds.X + 11, text.TextBounds.Y + 10);
        gradr.Position = waterpos;
        gradr.Size = Vector2.new(text.TextBounds.X + 11, text.TextBounds.Y + 10);
        text.Position = waterpos + Vector2.new(6, 5);
        text.Text = watertext;

        text.Visible = enabled;
        gradl.Visible = enabled;
        gradr.Visible = enabled;
        gradbackground.Visible = enabled;
        textbackground.Visible = enabled;
    end))
end

do
    local WorldTab = ui.box.world:AddTab("world visuals")
    local time = 12
    local timechanger = false
    WorldTab:AddToggle('enabletimechanger', {Text = 'enable time changer',Default = false,Callback = function(first)
        timechanger = first
    end})
    WorldTab:AddSlider('timechanger',{ Text = 'time changer', Default = mathround(Lighting.ClockTime), Min = 0, Max = 24, Rounding = 1, Compact = false }):OnChanged(function(State)
        time = State
    end)
    cheat.utility.new_heartbeat(function()
        if timechanger then
            Lighting.ClockTime = time
        end
    end)
end

do
    local cursor = {
        Enabled = false,
        CustomPos = false,
        Position = _Vector2new(0, 0),
        Speed = 5,
        Radius = 25,
        Color = Color3.fromRGB(180, 50, 255),
        Thickness = 1.7,
        Outline = false,
        Resize = false,
        Dot = false,
        Gap = 10,
        TheGap = false,
        Font = Drawing.Fonts.Monospace,
        Text = {
            Logo = false,
            LogoColor = Color3.new(1, 1, 1),
            Name = false,
            NameColor = Color3.new(1, 1, 1),
            LogoFadingOffset = 0,
        }
    }
    local CrosshairTab = ui.box.world:AddTab("crosshair")
    cursor.rainbow = false
    cursor.sussy = false
    CrosshairTab:AddDropdown('espfont', {Values = { 'UI', 'System', 'Plex', 'Monospace' },Default = 1,Multi = false,Text = 'esp font',Tooltip = 'select font',Callback = function(Value)
        cursor.Font = Drawing.Fonts[Value]
    end})
    CrosshairTab:AddToggle('crosshairenable', {Text = 'enable crosshair',Default = false,Callback = function(first)
        cursor.Enabled = first
    end}):AddColorPicker('crosshaircolor', {Default = Color3.new(1, 1, 1),Title = 'crosshair color',Transparency = 0,Callback = function(Value)
        cursor.Color = Value
    end})
    CrosshairTab:AddSlider('crosshairspeed', {Text = 'speed',Default = 3,Min = 0.1,Max = 15,Rounding = 1,Compact = true}):OnChanged(function(State)
        cursor.Speed = State / 10
    end)
    CrosshairTab:AddSlider('crosshairradius', {Text = 'radius',Default = 25,Min = 0.1,Max = 100,Rounding = 1,Compact = true,}):OnChanged(function(State)
        cursor.Radius = State
    end)
    CrosshairTab:AddSlider('crosshairthickness', {Text = 'thickness',Default = 1.5,Min = 0.1,Max = 10,Rounding = 1,Compact = true,}):OnChanged(function(State)
        cursor.Thickness = State
    end)
    CrosshairTab:AddSlider('crosshairgapsize', {Text = 'gap',Default = 5,Min = 0,Max = 50,Rounding = 1,Compact = true,}):OnChanged(function(State)
        cursor.Gap = State
    end)
    CrosshairTab:AddToggle('crosshairenablegap', {Text = 'math divide gap',Default = false,Callback = function(first)
        cursor.TheGap = first
    end})
    CrosshairTab:AddToggle('crosshairenableoutline', {Text = 'outline',Default = false,Callback = function(first)
        cursor.Outline = first
    end})
    CrosshairTab:AddToggle('crosshairenableresize', {Text = 'resize animation',Default = false,Callback = function(first)
        cursor.Resize = first
    end})
    CrosshairTab:AddToggle('crosshairenabledot', {Text = 'dot',Default = false,Callback = function(first)
        cursor.Dot = first
    end})
    CrosshairTab:AddToggle('crosshairenablenazi', {Text = 'sussy',Default = false,Callback = function(first)
        cursor.sussy = first
        end})
        CrosshairTab:AddToggle('crosshairenablefaggot', {Text = 'rainbow',Default = false,Callback = function(first)
        cursor.rainbow = first
    end})
    CrosshairTab:AddToggle('crosshairtextLogo', {Text = 'text logo',Default = false,Callback = function(first)
        cursor.Text.Logo = first
    end}):AddColorPicker('crosshairlogocolor', {Default = Color3.new(1, 1, 1),Title = 'logo color',Transparency = 0,Callback = function(Value)
        cursor.Text.LogoColor = Value
    end})
    CrosshairTab:AddToggle('crosshairtextName', {Text = 'text name',Default = false,Callback = function(first)
        cursor.Text.Name = first
    end}):AddColorPicker('crosshairtextcolor', {Default = Color3.new(1, 1, 1),Title = 'text color',Transparency = 0,Callback = function(Value)
        cursor.Text.NameColor = Value
    end})
    CrosshairTab:AddSlider('crosshairlogooffset', {Text = 'logo fade offset',Default = 0,Min = 0,Max = 5,Rounding = 1,Compact = true}):OnChanged(function(State)
        cursor.Text.LogoFadingOffset = State
    end)

    -- // Initilisation
    local lines = {}
    -- // Drawings
    local outline = cheat.utility.new_drawing("Square", {
        Visible = true,
        Size = _Vector2new(4, 4),
        Color = Color3.fromRGB(0, 0, 0),
        Filled = true,
        ZIndex = 1,
        Transparency = 1
    })
    --
    local dot = cheat.utility.new_drawing("Square", {
        Visible = true,
        Size = _Vector2new(2, 2),
        Color = cursor.Color,
        Filled = true,
        ZIndex = 2,
        Transparency = 1
    })
    --
    local logotext = cheat.utility.new_drawing("Text", {
        Visible = false,
        Font = cursor.Font,
        Size = 13,
        Color = Color3.fromRGB(138, 128, 255),
        ZIndex = 3,
        Transparency = 1,
        Text = "swimhub.xyz",
        Center = true,
        Outline = true,
    })
    for i = 1, 4 do
        local line_outline = cheat.utility.new_drawing("Line", {
            Visible = true,
            From = _Vector2new(200, 500),
            To = _Vector2new(200, 500),
            Color = Color3.fromRGB(0, 0, 0),
            Thickness = cursor.Thickness + 2.5,
            ZIndex = 1,
            Transparency = 1
        })
        local line = cheat.utility.new_drawing("Line", {
            Visible = true,
            From = _Vector2new(200, 500),
            To = _Vector2new(200, 500),
            Color = cursor.Color,
            Thickness = cursor.Thickness,
            ZIndex = 2,
            Transparency = 1
        })
        local naziline = cheat.utility.new_drawing("Line", {
            Visible = true,
            From = _Vector2new(200, 500),
            To = _Vector2new(200, 500),
            Color = cursor.Color,
            Thickness = cursor.Thickness,
            ZIndex = 2,
            Transparency = 1
        })
        lines[i] = { line, line_outline, naziline }
    end
    local angle = 0
    local transp = 0
    local reverse = false
    local function setreverse(value)
        if reverse ~= value then
            reverse = value
        end
    end
    --
    local pos, rainbow, rotationdegree, color = Vector2.zero, 0, 0, Color3.new()
    local math_cos, math_atan, math_pi, math_sin = math.cos, math.atan, math.pi, math.sin
    local function DEG2RAD(x) return x * math_pi / 180 end
    local function RAD2DEG(x) return x * 180 / math_pi end
    cheat.utility.new_renderstepped(LPH_NO_VIRTUALIZE(function(delta)
        if cursor.Enabled then
            rainbow = rainbow + (delta * 0.5)
            if rainbow > 1.0 then rainbow = 0.0 end
            color = Color3.fromHSV(rainbow, 1, 1)
            if cursor.CustomPos then pos = cursor.Position else pos = _Vector2new(
                Mouse.X,
                Mouse.Y + GuiInset.Y) end
            if cursor.rainbow then color = Color3.fromHSV(rainbow, 1, 1) else color = cursor.Color end
            if transp <= 1.5 + cursor.Text.LogoFadingOffset and not reverse then
                transp = transp + (((cursor.Speed == 0 and 1 or cursor.Speed) * 10) * delta)
                if transp >= 1.5 + cursor.Text.LogoFadingOffset then setreverse(true) end
            elseif reverse then
                transp = transp - (((cursor.Speed == 0 and 1 or cursor.Speed) * 10) * delta)
                if transp <= 0 - cursor.Text.LogoFadingOffset then setreverse(false) end
            end
            logotext.Position = _Vector2new(pos.X, (pos + _Vector2new(0, cursor.Radius + 5)).Y)
            logotext.Transparency = transp
            logotext.Visible = cursor.Text.Logo
            logotext.Color = cursor.Text.LogoColor
            logotext.Font = cursor.Font

            if cursor.sussy then
                local frametime = delta
                local a = cursor.Radius - 10
                local gamma = math_atan(a / a)

                if rotationdegree >= 90 then rotationdegree = 0 end

                for i = 1, 4 do
                    local p_0 = (a * math_sin(DEG2RAD(rotationdegree + (i * 90))))
                    local p_1 = (a * math_cos(DEG2RAD(rotationdegree + (i * 90))))
                    local p_2 = ((a / math_cos(gamma)) * math_sin(DEG2RAD(rotationdegree + (i * 90) + RAD2DEG(gamma))))
                    local p_3 = ((a / math_cos(gamma)) * math_cos(DEG2RAD(rotationdegree + (i * 90) + RAD2DEG(gamma))))


                    lines[i][1].From = _Vector2new(pos.X, pos.Y)
                    lines[i][1].To = _Vector2new(pos.X + p_0, pos.Y - p_1)
                    lines[i][1].Color = color
                    lines[i][1].Thickness = cursor.Thickness
                    lines[i][1].Visible = true
                    lines[i][3].From = _Vector2new(pos.X + p_0, pos.Y - p_1)
                    lines[i][3].To = _Vector2new(pos.X + p_2, pos.Y - p_3)
                    lines[i][3].Color = color
                    lines[i][3].Thickness = cursor.Thickness
                    lines[i][3].Visible = true
                end
                rotationdegree = rotationdegree + ((cursor.Speed * frametime) * 1000)
            else
                angle = (cursor.Speed == 0 and 0 or angle + ((cursor.Speed * 10) * delta))

                if angle >= 90 then
                    angle = 0
                end

                --
                dot.Visible = cursor.Dot
                dot.Color = color
                dot.Position = _Vector2new(pos.X - 1, pos.Y - 1)
                --
                outline.Visible = cursor.Outline and cursor.Dot
                outline.Position = _Vector2new(pos.X - 2, pos.Y - 2)
                --

                --
                for index, line in pairs(lines) do
                    index = index
                    local x, y = {}, {}
                    local x1, y1 = {}, {}
                    if cursor.Resize then
                        x = { pos.X +
                        (math.cos(angle + (index * (math.pi / 2))) * (cursor.Radius + ((cursor.Radius * math.sin(angle)) / 9))),
                            pos.X +
                            (math.cos(angle + (index * (math.pi / 2))) * ((cursor.Radius - 20) - (cursor.TheGap and (((cursor.Radius - 20) * math.cos(angle)) / 4) or (((cursor.Radius - 20) * math.cos(angle)) - 4)))) }
                        y = { pos.Y +
                        (math.sin(angle + (index * (math.pi / 2))) * (cursor.Radius + ((cursor.Radius * math.sin(angle)) / 9))),
                            pos.Y +
                            (math.sin(angle + (index * (math.pi / 2))) * ((cursor.Radius - 20) - (cursor.TheGap and (((cursor.Radius - 20) * math.cos(angle)) / 4) or (((cursor.Radius - 20) * math.cos(angle)) - 4)))) }
                        x1 = { pos.X + (math.cos(angle + (index * (math.pi / 2))) * (cursor.Radius + 1)), pos
                        .X +
                        (math.cos(angle + (index * (math.pi / 2))) * ((cursor.Radius - 20 + 1) - (cursor.TheGap and ((cursor.Radius - 20 + 1) / cursor.Gap) or ((cursor.Radius - 20 + 1) - cursor.Gap)))) }
                        y1 = { pos.Y + (math.sin(angle + (index * (math.pi / 2))) * (cursor.Radius + 1)), pos
                        .Y +
                        (math.sin(angle + (index * (math.pi / 2))) * ((cursor.Radius - 20 + 1) - (cursor.TheGap and ((cursor.Radius - 20 + 1) / cursor.Gap) or ((cursor.Radius - 20 + 1) - cursor.Gap)))) }
                    else
                        x = { pos.X + (math.cos(angle + (index * (math.pi / 2))) * (cursor.Radius)), pos.X +
                        (math.cos(angle + (index * (math.pi / 2))) * ((cursor.Radius - 20) - (cursor.TheGap and ((cursor.Radius - 20) / cursor.Gap) or ((cursor.Radius - 20) - cursor.Gap)))) }
                        y = { pos.Y + (math.sin(angle + (index * (math.pi / 2))) * (cursor.Radius)), pos.Y +
                        (math.sin(angle + (index * (math.pi / 2))) * ((cursor.Radius - 20) - (cursor.TheGap and ((cursor.Radius - 20) / cursor.Gap) or ((cursor.Radius - 20) - cursor.Gap)))) }
                        x1 = { pos.X + (math.cos(angle + (index * (math.pi / 2))) * (cursor.Radius + 1)), pos
                        .X +
                        (math.cos(angle + (index * (math.pi / 2))) * ((cursor.Radius - 20 + 1) - (cursor.TheGap and ((cursor.Radius - 20 + 1) / cursor.Gap) or ((cursor.Radius - 20 + 1) - cursor.Gap)))) }
                        y1 = { _Vector2new(pos.Y + (math.sin(angle + (index * (math.pi / 2))) * (cursor.Radius + 1)), pos
                        .Y +
                        (math.sin(angle + (index * (math.pi / 2))) * ((cursor.Radius - 20 + 1) - (cursor.TheGap and ((cursor.Radius - 20 + 1) / cursor.Gap) or ((cursor.Radius - 20 + 1) - cursor.Gap))))) }
                    end
                    --
                    line[1].Visible = true
                    line[1].Color = color
                    line[1].From = _Vector2new(x[2], y[2])
                    line[1].To = _Vector2new(x[1], y[1])
                    line[1].Thickness = cursor.Thickness
                    --
                    line[2].Visible = cursor.Outline
                    line[2].From = _Vector2new(x1[2], y1[2])
                    line[2].To = _Vector2new(x1[1], y1[1])
                    line[2].Thickness = cursor.Thickness + 2.5

                    line[3].Visible = false
                end
            end
        else
            dot.Visible = false
            outline.Visible = false
            logotext.Visible = false
            --
            for index, line in pairs(lines) do
                line[1].Visible = false
                line[2].Visible = false
                line[3].Visible = false
            end
        end
    end))
end

do
    local mvb = ui.box.move:AddTab('speedhack')
    local bhop_enabled, bhop_silent, bhop_silent_enabled, speed = false, false, false, 55
    local downcliff_mode, downcliff_start, downcliff_speed, downcliff_accel, downcliff_fall = false, 50, 150, 50, 50
    local jetpackabuse, abuseupspeed, abusedownspeed = false, 55, 0
    local forcesprint = false
    local slidin = false
    mvb:AddToggle('speedhack_forcesprint', {Text = 'forcesprint',Default = false,Callback = function(first)
        forcesprint = first
    end})
    mvb:AddToggle('jetpackabuse', {Text = 'jetpack abuse',Default = false,Callback = function(first)
        jetpackabuse = first
    end}):AddKeyPicker('jetpackabuse_bind', {Default = 'None',SyncToggleState = true,Mode = 'Toggle',Text = 'jetpack abuse',NoUI = false})
    mvb:AddSlider('jetpackabuse_upspeed',{ Text = 'up speed', Default = 55, Min = 10, Max = 500, Rounding = 0, Suffix = "sps", Compact = false }):OnChanged(function(State)
        abuseupspeed = State
    end)
    mvb:AddSlider('jetpackabuse_downspeed',{ Text = 'down speed', Default = 55, Min = 10, Max = 500, Rounding = 0, Suffix = "sps", Compact = false }):OnChanged(function(State)
        abusedownspeed = State
    end)
    mvb:AddLabel("hold space to go up")
    mvb:AddLabel("hold shift to go down")
    
    mvb:AddToggle('speedhack_enabled', {Text = 'speedhack enabled',Default = false,Callback = function(first)
        bhop_enabled = first
    end})
    mvb:AddToggle('speedhack_silent', {Text = 'silent speed',Default = false,Callback = function(first)
        bhop_silent = first
    end}):AddKeyPicker('speedhack_silentbind', {Default = 'None',SyncToggleState = false,Mode = 'Toggle',Text = 'silent speed',NoUI = false,Callback=function(first)
        bhop_silent_enabled = first
        if slidin then
            trident.tcp:FireServer(3, false)
            trident.tcp:FireServer(2, false)
            slidin = false
        end
    end})
    mvb:AddSlider('speedhack_speed',{ Text = 'speed', Default = 55, Min = 55, Max = 70, Rounding = 0, Suffix = "sps", Compact = false }):OnChanged(function(State)
        speed = State
    end)
    mvb:AddLabel("hold shift and C to speed")
    mvb:AddToggle('downcliff_mode',{ Text = 'downcliff mode',Default = false,Callback = function(first)
        downcliff_mode = first
    end})
    mvb:AddSlider('downcliff_accel',{ Text = 'acceleration', Default = 55, Min = 1, Max = 250, Rounding = 0, Suffix = "sps", Compact = false }):OnChanged(function(State)
        downcliff_accel = State
    end)
    mvb:AddSlider('downcliff_fall',{ Text = 'fall speed', Default = 55, Min = 10, Max = 200, Rounding = 0, Suffix = "sps", Compact = false }):OnChanged(function(State)
        downcliff_fall = State
    end)
    mvb:AddLabel("hold space to go up")
    
    local niga, wtf = speed, 0
    local nigasilent, wtfsilent, heightdeviationsilent = speed, 0, 6
    local dc_buildup = downcliff_speed
    local middle = workspace.Const.Ignore.LocalCharacter.Middle
    local bottom = workspace.Const.Ignore.LocalCharacter.Bottom
    local top = workspace.Const.Ignore.LocalCharacter.Top
    local oldtick = tick()
    cheat.utility.new_heartbeat(LPH_JIT_MAX(function(delta)
        if bhop_enabled and bhop_silent and bhop_silent_enabled and middle then

            local cameralook = Camera.CFrame.LookVector
            local direction = Vector3.zero
            cameralook = _Vector3new(cameralook.X, 0, cameralook.Z)
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.W) and direction + cameralook or direction;
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.S) and direction - cameralook or direction;
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.D) and direction + _Vector3new(- cameralook.Z, 0, cameralook.X) or direction;
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.A) and direction + _Vector3new(cameralook.Z, 0, - cameralook.X) or direction;
            if direction ~= Vector3.zero then direction = direction.Unit end

            if heightdeviationsilent > 0 then
                nigasilent = math.clamp(nigasilent-delta*20, 17, speed)
            else
                nigasilent = math.clamp(nigasilent-delta*150, 17, speed)
            end
            heightdeviationsilent = wtfsilent < 0.85 and 6 or math.clamp(heightdeviationsilent-delta*15, 0, 6)
            if wtfsilent == 0 then
                trident.tcp:FireServer(3, true, Vector3.xAxis)
                trident.tcp:FireServer(2, true)
                slidin = true
                nigasilent = speed
            end

            local oldmdcf, oldbmcf, oldtpcf = middle.CFrame, bottom.CFrame, top.CFrame
            middle.CFrame = oldmdcf + _Vector3new(0, heightdeviationsilent, 0)
            bottom.CFrame = oldbmcf + _Vector3new(0, heightdeviationsilent, 0)
            top.CFrame = oldtpcf + _Vector3new(0, heightdeviationsilent, 0)
            RunService.RenderStepped:Wait()
            if middle then
                middle.CFrame = oldmdcf
                bottom.CFrame = oldbmcf
                top.CFrame = oldtpcf
                middle.AssemblyLinearVelocity = direction * nigasilent
                top.AssemblyLinearVelocity = direction * nigasilent
                bottom.AssemblyLinearVelocity = direction * nigasilent
            end

            wtfsilent = wtfsilent + delta

            if wtfsilent > 1.5 then
                trident.tcp:FireServer(3, false)
                trident.tcp:FireServer(2, false)
                slidin = false
                wtfsilent = 0
            end
        else
            nigasilent = speed
            wtfsilent = 0
            heightdeviationsilent = 6
        end
    end))
    cheat.utility.new_renderstepped(LPH_JIT_MAX(function(delta)
        local shiftpressed = _IsKeyDown(UserInputService, Enum.KeyCode.LeftShift)
        local cpressed = _IsKeyDown(UserInputService, Enum.KeyCode.C)
        local spacedown = _IsKeyDown(UserInputService, Enum.KeyCode.Space)
        local direction if middle and (cpressed or spacedown or shiftpressed or forcesprint or jetpackabuse) then
            local cameralook = Camera.CFrame.LookVector
            cameralook = _Vector3new(cameralook.X, 0, cameralook.Z)
            direction = Vector3.zero
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.W) and direction + cameralook or direction;
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.S) and direction - cameralook or direction;
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.D) and direction + _Vector3new(- cameralook.Z, 0, cameralook.X) or direction;
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.A) and direction + _Vector3new(cameralook.Z, 0, - cameralook.X) or direction;
        end
        if bhop_silent then return end
        if bhop_enabled and not downcliff_mode and middle and cpressed and shiftpressed then
            if not (direction == Vector3.zero) then
                direction = direction.Unit
            end
            niga = math.clamp(niga-delta*20, 17, speed)
            if wtf == 0 then
                local tpcf, mdcf, bmcf = top.CFrame, middle.CFrame, bottom.CFrame
                middle.CFrame = mdcf + _Vector3new(0, 6, 0)
                bottom.CFrame = bmcf + _Vector3new(0, 6, 0)
                top.CFrame = tpcf + _Vector3new(0, 6, 0)
            end
            middle.AssemblyLinearVelocity = _Vector3new(
                direction.X * niga,
                wtf < 0.85 and 0 or -7,
                direction.Z * niga
            )
            bottom.AssemblyLinearVelocity = _Vector3new(
                direction.X * niga,
                wtf < 0.85 and 0 or -7,
                direction.Z * niga
            )
            top.AssemblyLinearVelocity = _Vector3new(
                direction.X * niga,
                wtf < 0.85 and 0 or -7,
                direction.Z * niga
            )
            wtf = wtf + delta
        elseif bhop_enabled and downcliff_mode and middle and cpressed and shiftpressed then
            if not (direction == Vector3.zero) then
                direction = direction.Unit
            end
            if spacedown and wtf == 0 then
                local tpcf, mdcf, bmcf = top.CFrame, middle.CFrame, bottom.CFrame
                middle.CFrame = mdcf + _Vector3new(0, 6, 0)
                bottom.CFrame = bmcf + _Vector3new(0, 6, 0)
                top.CFrame = tpcf + _Vector3new(0, 6, 0)
                wtf = wtf + delta
            end
            dc_buildup = math.clamp(spacedown and dc_buildup-delta*25 or dc_buildup+delta*downcliff_accel, 17, 250)
            middle.AssemblyLinearVelocity = _Vector3new(
                direction.X * dc_buildup,
                spacedown and -7 or -downcliff_fall,
                direction.Z * dc_buildup
            )
            bottom.AssemblyLinearVelocity = _Vector3new(
                direction.X * dc_buildup,
                spacedown and -7 or -downcliff_fall,
                direction.Z * dc_buildup
            )
            top.AssemblyLinearVelocity = _Vector3new(
                direction.X * dc_buildup,
                spacedown and -7 or -downcliff_fall,
                direction.Z * dc_buildup
            )
        elseif jetpackabuse and middle then
            if not (direction == Vector3.zero) then
                direction = direction.Unit
            end
            local yvelo = spacedown and abuseupspeed or shiftpressed and -abusedownspeed or (not shiftpressed and not spacedown) and 0
            middle.AssemblyLinearVelocity = _Vector3new(
                direction.X * 18,
                yvelo,
                direction.Z * 18
            )
            top.AssemblyLinearVelocity = _Vector3new(
                direction.X * 18,
                yvelo,
                direction.Z * 18
            )
            bottom.AssemblyLinearVelocity = _Vector3new(
                direction.X * 18,
                yvelo,
                direction.Z * 18
            )
        else
            if forcesprint and middle then
                if not (direction == Vector3.zero) then
                    direction = direction.Unit
                end
                middle.AssemblyLinearVelocity = _Vector3new(
                    direction.X * 18,
                    middle.AssemblyLinearVelocity.Y,
                    direction.Z * 18
                )
            end
            niga = speed
            dc_buildup = 55
            wtf = 0
        end
    end))
end

do
    local mvb = ui.box.move:AddTab('exploits')
    local enabled, speed = false, 55
    local fakecrouch_timer = tick()
    mvb:AddToggle('fakecrouch', {Text = 'fake crouch',Default = false,Callback = function(first)
        aimbot.silentwalk = first
    end}):AddKeyPicker('silentwalk_bind', {Default = 'None',SyncToggleState = true,Mode = 'Toggle',Text = 'fake crouch',NoUI = false})
    mvb:AddToggle('longneck', {Text = 'long neck',Default = false,Callback = function(first)
        top.Prism1.CFrame = first and originalprismcframe - Vector3.yAxis * 5 or originalprismcframe
    end}):AddKeyPicker('longneck_bind', {Default = 'None',SyncToggleState = true,Mode = 'Toggle',Text = 'long neck',NoUI = false})
    local freecamoffset = Vector3.zero
    local middle = workspace.Const.Ignore.LocalCharacter.Middle
    local bottom = workspace.Const.Ignore.LocalCharacter.Bottom
    local top = workspace.Const.Ignore.LocalCharacter.Top
    local mdpos, bmpos, tppos = middle.CFrame, bottom.CFrame, top.CFrame
    mvb:AddToggle('freecam_enabled', {Text = 'freecam enabled',Default = false,Callback = function(first)
        enabled = first
        middle.CanCollide = not first
        bottom.CanCollide = not first
        top.CanCollide = not first
    end}):AddKeyPicker('freecam_bind', {Default = 'None',SyncToggleState = true,Mode = 'Toggle',Text = 'freecam',NoUI = false})
    mvb:AddSlider('freecam_speed',{ Text = 'speed', Default = 10, Min = 1, Max = 150, Rounding = 0, Suffix = "sps", Compact = false }):OnChanged(function(State)
        speed = State
    end)
    mvb:AddDropdown('freecam_part', {Values={"middle", "bottom", "top"},Default = 1,Multi = false,Text = 'freecam part',Callback=function(Value)
        part = Value
    end})
    cheat.utility.new_heartbeat(LPH_JIT_MAX(function(delta)
        if enabled and middle then
            if part == "middle" then middle.CFrame = mdpos end
            if part == "bottom" then bottom.CFrame = bmpos end
            if part == "top" then top.CFrame = tppos end
            RunService.RenderStepped:Wait()
            if middle then
                local cameralook = Camera.CFrame.LookVector
                local direction = Vector3.zero
                direction = _IsKeyDown(UserInputService, Enum.KeyCode.W) and direction + cameralook or direction;
                direction = _IsKeyDown(UserInputService, Enum.KeyCode.S) and direction - cameralook or direction;
                direction = _IsKeyDown(UserInputService, Enum.KeyCode.D) and direction + _Vector3new(- cameralook.Z, 0, cameralook.X) or direction;
                direction = _IsKeyDown(UserInputService, Enum.KeyCode.A) and direction + _Vector3new(cameralook.Z, 0, - cameralook.X) or direction;
                if not direction == Vector3.zero then
                    direction = direction.Unit
                end
                freecamoffset = freecamoffset + (direction * delta * speed)
                if part == "middle" then middle.CFrame = mdpos + freecamoffset end
                if part == "bottom" then bottom.CFrame = bmpos + freecamoffset end
                if part == "top" then top.CFrame = tppos + freecamoffset end
                middle.AssemblyLinearVelocity = Vector3.zero
                bottom.AssemblyLinearVelocity = Vector3.zero
                top.AssemblyLinearVelocity = Vector3.zero
            end
        elseif middle then
            freecamoffset = Vector3.zero
            mdpos, bmpos, tppos = middle.CFrame, bottom.CFrame, top.CFrame
        end
    end))
end

do
    local mvb = ui.box.atvfly:AddTab('atv fly')
    local carfly_enabled, speed, accel, upspeed = false, 55, 100, 15
    mvb:AddToggle('carfly_enabled', {Text = 'car fly enabled',Default = false,Callback = function(first)
        carfly_enabled = first
    end}):AddKeyPicker('carfly_bind', {Default = 'None',SyncToggleState = true,Mode = 'Toggle',Text = 'car fly',NoUI = false})
    mvb:AddSlider('carfly_speed',{ Text = 'speed', Default = 150, Min = 50, Max = 300, Rounding = 0, Suffix = "sps", Compact = false }):OnChanged(function(State)
        speed = State
    end)
    mvb:AddSlider('carfly_upspeed',{ Text = 'up speed', Default = 15, Min = 5, Max = 100, Rounding = 0, Suffix = "sps", Compact = false }):OnChanged(function(State)
        upspeed = State
    end)
    mvb:AddSlider('carfly_accel',{ Text = 'acceleration', Default = 100, Min = 10, Max = 300, Rounding = 0, Suffix = "sps", Compact = false }):OnChanged(function(State)
        accel = State
    end)
    mvb:AddLabel("hold V to go up")
    mvb:AddLabel("hold B to go down")
    local car, dist = nil, 50
    local findcar = function()
        car, dist = nil, 50
        for i,v in pairs(workspace:GetChildren()) do
            if v:FindFirstChild("Seat") and v:FindFirstChild("Frame") then
                if (v.Frame.Position - trident.middlepart.Position).Magnitude < dist then
                    car = v
                    dist = (v.Frame.Position - trident.middlepart.Position).Magnitude
                end
            end
        end
    end
    findcar()
    local buildup = 0
    local lastdir = _Vector3new(1,0,0)
    cheat.utility.new_renderstepped(LPH_JIT_MAX(function(delta)
        if carfly_enabled and car and car:FindFirstChild("Frame") and (car.Frame.CFrame.p - Camera.CFrame.p).Magnitude <= 50 then
            local cameralook = Camera.CFrame.LookVector
            cameralook = _Vector3new(cameralook.X, 0, cameralook.Z)
            local direction = Vector3.zero
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.W) and direction + cameralook or direction;
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.S) and direction - cameralook or direction;
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.D) and direction + _Vector3new(- cameralook.Z, 0, cameralook.X) or direction;
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.A) and direction + _Vector3new(cameralook.Z, 0, - cameralook.X) or direction;
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.V) and direction + Vector3.yAxis or direction;
            direction = _IsKeyDown(UserInputService, Enum.KeyCode.B) and direction - Vector3.yAxis or direction;
            if direction ~= Vector3.zero then
                direction = direction.Unit
                if direction ~= Vector3.yAxis and -direction ~= Vector3.yAxis then
                    buildup = math.clamp(buildup + delta * accel, 0, speed)
                    lastdir = direction
                end
            else
                direction = lastdir
                buildup = math.clamp(buildup - delta * 150, 0, speed)
            end
            for i,v in pairs(car:GetChildren()) do
                v.AssemblyLinearVelocity = _Vector3new(direction.X * buildup, direction.Y * upspeed, direction.Z * buildup)
                --v.AssemblyLinearVelocity = direction * SPEED + _Vector3new(0, 0.05, 0)
                --v.CFrame = _CFramenew(v.CFrame.Position) * CFrame.Angles(0, y+(math.pi/2), 0)
            end
        elseif not car or car and car:FindFirstChild("Frame") and (car.Frame.CFrame.p - Camera.CFrame.p).Magnitude > 50 then
            findcar()
            buildup = 0
        else
            buildup = 0
        end
    end))
end

ui.box.themeconfig:AddToggle('keybindshoww', {Text = 'show keybinds',Default = false,Callback = function(first)cheat.Library.KeybindFrame.Visible = first end})
cheat.ThemeManager:SetOptionsTEMP(cheat.Options, cheat.Toggles)
cheat.SaveManager:SetOptionsTEMP(cheat.Options, cheat.Toggles)
cheat.ThemeManager:SetLibrary(cheat.Library)
cheat.SaveManager:SetLibrary(cheat.Library)
cheat.SaveManager:IgnoreThemeSettings()
cheat.ThemeManager:SetFolder('Lebyss.xys')
cheat.SaveManager:SetFolder('Lebyss.xys')
cheat.SaveManager:BuildConfigSection(ui.tabs.config)
cheat.ThemeManager:ApplyToGroupbox(ui.box.themeconfig)

cheat.EspLibrary.load()

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
    textLabel.Text = "Lebyss.xys Premium 30d"
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
