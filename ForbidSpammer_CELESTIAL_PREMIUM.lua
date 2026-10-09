local players = game:GetService("Players")
local badgeService = game:GetService("BadgeService")
local lighting = game:GetService("Lighting")
local runService = game:GetService("RunService")
local virtualUser = game:GetService("VirtualUser")
local coreGui = game:GetService("CoreGui")
local tweenService = game:GetService("TweenService")
local textChatService = game:GetService("TextChatService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local userInputService = game:GetService("UserInputService")
local localPlayer = players.LocalPlayer
_G.AntiBanEnabled = true

task.spawn(function()
  local localPlayer2 = players.LocalPlayer
  local v1, v2, v3, v4, f1, f2

  if game.PlaceId ~= 4924922222 then
    return
  else
    v1 = {
      [3104358] = { Rank = 200, Name = "Voldex (Brookhaven Group)" },
      [857] = { Rank = 200, Name = "Voldex Corporate Hub" },
      [2840742] = { Rank = 200, Name = "Legacy Wolfpaq Studio" },
      [1200769] = { Rank = 1, Name = "Official Roblox Staff Admin" },
      [2868472] = { Rank = 1, Name = "Official Roblox QA Team" },
      [3059674] = { Rank = 1, Name = "Official Roblox Intern Team" },
    }

    v2 = { "Official Roblox Administrator Site-Badge" }

    v3 = {
      [6059369] = "Wolfpaq (Original Brookhaven Creator)",
      [16738992] = "Aidanleewolf (Brookhaven Co-Creator)",
    }

    v4 = {
      "ban hammer", "banhammer", "server controller", "mod menu", "admin panel", "ban stick",
    }

    function f1(p1, p2, p3, p4)
      if not _G.AntiBanEnabled then
        return
      end

      localPlayer2:Kick((string.format(
        "\n[!] FORBIDMUSIC CODENAME: SHIELD ACTIVE\n==============================================\n🚨 THREAT NEUTRALIZED BY FORB1D🔥 🚨\n==============================================\n• Detected Target : %s\n• Target UserID   : %d\n• Breach Layer    : %s\n• Core Reason     : %s\n==============================================\nACTION TAKEN: Emergency Account Disconnect Issued.\n👉 Recommendation: Avoid this server for 30+ mins.\n🗿 SYSTEM REINFORCED UPON EXECUTION.",
        p1, p2, p4, p3
      )))
    end

    function f2(p5, p6)
      local v5 = string.lower(p5.Name)

      for index, value in ipairs(v4) do
        if string.find(v5, value) then
          local v6 = v3[p6.UserId] ~= nil

          if not v6 then
            for key, value2 in pairs(v1) do
              local v7 = key
              local v8, v9 = pcall(function() return p6:GetRankInGroup(v7) end)

              if v8 and v9 >= value2.Rank then
                v6 = true
                break
              end
            end
          end

          if v6 or p5:FindFirstChildWhichIsA("Script") and v5 == "banhammer" then
            f1(
              p6.Name, p6.UserId, "Wielding Verified High-Risk Admin Item: " .. p5.Name,
              "LAYER 3 (Physical Inventory)"
            )
          else
            warn("🚨 FORBID RADAR: Blocked false kick attempt! User " .. p6.Name
              .. " is spoofing item: " .. p5.Name)
          end
        end
      end
    end

    local function f3(value3)
      if not _G.AntiBanEnabled or value3 == localPlayer2 then
        return
      elseif v3[value3.UserId] then
        f1(
          value3.Name, value3.UserId, "Blacklisted Identity Match: " .. v3[value3.UserId],
          "LAYER 1A (Static DB)"
        )

        return
      else
        for key2, value4 in pairs(v1) do
          local v10 = key2
          local v11 = value4

          task.defer(function()
            local v12, v13 = pcall(function() return value3:GetRankInGroup(v10) end)

            if v12 and v13 >= v11.Rank then
              f1(
                value3.Name, value3.UserId,
                "Rank " .. v13 .. " found in Restricted Group: " .. v11.Name,
                "LAYER 1B (Network Group Scan)"
              )
            end
          end)
        end

        for key3, value5 in pairs(v2) do
          local v14 = key3
          local v15 = value5

          task.defer(function()
            local v16, v17 = pcall(function()
              return badgeService:UserHasBadgeAsync(value3.UserId, v14)
            end)

            if v16 and v17 then
              f1(
                value3.Name, value3.UserId,
                "Possesses Administrative Site Credentials (" .. v15 .. ")",
                "LAYER 1C (Credential Audit)"
              )
            end
          end)
        end

        task.spawn(function()
          value3.ChildAdded:Connect(function(child) end)

          for index2, value6 in ipairs(value3:GetChildren()) do
          end
        end)

        local function f4(character)
          character.ChildAdded:Connect(function(child2)
            if child2:IsA("Tool") then
              f2(child2, value3)
            end
          end)

          for index3, value7 in ipairs(character:GetChildren()) do
            if value7:IsA("Tool") then
              f2(value7, value3)
            end
          end
        end

        if value3.Character then
          f4(value3.Character)
        end

        value3.CharacterAdded:Connect(f4)
        return
      end
    end

    for index4, value8 in ipairs(players:GetPlayers()) do
      f3(value8)
    end

    players.PlayerAdded:Connect(f3)
    warn("⚡ [FORBIDSPAM]: APEX ZERO-TRUST ANTI-BAN V9 TITANIUM ACTIVE.")
    return
  end
end)

task.spawn(function()
  local function f5()
    local v18 = { "SimpleSpyExecuted", "rspy", "RemoteSpy", "TurtleSpy", "HydroxideLoaded" }

    if getgenv then
      for index5, value9 in ipairs(v18) do
        if getgenv()[value9] then
          return true
        end
      end

      for index6, value10 in ipairs({ "SimpleSpy", "Hydroxide", "RemoteSpy" }) do
        local v19 = value10

        if pcall(function() return coreGui:FindFirstChild(v19) end)
          and coreGui:FindFirstChild(v19) then
          return true
        end
      end

      return false
    end

    for index7, value11 in ipairs({ "SimpleSpy", "Hydroxide", "RemoteSpy" }) do
      local v20 = value11

      if pcall(function() return coreGui:FindFirstChild(v20) end)
        and coreGui:FindFirstChild(v20) then
        return true
      end
    end

    return false
  end

  while task.wait(2) do
    if f5() then
      players.LocalPlayer:Kick("Forbid Music 🛡️: Remote Spy (RSPY) detected. Execution Blocked. 🗿🤚")
      task.wait(0.5)
    end
  end
end)

if _G.ForbidConnections then
  for key4, value12 in pairs(_G.ForbidConnections) do
    value12:Disconnect()
  end
end

_G.ForbidConnections = {}
_G.ForbidLoading = true

local v21 = {
  MainColor = Color3.fromRGB(190, 195, 205),
  BgColor = Color3.fromRGB(12, 12, 14),
  Section = Color3.fromRGB(28, 29, 33),
  White = Color3.fromRGB(245, 246, 248),
  Grey = Color3.fromRGB(145, 148, 154),
  LightGrey = Color3.fromRGB(205, 208, 214),
  StartGreen = Color3.fromRGB(40, 220, 100),
  StopRed = Color3.fromRGB(255, 60, 60),
  BloodRed = Color3.fromRGB(220, 0, 0),
  RainbowName = true,
  RainbowBio = true,
  ClickSoundEnabled = true,
}

local v22 = 2

local v23 = {
  Text = {},
  Borders = {},
  Buttons = {},
  Gradients = {},
}

local v24 = { ActiveTab = nil, MenuOpen = false, RGBThemeActive = false }

local forbidClick = Instance.new("Sound")
forbidClick.Name = "ForbidClick"
forbidClick.SoundId = "rbxassetid://9083627113"
forbidClick.Volume = 0.4
forbidClick.Parent = coreGui

local function f6()
  if v21.ClickSoundEnabled then
    forbidClick:Play()
  end
end

string.upper(localPlayer.DisplayName)

local v25 = {
  "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
  "______________________________________________________________________________________________________________________________________________________________________________",
  "@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_@_",
  "````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````",
  "-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`-`",
  "P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P_P",
  "0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_0_o_",
  "Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~Q-~",
  "Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_",
  "I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_I_",
  "D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=D=",
  "Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)Q_)",
  "~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~",
  "G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^G^",
  "T_%_V_T_%_V_T_%_V_T_%_V_T_%_V_T_%_V_T_%_V_T_%_V_T_%_V_T_%_V_T_%_V_T_%_V_T_%_V_T_%_V_T_%_V_T_%_V_T_%_V_T_%_V_T_%_V_T_%_V_T_%_V_T_%_V_T_%_V_T_%_V_T_%_V_T_%_V_T_%_V_T_%_V_T_%_V_T_%_",
  '"HI"_"HI"_"HI"_"HI"_"HI"_"HI"_"HI"_"HI"_"HI"_"HI"_"HI"_"HI"_"HI"_"HI"_"HI"_"HI"_"HI"_"HI"_"HI"_"HI"_"HI"_"HI"_"HI"_"HI"_"HI"_"HI"_"HI"_"HI"_"HI"_"HI"_"HI"_"HI"_"HI"_',
  "[forbid]_[forbid]_[forbid]_[forbid]_[forbid]_[forbid]_[forbid]_[forbid]_[forbid]_[forbid]_[forbid]_[forbid]_[forbid]_[forbid]_[forbid]_[forbid]_[forbid]_[forbid]_[forbid]",
  "?sudo_?sudo_?sudo_?sudo_?sudo_?sudo_?sudo_?sudo_?sudo_?sudo_?sudo_?sudo_?sudo_?sudo_?sudo_?sudo_?sudo_?sudo_?sudo_?sudo_?sudo_?sudo_?sudo_",
  "[check]+[check]+[check]+[check]+[check]+[check]+[check]+[check]+[check]+[check]+[check]+[check]+[check]+[check]+[check]+[check]+[check]+",
  "_F_O_R_B_I_D__F_O_R_B_I_D__F_O_R_B_I_D__F_O_R_B_I_D__F_O_R_B_I_D__F_O_R_B_I_D__F_O_R_B_I_D__F_O_R_B_I_D__F_O_R_B_I_D__F_O_R_B_I_D_",
  "` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` `",
  "x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_x_",
  "0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_",
  "+_-_-+_-_-+_-_-+_-_-+_-_-+_-_-+_-_-+_-_-+_-_-+_-_-+_-_-+_-_-+_-_-+_-_-+_-_-+_-_-+_-_-_",
  ">_<_>_<_>_<_>_<_>_<_>_<_>_<_>_<_>_<_>_<_>_<_>_<_>_<_>_<_>_<_>_<_>_<_>_<_>_<_>_<_>_<_>_<",
  "V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_V_",
  "///_///_///_///_///_///_///_///_///_///_///_///_///_///_///_///_///_///_///_///_///_///_",
  "|||_|||_|||_|||_|||_|||_|||_|||_|||_|||_|||_|||_|||_|||_|||_|||_|||_|||_|||_|||_|||_|||_",
  "===_===_===_===_===_===_===_===_===_===_===_===_===_===_===_===_===_===_===_===_===_===_",
  "8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=8=",
  "~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~",
  "$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_$_",
  "*:_*:_*:_*:_*:_*:_*:_*:_*:_*:_*:_*:_*:_*:_*:_*:_*:_*:_*:_*:_*:_*:_*:_*:_*:_*:_*:_*:_*:_",
}

local v26 = {
  "€^€^€^^€€^€^€^€^€^^€€^€^€^€^€^^€€^€^€^€^€^^€€^€^€^€^€^^€€^€^€^€^€^^€€^€^€^€^€^^€€^€^",
  "π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_π_",
  "_™_©_®_™_©_®_™_©_®_™_©_®_™_©_®_™_©_®_™_©_®_™_©_®_™_©_®_™_©_®_™_©_®_™_©_®_™_©_®_™_©_®_™_©",
  "§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~§~",
  "∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_∞_",
  "→_→_→_→_→_→_→_→_→_→_→_→_→_→_→_→_→_→_→_→_→_→_→_→_→_→_→_→_→_→_→_→_→_→_→_→_→_→_→_→_→_→_→→→_→_",
  "Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_Ω_",
  "⅒_⅒_⅒_⅒_⅒_⅒_⅒_⅒_⅒_⅒_⅒_⅒_⅒_⅒_⅒_⅒_⅒_⅒_⅒_⅒_⅒_⅒_⅒_⅒_⅒_⅒_⅒_⅒_⅒_⅒_⅒_",
  "∅__∅__∅__∅__∅__∅__∅__∅__∅__∅__∅__∅__∅__∅__∅__∅__∅__∅__∅__∅__∅__∅__∅__∅__∅__∅__∅__∅__∅__∅__∅__∅__∅__∅__∅__∅__",
  "‰__‰__‰__‰__‰__‰__‰__‰__‰__‰__‰__‰__‰__‰__‰__‰__‰__‰__‰__‰__‰__‰__‰__",
  "№_№_№_№_№_№_№_№_№_№_№_№_№_№_№_№_№_№_№_№_№_№_№_№_№_№_",
  "¶_Ω_¶_Ω_¶_Ω_¶_Ω_¶_Ω_¶_Ω_¶_Ω_¶_Ω_¶_Ω_¶_Ω_¶_Ω_¶_Ω_¶_Ω_¶_Ω_¶_Ω_¶_Ω_¶_Ω_¶_Ω_¶_Ω_¶_Ω_¶_Ω_¶_Ω_¶_Ω_¶_Ω_¶_Ω_¶_Ω_¶_Ω_¶_Ω_¶_Ω_¶_Ω_¶_Ω_",
}

local v27 = {}

for index8, value13 in ipairs(v25) do
  table.insert(v27, value13)
end

for index9, value14 in ipairs(v26) do
  table.insert(v27, value14)
end

local v28 = string.upper(localPlayer.DisplayName)

local v29 = {
  "[TMX MEH PRIME]", "[TMX MEH NEON]", "[FORBID SPAM USE KR]", "[TMX MEH SYSTEM]",
  "[TMX MEH MATRIX]", "[TMX MEH CORE]", "[TMX MEH NEXUS]", "[TMX MEH VERTEX]",
  "[TMX MEH PULSE]", "[TMX MEH LOGIC]", "[TMX MEH FLUX]", "[TMX MEH ECHO]", "[TMX MEH NOVA]",
  "[TMX MEH APEX]", "[TMX MEH ZENITH]", "[TMX MEH CYBER]", "[TMX MEH RADAR]", "[TMX MEH ORBIT]",
  "[TMX MEH PROXY]", "[TMX MEH " .. v28 .. "]", "[TMX MEH " .. v28 .. " KA DANDA]",
}

local v30 = {
  "TMX MEI " .. v28, v28 .. " ON TOP", "SURRENDER TO " .. v28, v28 .. " IS THE KING",
  "GOD OF SPAM ALWAYS " .. v28, "PUT YOUR HIGHNESS TO " .. v28, v28 .. " RUNS THIS SERVER",
  "NOBODY CAN BEAT " .. v28, v28 .. " IS UNTOUCHABLE", "THE LOBBY BELONGS TO " .. v28,
  "KNEEL BEFORE " .. v28, v28 .. " COMMANDS THIS CHAT", "ALL HAIL " .. v28,
  v28 .. " NEVER LOSES",
}

local function f7(p7, p8)
  if #p8 == 0 then
    for index10, value15 in ipairs(p7) do
      table.insert(p8, value15)
    end
  end

  local v31 = math.random(1, #p8)
  table.remove(p8, v31)
  return p8[v31]
end

local v32 = {}
local v33 = {}
local v34 = {}

local function f8(p9)
  if textChatService.ChatVersion == Enum.ChatVersion.TextChatService then
    local rbxGeneral = textChatService.TextChannels:FindFirstChild("RBXGeneral")

    if rbxGeneral then
      rbxGeneral:SendAsync(p9)
    end
  else
    local defaultChatSystemChatEvents = replicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")

    if defaultChatSystemChatEvents then
      local sayMessageRequest = defaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")

      if sayMessageRequest then
        sayMessageRequest:FireServer(p9, "All")
      end
    end
  end
end

_G.ForbidSelectedSymbol = v27[2]

local function f9(index11, p10)
  local forbidSelectedSymbol

  if _G.ForbidSelectedSymbol == "Smart" then
    forbidSelectedSymbol = f7(v25, v32)
  else
    forbidSelectedSymbol = _G.ForbidSelectedSymbol
  end

  local v35 = ""

  if p10 == "Normal" then
    v35 = " < " .. f7(v29, v33)
  elseif p10 == "Self" then
    v35 = " < " .. f7(v30, v34)
  end

  local v36 = 150

  if table.find(v26, forbidSelectedSymbol) then
    v36 = 60
  end

  local v37 = v36 - (string.len(index11) + string.len(v35) + 2)

  if v37 < 5 then
    v37 = 5
  end

  local v38, v39 = pcall(function()
    local utf = utf8.offset(forbidSelectedSymbol, v37 + 1)

    if utf then
      return string.sub(forbidSelectedSymbol, 1, utf - 1)
    end

    return string.sub(forbidSelectedSymbol, 1, v37)
  end)

  local v40

  if v38 and v39 then
    v40 = v39
  else
    v40 = string.sub(forbidSelectedSymbol, 1, v37)
  end

  return v40 .. " " .. index11 .. v35
end

task.spawn(function()
  _G.ForbidLoading = true
  local localPlayer3 = players.LocalPlayer
  local color = Color3.fromRGB(190, 195, 205)
  local v41 = gethui and gethui() or coreGui

  if v41:FindFirstChild("ForbidGrandEntryV2") then
    v41.ForbidGrandEntryV2:Destroy()
  end

  local forbidGrandEntryV2 = Instance.new("ScreenGui")
  forbidGrandEntryV2.Name = "ForbidGrandEntryV2"
  forbidGrandEntryV2.Parent = v41
  forbidGrandEntryV2.IgnoreGuiInset = true
  forbidGrandEntryV2.DisplayOrder = 10001

  local instance = Instance.new("BlurEffect", lighting)
  instance.Size = 0

  local instance2 = Instance.new("Frame", forbidGrandEntryV2)
  instance2.Size = UDim2.new(1, 0, 1, 0)
  instance2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
  instance2.BackgroundTransparency = 1
  instance2.BorderSizePixel = 0

  local instance3 = Instance.new("Frame", forbidGrandEntryV2)
  instance3.Size = UDim2.new(0, 380, 0, 0)
  instance3.Position = UDim2.new(0.5, 0, 0.5, 0)
  instance3.AnchorPoint = Vector2.new(0.5, 0.5)
  instance3.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
  instance3.BackgroundTransparency = 0.15
  instance3.ClipsDescendants = true

  Instance.new("UICorner", instance3).CornerRadius = UDim.new(0, 8)

  local instance4 = Instance.new("UIStroke", instance3)
  instance4.Color = color
  instance4.Thickness = 1.5
  instance4.Transparency = 1

  local instance5 = Instance.new("TextLabel", instance3)
  instance5.Size = UDim2.new(1, 0, 0, 30)
  instance5.Position = UDim2.new(0, 0, 0, 15)
  instance5.BackgroundTransparency = 1
  instance5.Font = Enum.Font.GothamBlack
  instance5.Text = "🎊 FORBID SPAMMER 1.6 🎉"
  instance5.TextColor3 = Color3.fromRGB(255, 255, 255)
  instance5.TextSize = 22
  instance5.TextTransparency = 1

  local instance6 = Instance.new("TextLabel", instance3)
  instance6.Size = UDim2.new(1, 0, 0, 20)
  instance6.Position = UDim2.new(0, 0, 0, 42)
  instance6.BackgroundTransparency = 1
  instance6.Font = Enum.Font.Gotham
  instance6.Text = "Welcome, " .. localPlayer3.DisplayName
  instance6.TextColor3 = color
  instance6.TextSize = 13
  instance6.TextTransparency = 1

  local instance7 = Instance.new("Frame", instance3)
  instance7.Size = UDim2.new(0.85, 0, 0, 4)
  instance7.Position = UDim2.new(0.075, 0, 0, 75)
  instance7.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
  instance7.BorderSizePixel = 0
  instance7.BackgroundTransparency = 1

  Instance.new("UICorner", instance7).CornerRadius = UDim.new(1, 0)

  local instance8 = Instance.new("Frame", instance7)
  instance8.Size = UDim2.new(0, 0, 1, 0)
  instance8.BackgroundColor3 = color
  instance8.BorderSizePixel = 0

  Instance.new("UICorner", instance8).CornerRadius = UDim.new(1, 0)

  local instance9 = Instance.new("TextLabel", instance3)
  instance9.Size = UDim2.new(0.5, 0, 0, 20)
  instance9.Position = UDim2.new(0.075, 0, 0, 85)
  instance9.BackgroundTransparency = 1
  instance9.Font = Enum.Font.Gotham
  instance9.Text = "Awaiting execution..."
  instance9.TextColor3 = Color3.fromRGB(150, 150, 150)
  instance9.TextSize = 11
  instance9.TextXAlignment = Enum.TextXAlignment.Left
  instance9.TextTransparency = 1

  local instance10 = Instance.new("TextLabel", instance3)
  instance10.Size = UDim2.new(0.5, 0, 0, 20)
  instance10.Position = UDim2.new(0.425, 0, 0, 85)
  instance10.BackgroundTransparency = 1
  instance10.Font = Enum.Font.GothamBold
  instance10.Text = "0%"
  instance10.TextColor3 = Color3.fromRGB(255, 255, 255)
  instance10.TextSize = 12
  instance10.TextXAlignment = Enum.TextXAlignment.Right
  instance10.TextTransparency = 1

  local instance11 = Instance.new("Sound", forbidGrandEntryV2)
  instance11.SoundId = "rbxassetid://119936139925486"
  instance11.Volume = 1
  instance11.TimePosition = 9
  instance11:Play()

  local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
  local tweenInfo2 = TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)

  tweenService:Create(instance, tweenInfo, { Size = 20 }):Play()
  tweenService:Create(instance2, tweenInfo, { BackgroundTransparency = 0.6 }):Play()
  tweenService:Create(instance4, tweenInfo, { Transparency = 0 }):Play()

  local create = tweenService:Create(instance3, tweenInfo, { Size = UDim2.new(0, 380, 0, 120) })
  create:Play()
  create.Completed:Wait()

  tweenService:Create(instance5, tweenInfo2, { TextTransparency = 0 }):Play()
  tweenService:Create(instance6, tweenInfo2, { TextTransparency = 0 }):Play()
  tweenService:Create(instance7, tweenInfo2, { BackgroundTransparency = 0 }):Play()
  tweenService:Create(instance9, tweenInfo2, { TextTransparency = 0 }):Play()
  tweenService:Create(instance10, tweenInfo2, { TextTransparency = 0 }):Play()

  task.wait(0.3)

  local create2 = tweenService:Create(instance8, TweenInfo.new(
    3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out
  ), { Size = UDim2.new(1, 0, 1, 0) })

  create2:Play()

  task.spawn(function()
    local v42 = tick()

    while tick() - v42 < 3 do
      local v43 = tick()
      local v44 = math.clamp((v43 - v42) / 3, 0, 1)
      local v45 = math.pow(1 - v44, 4)
      local v46 = math.floor((1 - v45) * 100)
      instance10.Text = v46 .. "%"

      if v46 < 25 then
        instance9.Text = "Injecting dependencies..."
      elseif v46 < 60 then
        instance9.Text = "Fetching UI data..."
      elseif v46 < 85 then
        instance9.Text = "Bypassing chat filters..."
      else
        instance9.Text = "Ready to dominate."
      end

      task.wait(0.03)
    end

    instance10.Text = "100%"
    instance9.Text = "Ready to dominate."
  end)

  create2.Completed:Wait()
  task.wait(0.5)

  for key5, value16 in pairs(instance3:GetDescendants()) do
    if value16:IsA("TextLabel") then
      tweenService:Create(value16, tweenInfo2, { TextTransparency = 1 }):Play()
    end

    if value16:IsA("Frame") and value16 ~= instance3 then
      tweenService:Create(value16, tweenInfo2, { BackgroundTransparency = 1 }):Play()
    end
  end

  tweenService:Create(instance4, tweenInfo2, { Transparency = 1 }):Play()
  tweenService:Create(instance11, tweenInfo, { Volume = 0 }):Play()

  local create3 = tweenService:Create(instance3, tweenInfo, { Size = UDim2.new(0, 0, 0, 0) })
  create3:Play()

  tweenService:Create(instance, tweenInfo, { Size = 0 }):Play()
  tweenService:Create(instance2, tweenInfo, { BackgroundTransparency = 1 }):Play()

  create3.Completed:Wait()
  forbidGrandEntryV2:Destroy()

  if instance then
    instance:Destroy()
  end

  _G.ForbidLoading = false
end)

local function f10()
  task.spawn(function()
    local waitForChild = replicatedStorage:WaitForChild("RE", 5)

    if not waitForChild then
      return
    end

    local waitForChild2 = waitForChild:WaitForChild("1RPNam1eTex1t", 5)
    local waitForChild3 = waitForChild:WaitForChild("1RPNam1eColo1r", 5)

    if waitForChild2 then
      pcall(function()
        waitForChild2:FireServer("RolePlayName", "👾Forbid Spam User☠️")
        waitForChild2:FireServer("RolePlayBio", " " .. localPlayer.DisplayName)
      end)
    end

    if waitForChild3 then
      task.spawn(function()
        while task.wait(0.1) do
          local v47 = tick()
          local color2 = Color3.fromHSV(v47 % 5 / 5, 1, 1)

          pcall(function()
            if v21.RainbowName then
              waitForChild3:FireServer("PickingRPNameColor", color2)
            end

            if v21.RainbowBio then
              waitForChild3:FireServer("PickingRPBioColor", color2)
            end
          end)
        end
      end)
    end
  end)
end

f10()

local forbidRGB = Instance.new("ScreenGui")
forbidRGB.Name = "ForbidRGB"
forbidRGB.DisplayOrder = 10000
forbidRGB.ResetOnSpawn = false
forbidRGB.IgnoreGuiInset = true

if not pcall(function() forbidRGB.Parent = coreGui end) then
  forbidRGB.Parent = localPlayer:WaitForChild("PlayerGui")
end

local function f11(instance12)
  local inputBegan = instance12.InputBegan
  local v48, position, position2

  inputBegan:Connect(function(p11)
    if p11.UserInputType == Enum.UserInputType.MouseButton1
      or p11.UserInputType == Enum.UserInputType.Touch then
      v48 = true
      position = p11.Position
      position2 = instance12.Position
    end
  end)

  instance12.InputChanged:Connect(function(input)
    if v48
      and (input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch) then
      local v49 = input.Position - position

      instance12.Position = UDim2.new(
        position2.X.Scale, position2.X.Offset + v49.X, position2.Y.Scale,
        position2.Y.Offset + v49.Y
      )
    end
  end)

  instance12.InputEnded:Connect(function(input2)
    if input2.UserInputType == Enum.UserInputType.MouseButton1
      or input2.UserInputType == Enum.UserInputType.Touch then
      v48 = false
    end
  end)
end

local function f12(instance13)
  local instance14 = Instance.new("UIGradient", instance13)

  instance14.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
    ColorSequenceKeypoint.new(1, Color3.new(0.8, 0.8, 0.8)),
  })

  instance14.Rotation = 90

  local instance15 = Instance.new("UIScale", instance13)

  instance13.AutoButtonColor = false

  instance13.MouseButton1Down:Connect(function()
    f6()
    tweenService:Create(instance15, TweenInfo.new(0.1), { Scale = 0.95 }):Play()
  end)

  instance13.MouseButton1Up:Connect(function()
    tweenService:Create(instance15, TweenInfo.new(0.3, Enum.EasingStyle.Bounce), {
      Scale = 1,
    }):Play()
  end)
end

local instance16 = Instance.new("Frame", forbidRGB)
instance16.Size = UDim2.new(0, 300, 0, 350)
instance16.Position = UDim2.new(0.5, -150, 0.5, -175)
instance16.BackgroundColor3 = v21.BgColor
instance16.Visible = false
instance16.ClipsDescendants = true

Instance.new("UICorner", instance16).CornerRadius = UDim.new(0, 10)

local instance17 = Instance.new("UIStroke", instance16)
instance17.Color = v21.MainColor
instance17.Thickness = 2

table.insert(v23.Borders, instance17)
f11(instance16)
local instance18 = Instance.new("UIScale", instance16)

local function f13()
  if workspace.CurrentCamera.ViewportSize.Y > 800 then
    instance18.Scale = 1.3
  else
    instance18.Scale = 1
  end
end

workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(f13)
f13()

local instance19 = Instance.new("TextButton", forbidRGB)
instance19.Size = UDim2.new(0, 50, 0, 50)
instance19.Position = UDim2.new(0.05, 0, 0.4, 0)
instance19.BackgroundColor3 = v21.BgColor
instance19.Text = "F"
instance19.TextColor3 = v21.White
instance19.Font = Enum.Font.GothamBold
instance19.TextSize = 24
instance19.Visible = false

Instance.new("UICorner", instance19).CornerRadius = UDim.new(1, 0)

local instance20 = Instance.new("UIStroke", instance19)
instance20.Thickness = 2
instance20.Color = v21.MainColor

table.insert(v23.Borders, instance20)

local instance21 = Instance.new("Frame", instance19)
instance21.Size = UDim2.new(1, 0, 1, 0)
instance21.BackgroundTransparency = 1

local instance22 = Instance.new("Frame", instance21)
instance22.Size = UDim2.new(0, 8, 0, 8)
instance22.Position = UDim2.new(0.5, -4, 0, -4)
instance22.BackgroundColor3 = v21.MainColor

Instance.new("UICorner", instance22).CornerRadius = UDim.new(1, 0)
table.insert(v23.Buttons, instance22)

local instance23 = Instance.new("Frame", instance21)
instance23.Size = UDim2.new(0, 8, 0, 8)
instance23.Position = UDim2.new(0.5, -4, 1, -4)
instance23.BackgroundColor3 = v21.MainColor

Instance.new("UICorner", instance23).CornerRadius = UDim.new(1, 0)
table.insert(v23.Buttons, instance23)

task.spawn(function()
  while instance19.Parent do
    local create4 = tweenService:Create(instance21, TweenInfo.new(3, Enum.EasingStyle.Linear), {
      Rotation = 360,
    })

    create4:Play()
    create4.Completed:Wait()

    instance21.Rotation = 0
  end
end)

f11(instance19)
local v50 = false

local function f14()
  if v50 then
    return
  end

  v50 = true
  f6()

  if v24.MenuOpen then
    tweenService:Create(instance16, TweenInfo.new(0.3), { BackgroundTransparency = 1 }):Play()
    tweenService:Create(instance17, TweenInfo.new(0.3), { Transparency = 1 }):Play()

    for key6, value17 in pairs(instance16:GetDescendants()) do
      if value17:IsA("TextLabel") or value17:IsA("TextButton") or value17:IsA("TextBox") then
        tweenService:Create(value17, TweenInfo.new(0.3), { TextTransparency = 1 }):Play()
      end

      if value17:IsA("ImageLabel") then
        tweenService:Create(value17, TweenInfo.new(0.3), { ImageTransparency = 1 }):Play()
      end

      if value17:IsA("UIStroke") and value17 ~= instance17 then
        tweenService:Create(value17, TweenInfo.new(0.3), { Transparency = 1 }):Play()
      end

      if (value17:IsA("Frame") or value17:IsA("TextBox") or value17:IsA("TextButton"))
        and (value17.BackgroundColor3 == v21.Section or value17.BackgroundColor3 == v21.BgColor) then
        tweenService:Create(value17, TweenInfo.new(0.3), { BackgroundTransparency = 1 }):Play()
      end
    end

    task.wait(0.3)
    instance16.Visible = false
    v24.MenuOpen = false
  else
    instance16.Visible = true

    tweenService:Create(instance16, TweenInfo.new(0.3), { BackgroundTransparency = 0 }):Play()
    tweenService:Create(instance17, TweenInfo.new(0.3), { Transparency = 0 }):Play()

    for key7, value18 in pairs(instance16:GetDescendants()) do
      if value18:IsA("TextLabel") or value18:IsA("TextButton") or value18:IsA("TextBox") then
        tweenService:Create(value18, TweenInfo.new(0.3), { TextTransparency = 0 }):Play()
      end

      if value18:IsA("ImageLabel") then
        tweenService:Create(value18, TweenInfo.new(0.3), { ImageTransparency = 0 }):Play()
      end

      if value18:IsA("UIStroke") and value18 ~= instance17 then
        tweenService:Create(value18, TweenInfo.new(0.3), { Transparency = 0 }):Play()
      end

      if (value18:IsA("Frame") or value18:IsA("TextBox") or value18:IsA("TextButton"))
        and (value18.BackgroundColor3 == v21.Section or value18.BackgroundColor3 == v21.BgColor) then
        tweenService:Create(value18, TweenInfo.new(0.3), { BackgroundTransparency = 0 }):Play()
      end
    end

    v24.MenuOpen = true
  end



  v50 = false
end

instance19.MouseButton1Click:Connect(f14)

local instance24 = Instance.new("Frame", instance16)
instance24.Size = UDim2.new(1, 0, 0, 50)
instance24.BackgroundTransparency = 1

local instance25 = Instance.new("TextLabel", instance24)
instance25.Size = UDim2.new(0.5, 0, 1, 0)
instance25.Position = UDim2.new(0, 10, 0, -8)
instance25.BackgroundTransparency = 1
instance25.Text = "F0RBID SPAMMER"
instance25.TextColor3 = v21.White
instance25.Font = Enum.Font.GothamBlack
instance25.TextSize = 18
instance25.TextXAlignment = Enum.TextXAlignment.Left

local instance26 = Instance.new("TextLabel", instance24)
instance26.Size = UDim2.new(0.5, 0, 0, 15)
instance26.Position = UDim2.new(0, 10, 0, 22)
instance26.BackgroundTransparency = 1
instance26.Text = "V1.6"
instance26.TextColor3 = v21.LightGrey
instance26.Font = Enum.Font.Gotham
instance26.TextSize = 10
instance26.TextXAlignment = Enum.TextXAlignment.Left

local instance27 = Instance.new("Frame", instance24)
instance27.Size = UDim2.new(0, 120, 1, 0)
instance27.Position = UDim2.new(1, -10, 0, 0)
instance27.AnchorPoint = Vector2.new(1, 0)
instance27.BackgroundTransparency = 1

local instance28 = Instance.new("ImageLabel", instance27)
instance28.Size = UDim2.new(0, 34, 0, 34)
instance28.Position = UDim2.new(1, -34, 0.5, -17)
instance28.BackgroundColor3 = v21.BgColor

instance28.Image = players:GetUserThumbnailAsync(
  localPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48
)

Instance.new("UICorner", instance28).CornerRadius = UDim.new(1, 0)

local instance29 = Instance.new("UIStroke", instance28)
instance29.Color = v21.MainColor
instance29.Thickness = 1.5

table.insert(v23.Borders, instance29)

local instance30 = Instance.new("TextLabel", instance27)
instance30.Size = UDim2.new(1, -40, 1, 0)
instance30.BackgroundTransparency = 1
instance30.Text = "ID: " .. localPlayer.UserId
instance30.TextColor3 = v21.Grey
instance30.Font = Enum.Font.GothamBold
instance30.TextSize = 10
instance30.TextXAlignment = Enum.TextXAlignment.Right

local instance31 = Instance.new("Frame", instance16)
instance31.Size = UDim2.new(1, -20, 0, 30)
instance31.Position = UDim2.new(0, 10, 0, 50)
instance31.BackgroundColor3 = v21.Section

Instance.new("UICorner", instance31).CornerRadius = UDim.new(0, 6)

local instance32 = Instance.new("Frame", instance16)
instance32.Size = UDim2.new(1, 0, 1, -90)
instance32.Position = UDim2.new(0, 0, 0, 90)
instance32.BackgroundTransparency = 1
instance32.ClipsDescendants = true

local v51 = {}

local function f15(activeTab)
  for index12, value19 in ipairs(v51) do
    if value19.Page == activeTab then
      return index12
    end
  end

  return 1
end

local function f16(instance33, instance34)
  local activeTab2

  if v24.ActiveTab == instance33 then
    return
  else
    f6()
    local activeTab3 = v24.ActiveTab and f15(v24.ActiveTab) or 1
    local v52 = f15(instance33) > activeTab3 and 1 or -1

    for key8, value20 in pairs(v51) do
      tweenService:Create(value20.Btn, TweenInfo.new(0.2), { TextColor3 = v21.Grey }):Play()
    end

    tweenService:Create(instance34, TweenInfo.new(0.2), { TextColor3 = v21.MainColor }):Play()

    if v24.ActiveTab then
      activeTab2 = v24.ActiveTab

      tweenService:Create(activeTab2, TweenInfo.new(
        0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out
      ), { Position = UDim2.new(-v52, 0, 0, 0) }):Play()

      task.delay(0.3, function()
        if activeTab2 ~= v24.ActiveTab then
          activeTab2.Visible = false
        end
      end)
    end

    instance33.Position = UDim2.new(v52, 0, 0, 0)
    instance33.Visible = true

    tweenService:Create(instance33, TweenInfo.new(
      0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out
    ), { Position = UDim2.new(0, 0, 0, 0) }):Play()

    v24.ActiveTab = instance33
    return
  end
end

local function makeTextButton(text)
  local instance35 = Instance.new("TextButton", instance31)
  instance35.Size = UDim2.new(0.25, 0, 1, 0)
  instance35.Position = UDim2.new(#v51 * 0.25, 0, 0, 0)
  instance35.BackgroundTransparency = 1
  instance35.Text = text
  instance35.TextColor3 = v21.Grey
  instance35.Font = Enum.Font.GothamBold
  instance35.TextSize = 12

  local instance36 = Instance.new("ScrollingFrame", instance32)
  instance36.Size = UDim2.new(1, 0, 1, 0)
  instance36.BackgroundTransparency = 1
  instance36.Visible = false
  instance36.ScrollBarThickness = 2
  instance36.AutomaticCanvasSize = Enum.AutomaticSize.Y
  instance36.CanvasSize = UDim2.new(0, 0, 0, 0)

  instance35.MouseButton1Click:Connect(function() f16(instance36, instance35) end)

  table.insert(v23.Text, instance35)
  table.insert(v51, { Btn = instance35, Page = instance36 })

  return instance36
end

local spam = makeTextButton("Spam")
local themes = makeTextButton("Themes")
local v53 = makeTextButton("Settings")
local credits = makeTextButton("Credits")

v51[1].Btn.TextColor3 = v21.MainColor
v51[1].Page.Visible = true

v24.ActiveTab = v51[1].Page

local instance37 = Instance.new("UIListLayout", spam)
instance37.Padding = UDim.new(0, 10)
instance37.HorizontalAlignment = Enum.HorizontalAlignment.Center

Instance.new("UIPadding", spam).PaddingTop = UDim.new(0, 10)

local function makeFrame(p12, p13)
  local instance38 = Instance.new("Frame", p13)
  instance38.Size = UDim2.new(0.95, 0, 0, p12)
  instance38.BackgroundColor3 = v21.Section

  Instance.new("UICorner", instance38).CornerRadius = UDim.new(0, 8)
  return instance38
end

local v54 = makeFrame(35, spam)

local instance39 = Instance.new("TextLabel", v54)
instance39.Size = UDim2.new(0.65, 0, 1, 0)
instance39.Position = UDim2.new(0.025, 0, 0, 0)
instance39.BackgroundTransparency = 1
instance39.Text = "V1.6: Anti-Ban, Self-Based Roasts, No tagging (use 4s and style 2 for least tagging!), fixed many more!"
instance39.TextColor3 = Color3.fromRGB(190, 195, 205)
instance39.Font = Enum.Font.GothamBold
instance39.TextSize = 10
instance39.TextWrapped = true
instance39.TextXAlignment = Enum.TextXAlignment.Left

local instance40 = Instance.new("Frame", v54)
instance40.Size = UDim2.new(0.3, 0, 1, 0)
instance40.Position = UDim2.new(0.675, 0, 0, 0)
instance40.BackgroundTransparency = 1

local instance41 = Instance.new("TextLabel", instance40)
instance41.Size = UDim2.new(0.5, 0, 1, 0)
instance41.BackgroundTransparency = 1
instance41.Text = "Delay(s):"
instance41.TextColor3 = v21.Grey
instance41.Font = Enum.Font.GothamBold
instance41.TextSize = 9
instance41.TextXAlignment = Enum.TextXAlignment.Right

local instance42 = Instance.new("TextBox", instance40)
instance42.Size = UDim2.new(0.4, 0, 0.7, 0)
instance42.Position = UDim2.new(0.55, 0, 0.15, 0)
instance42.BackgroundColor3 = v21.BgColor
instance42.Text = "2"
instance42.TextColor3 = v21.White
instance42.Font = Enum.Font.Gotham
instance42.TextSize = 10

Instance.new("UICorner", instance42).CornerRadius = UDim.new(0, 4)

instance42:GetPropertyChangedSignal("Text"):Connect(function()
  local v55 = tonumber(instance42.Text)

  if v55 then
    v22 = v55
  end
end)

local v56 = makeFrame(30, spam)
v56.ClipsDescendants = true

local instance43 = Instance.new("TextButton", v56)
instance43.Size = UDim2.new(1, 0, 0, 30)
instance43.BackgroundTransparency = 1
instance43.Text = "  Symbol: Style 2 (_______________...)"
instance43.TextColor3 = v21.White
instance43.Font = Enum.Font.GothamBold
instance43.TextSize = 11
instance43.TextXAlignment = Enum.TextXAlignment.Left

local instance44 = Instance.new("TextLabel", instance43)
instance44.Size = UDim2.new(0, 30, 1, 0)
instance44.Position = UDim2.new(1, -30, 0, 0)
instance44.BackgroundTransparency = 1
instance44.Text = "v"
instance44.TextColor3 = v21.MainColor
instance44.Font = Enum.Font.GothamBold
instance44.TextSize = 14

local instance45 = Instance.new("ScrollingFrame", v56)
instance45.Size = UDim2.new(1, 0, 1, -30)
instance45.Position = UDim2.new(0, 0, 0, 30)
instance45.BackgroundTransparency = 1
instance45.BorderSizePixel = 0
instance45.ScrollBarThickness = 2

local instance46 = Instance.new("UIListLayout", instance45)
local v57 = false

instance43.MouseButton1Click:Connect(function()
  v57 = not v57
  f6()

  if v57 then
    tweenService:Create(v56, TweenInfo.new(
      0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out
    ), { Size = UDim2.new(0.95, 0, 0, 120) }):Play()

    instance44.Text = "^"
  else
    tweenService:Create(v56, TweenInfo.new(
      0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out
    ), { Size = UDim2.new(0.95, 0, 0, 30) }):Play()

    instance44.Text = "v"
  end
end)

local function makeTextButton2(text2, value21)
  local instance47 = Instance.new("TextButton", instance45)
  instance47.Size = UDim2.new(1, 0, 0, 25)
  instance47.BackgroundColor3 = v21.BgColor
  instance47.BackgroundTransparency = 0.5
  instance47.Text = "  " .. text2
  instance47.TextColor3 = v21.LightGrey
  instance47.Font = Enum.Font.Gotham
  instance47.TextSize = 10
  instance47.TextXAlignment = Enum.TextXAlignment.Left

  instance47.MouseButton1Click:Connect(function()
    _G.ForbidSelectedSymbol = value21
    instance43.Text = "  Symbol: " .. text2
    v57 = false

    tweenService:Create(v56, TweenInfo.new(
      0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out
    ), { Size = UDim2.new(0.95, 0, 0, 30) }):Play()

    instance44.Text = "v"
    f6()
  end)
end

makeTextButton2("Smart (Random Safe)", "Smart")

for index13, value22 in ipairs(v27) do
  makeTextButton2(
    "Style " .. index13 .. " (" .. (string.sub(value22, 1, 15) .. "...") .. ")", value22
  )
end

instance46:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
  instance45.CanvasSize = UDim2.new(0, 0, 0, instance46.AbsoluteContentSize.Y)
end)

instance45.CanvasSize = UDim2.new(0, 0, 0, instance46.AbsoluteContentSize.Y)
local v58 = false
local v59 = false
local v60 = false
local v61 = makeFrame(45, spam)

local instance48 = Instance.new("TextLabel", v61)
instance48.Size = UDim2.new(1, -10, 0, 15)
instance48.Position = UDim2.new(0, 10, 0, 2)
instance48.BackgroundTransparency = 1
instance48.Text = "Custom Spam"
instance48.TextColor3 = v21.MainColor
instance48.Font = Enum.Font.GothamBold
instance48.TextSize = 11
instance48.TextXAlignment = Enum.TextXAlignment.Left

table.insert(v23.Text, instance48)

local instance49 = Instance.new("TextBox", v61)
instance49.Size = UDim2.new(0.72, 0, 0, 22)
instance49.Position = UDim2.new(0.025, 0, 0, 18)
instance49.BackgroundColor3 = v21.BgColor
instance49.Text = ""
instance49.PlaceholderText = "Your Message Here"
instance49.TextColor3 = v21.White
instance49.Font = Enum.Font.Gotham
instance49.TextSize = 11

Instance.new("UICorner", instance49).CornerRadius = UDim.new(0, 4)

local instance50 = Instance.new("TextButton", v61)
instance50.Size = UDim2.new(0.18, 0, 0, 22)
instance50.Position = UDim2.new(0.77, 0, 0, 18)
instance50.BackgroundColor3 = v21.StartGreen
instance50.Text = "START"
instance50.TextColor3 = v21.White
instance50.Font = Enum.Font.GothamBold
instance50.TextSize = 9

Instance.new("UICorner", instance50).CornerRadius = UDim.new(0, 4)
f12(instance50)

instance50.MouseButton1Click:Connect(function()
  v58 = not v58

  if v58 then
    instance50.Text = "STOP"
    instance50.BackgroundColor3 = v21.StopRed

    task.spawn(function()
      while v58 do
        local v62 = f9(instance49.Text, "None")
        pcall(function() f8(v62) end)
        task.wait(v22 + math.random(0, 30) / 100)
      end
    end)
  else
    instance50.Text = "START"
    instance50.BackgroundColor3 = v21.StartGreen
  end
end)

local v63 = makeFrame(45, spam)

local instance51 = Instance.new("TextLabel", v63)
instance51.Size = UDim2.new(1, -10, 0, 15)
instance51.Position = UDim2.new(0, 10, 0, 2)
instance51.BackgroundTransparency = 1
instance51.Text = "Roast Spam"
instance51.TextColor3 = v21.MainColor
instance51.Font = Enum.Font.GothamBold
instance51.TextSize = 11
instance51.TextXAlignment = Enum.TextXAlignment.Left

table.insert(v23.Text, instance51)

local instance52 = Instance.new("TextBox", v63)
instance52.Size = UDim2.new(0.72, 0, 0, 22)
instance52.Position = UDim2.new(0.025, 0, 0, 18)
instance52.BackgroundColor3 = v21.BgColor
instance52.Text = ""
instance52.PlaceholderText = "Target Name Here"
instance52.TextColor3 = v21.White
instance52.Font = Enum.Font.Gotham
instance52.TextSize = 11

Instance.new("UICorner", instance52).CornerRadius = UDim.new(0, 4)

local instance53 = Instance.new("TextButton", v63)
instance53.Size = UDim2.new(0.18, 0, 0, 22)
instance53.Position = UDim2.new(0.77, 0, 0, 18)
instance53.BackgroundColor3 = v21.StartGreen
instance53.Text = "START"
instance53.TextColor3 = v21.White
instance53.Font = Enum.Font.GothamBold
instance53.TextSize = 9

Instance.new("UICorner", instance53).CornerRadius = UDim.new(0, 4)
f12(instance53)

instance53.MouseButton1Click:Connect(function()
  v59 = not v59

  if v59 then
    instance53.Text = "STOP"
    instance53.BackgroundColor3 = v21.StopRed

    task.spawn(function()
      while v59 do
        v1641 = f9(instance52.Text, "Normal")
        task.wait(v22 + math.random(0, 30) / 100)
      end
    end)
  else
    instance53.Text = "START"
    instance53.BackgroundColor3 = v21.StartGreen
  end
end)

local v64 = makeFrame(45, spam)

local instance54 = Instance.new("TextLabel", v64)
instance54.Size = UDim2.new(1, -10, 0, 15)
instance54.Position = UDim2.new(0, 10, 0, 2)
instance54.BackgroundTransparency = 1
instance54.Text = "Self-Based Roasts"
instance54.TextColor3 = v21.MainColor
instance54.Font = Enum.Font.GothamBold
instance54.TextSize = 11
instance54.TextXAlignment = Enum.TextXAlignment.Left

table.insert(v23.Text, instance54)

local instance55 = Instance.new("TextBox", v64)
instance55.Size = UDim2.new(0.72, 0, 0, 22)
instance55.Position = UDim2.new(0.025, 0, 0, 18)
instance55.BackgroundColor3 = v21.BgColor
instance55.Text = ""
instance55.PlaceholderText = "Target Name Here"
instance55.TextColor3 = v21.White
instance55.Font = Enum.Font.Gotham
instance55.TextSize = 11

Instance.new("UICorner", instance55).CornerRadius = UDim.new(0, 4)

local instance56 = Instance.new("TextButton", v64)
instance56.Size = UDim2.new(0.18, 0, 0, 22)
instance56.Position = UDim2.new(0.77, 0, 0, 18)
instance56.BackgroundColor3 = v21.StartGreen
instance56.Text = "START"
instance56.TextColor3 = v21.White
instance56.Font = Enum.Font.GothamBold
instance56.TextSize = 9

Instance.new("UICorner", instance56).CornerRadius = UDim.new(0, 4)
f12(instance56)

instance56.MouseButton1Click:Connect(function()
  v60 = not v60

  if v60 then
    instance56.Text = "STOP"
    instance56.BackgroundColor3 = v21.StopRed

    task.spawn(function()
      while v60 do
        local v65 = f9(instance55.Text, "Self")
        pcall(function() f8(v65) end)
        task.wait(v22 + math.random(0, 30) / 100)
      end
    end)
  else
    instance56.Text = "START"
    instance56.BackgroundColor3 = v21.StartGreen
  end
end)

local instance57 = Instance.new("UIListLayout", themes)
instance57.Padding = UDim.new(0, 10)
instance57.HorizontalAlignment = Enum.HorizontalAlignment.Center

Instance.new("UIPadding", themes).PaddingTop = UDim.new(0, 10)

local function f17(color3)
  v21.MainColor = color3
  instance17.Color = color3
  instance20.Color = color3
  instance29.Color = color3

  for key9, value23 in pairs(v23.Text) do
    value23.TextColor3 = color3
  end

  for key10, value24 in pairs(v23.Borders) do
    value24.Color = color3
  end

  for key11, value25 in pairs(v23.Gradients) do
    value25.Color = ColorSequence.new({
      ColorSequenceKeypoint.new(0, color3), ColorSequenceKeypoint.new(0.5, v21.White),
      ColorSequenceKeypoint.new(1, color3),
    })
  end

  for key12, value26 in pairs(v23.Buttons) do
    value26.BackgroundColor3 = color3
  end
end

local function makeTextButton3(text3, color4)
  local instance58 = Instance.new("TextButton", themes)
  instance58.Size = UDim2.new(0.9, 0, 0, 35)
  instance58.BackgroundColor3 = v21.Section
  instance58.Text = text3
  instance58.TextColor3 = color4
  instance58.Font = Enum.Font.GothamBold
  instance58.TextSize = 12

  Instance.new("UICorner", instance58).CornerRadius = UDim.new(0, 8)
  f12(instance58)

  instance58.MouseButton1Click:Connect(function()
    v24.RGBThemeActive = false
    f17(color4)
  end)
end

local instance59 = Instance.new("TextButton", themes)
instance59.Size = UDim2.new(0.9, 0, 0, 35)
instance59.BackgroundColor3 = v21.Section
instance59.Text = "RGB MODE"
instance59.TextColor3 = v21.White
instance59.Font = Enum.Font.GothamBold
instance59.TextSize = 12

Instance.new("UICorner", instance59).CornerRadius = UDim.new(0, 8)
f12(instance59)

instance59.MouseButton1Click:Connect(function()
  v24.RGBThemeActive = not v24.RGBThemeActive

  if v24.RGBThemeActive then
    task.spawn(function()
      while v24.RGBThemeActive do
        f17(Color3.fromHSV(tick() % 5 / 5, 1, 1))
        task.wait()
      end
    end)
  end
end)

makeTextButton3("Silver", Color3.fromRGB(190, 195, 205))
makeTextButton3("Sky Blue", Color3.fromRGB(0, 190, 255))
makeTextButton3("Red", Color3.fromRGB(255, 60, 60))
makeTextButton3("Purple", Color3.fromRGB(170, 100, 255))
makeTextButton3("Green", Color3.fromRGB(0, 255, 100))
makeTextButton3("Gold", Color3.fromRGB(255, 170, 0))

local instance60 = Instance.new("UIListLayout", v53)
instance60.Padding = UDim.new(0, 10)
instance60.HorizontalAlignment = Enum.HorizontalAlignment.Center

Instance.new("UIPadding", v53).PaddingTop = UDim.new(0, 10)

local function makeTextButton4(text4, fn, text5)
  local v66 = makeFrame(40, v53)

  local instance61 = Instance.new("TextLabel", v66)
  instance61.Size = UDim2.new(0.6, 0, 1, 0)
  instance61.Position = UDim2.new(0.05, 0, 0, 0)
  instance61.BackgroundTransparency = 1
  instance61.Text = text4
  instance61.TextColor3 = v21.White
  instance61.Font = Enum.Font.GothamBold
  instance61.TextSize = 14
  instance61.TextXAlignment = Enum.TextXAlignment.Left

  local instance62 = Instance.new("TextButton", v66)
  instance62.Size = UDim2.new(0, 40, 0, 30)
  instance62.Position = UDim2.new(0.8, 0, 0.5, -15)
  instance62.BackgroundColor3 = text5 and v21.StartGreen or v21.StopRed
  instance62.Text = text5 and "ON" or "OFF"
  instance62.TextColor3 = v21.White
  instance62.Font = Enum.Font.GothamBold
  instance62.TextSize = 10

  Instance.new("UICorner", instance62).CornerRadius = UDim.new(0, 6)
  local v67 = text5

  instance62.MouseButton1Click:Connect(function()
    v67 = not v67
    local startGreen = v67 and v21.StartGreen or v21.StopRed
    tweenService:Create(instance62, TweenInfo.new(0.2), { BackgroundColor3 = startGreen }):Play()
    instance62.Text = v67 and "ON" or "OFF"
    fn(v67)
    f6()
  end)
end

makeTextButton4("RGB Name", function(rainbowName) v21.RainbowName = rainbowName end, true)
makeTextButton4("RGB Bio", function(rainbowBio) v21.RainbowBio = rainbowBio end, true)

makeTextButton4(
  "Click Sound", function(clickSoundEnabled) v21.ClickSoundEnabled = clickSoundEnabled end, true
)

makeTextButton4(
  "Anti-Ban (V9 Titanium)", function(antiBanEnabled) _G.AntiBanEnabled = antiBanEnabled end,
  true
)

makeTextButton4("Hide Chat Bubbles", function(p14) end, false)

local terrain = workspace:FindFirstChildOfClass("Terrain")

makeTextButton4("Max FPS Boost", function(p15)
  if p15 then
    lighting.GlobalShadows = false
    lighting.FogEnd = 9000000000

    if terrain then
      terrain.WaterWaveSize = 0
      terrain.WaterWaveSpeed = 0
      terrain.WaterReflectance = 0
      terrain.WaterTransparency = 0
    end

    for key13, value27 in pairs(workspace:GetDescendants()) do
      if value27:IsA("BasePart") and not value27.Parent:FindFirstChild("Humanoid") then
        value27.Material = Enum.Material.SmoothPlastic
        value27.Reflectance = 0
      elseif value27:IsA("Decal") or value27:IsA("Texture") then
        value27.Transparency = 1
      elseif value27:IsA("ParticleEmitter") or value27:IsA("Trail") then
        value27.Enabled = false
      end
    end
  end
end, false)

local v68 = false

task.spawn(function()
  while task.wait(0.5) do
    if v68 then
      for key14, value28 in pairs(players:GetPlayers()) do
        if value28 ~= localPlayer and value28.Character then
          for key15, value29 in pairs(value28.Character:GetChildren()) do
            if value29:IsA("BasePart") then
              value29.CanCollide = false
              value29.Massless = true
              value29.Velocity = Vector3.new(0, 0, 0)
              value29.RotVelocity = Vector3.new(0, 0, 0)
            end
          end
        end
      end
    end
  end
end)

makeTextButton4("Anti Fling", function(p16) v68 = p16 end, false)
local connect

makeTextButton4("Noclip", function(p17)
  if p17 then
    connect = runService.Stepped:Connect(function()
      if localPlayer.Character then
        for key16, value30 in pairs(localPlayer.Character:GetChildren()) do
          if value30:IsA("BasePart") then
            value30.CanCollide = false
          end
        end
      end
    end)
  elseif connect then
    connect:Disconnect()
    connect = nil
  end
end, false)

local v69 = false

task.spawn(function()
  while task.wait(0.5) do
    if v69 and localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
      localPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

      if localPlayer.Character.Humanoid.Sit then
        localPlayer.Character.Humanoid.Sit = false
      end
    end
  end
end)

makeTextButton4("No Sit", function(p18)
  local v70 = not p18
  v69 = p18

  if v70 and localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
    localPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
  end
end, false)

local connect2

makeTextButton4("Anti AFK", function(p19)
  if p19 then
    connect2 = localPlayer.Idled:Connect(function()
      virtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
      task.wait(1)
      virtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
  elseif connect2 then
    connect2:Disconnect()
    connect2 = nil
  end
end, false)

local instance63 = Instance.new("UIListLayout", credits)
instance63.Padding = UDim.new(0, 10)
instance63.HorizontalAlignment = Enum.HorizontalAlignment.Center

Instance.new("UIPadding", credits).PaddingTop = UDim.new(0, 20)

local instance64 = Instance.new("Frame", credits)
instance64.Size = UDim2.new(0, 80, 0, 80)
instance64.BackgroundColor3 = v21.Section

Instance.new("UICorner", instance64).CornerRadius = UDim.new(1, 0)

local instance65 = Instance.new("TextLabel", instance64)
instance65.Size = UDim2.new(1, 0, 1, 0)
instance65.BackgroundTransparency = 1
instance65.Text = "⚔️"
instance65.TextColor3 = v21.White
instance65.Font = Enum.Font.GothamBlack
instance65.TextSize = 35

local instance66 = Instance.new("UIStroke", instance64)
instance66.Color = v21.MainColor
instance66.Thickness = 3

table.insert(v23.Borders, instance66)

local function makeTextLabel(text6, textColor3, textSize)
  local instance67 = Instance.new("TextLabel", credits)
  instance67.Size = UDim2.new(1, 0, 0, 20)
  instance67.BackgroundTransparency = 1
  instance67.Text = text6
  instance67.TextColor3 = textColor3
  instance67.Font = Enum.Font.GothamBold
  instance67.TextSize = textSize
end

makeTextLabel("Dev: FORB1D", v21.White, 14)
makeTextLabel("Tip: Use forbid music and forbid spammer for the best combo!", v21.Grey, 10)

local instance68 = Instance.new("TextLabel", credits)
instance68.Size = UDim2.new(0.9, 0, 0, 40)
instance68.BackgroundTransparency = 1
instance68.Text = "discord: forbiddenway"
instance68.TextColor3 = v21.Grey
instance68.Font = Enum.Font.Gotham
instance68.TextSize = 10
instance68.TextWrapped = true

repeat
  task.wait(0.1)
until not _G.ForbidLoading

instance19.Visible = true
f14()
local v71 = false
local v72 = false
local v73 = false

localPlayer.Chatted:Connect(function(message)
  local v74 = string.lower(message)
  local v75, v76

  if v74 == "!help" then
    task.spawn(function()
      f8("🔥 FORBID SPAMMER V1.6 COMMANDS 🔥")
      task.wait(v22)
      f8("⚡ !spam custom [text] -> Spams your custom message")
      task.wait(v22)
      f8("💀 !spam roast [name] -> Normal tech roasts")
      task.wait(v22)
      f8("👑 !spam self [name] -> God-Tier self flex roasts")
      task.wait(v22)
      f8("🛑 !stop -> Stops all active spamming")
    end)
  elseif string.sub(v74, 1, 13) == "!spam custom " then
    v76 = string.sub(message, 14)
    v71 = true
    v72 = false
    v73 = false

    task.spawn(function()
      while v71 do
        local v77 = f9(v76, "None")
        pcall(function() f8(v77) end)
        task.wait(v22 + math.random(0, 30) / 100)
      end
    end)
  elseif string.sub(v74, 1, 12) == "!spam roast " then
    string.sub(message, 13)
    v72 = true
    v71 = false
    v73 = false

    task.spawn(function()
      while v72 do
        task.wait(v22 + math.random(0, 30) / 100)
      end
    end)
  elseif string.sub(v74, 1, 11) == "!spam self " then
    v75 = string.sub(message, 12)
    v73 = true
    v71 = false
    v72 = false

    task.spawn(function()
      while v73 do
        local v78 = f9(v75, "Self")
        pcall(function() f8(v78) end)
        task.wait(v22 + math.random(0, 30) / 100)
      end
    end)
  elseif v74 == "!stop" then
    v71 = false
    v72 = false
    v73 = false
    v58 = false
    v59 = false
    v60 = false

    if instance50 then
      instance50.Text = "START"
      instance50.BackgroundColor3 = v21.StartGreen
    end

    if instance53 then
      instance53.Text = "START"
      instance53.BackgroundColor3 = v21.StartGreen
    end

    if instance56 then
      instance56.Text = "START"
      instance56.BackgroundColor3 = v21.StartGreen
    end
  end
end)

task.spawn(function() task.wait(2) end)



-- ============================================================
-- FORBID SPAMMER // CYBER PANEL UPGRADE
-- Premium cyber-console UI layer
-- GUI / inspection features only; existing core behavior remains untouched.
-- ============================================================

task.spawn(function()
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local Lighting = game:GetService("Lighting")
    local LocalPlayer = Players.LocalPlayer

    local CYAN = Color3.fromRGB(0, 235, 255)
    local CYAN_DARK = Color3.fromRGB(0, 105, 125)
    local BLACK = Color3.fromRGB(5, 7, 10)
    local PANEL = Color3.fromRGB(10, 14, 19)
    local PANEL2 = Color3.fromRGB(14, 20, 27)
    local LINE = Color3.fromRGB(25, 70, 82)
    local WHITE = Color3.fromRGB(235, 245, 248)
    local MUTED = Color3.fromRGB(125, 150, 158)
    local GREEN = Color3.fromRGB(65, 255, 150)
    local RED = Color3.fromRGB(255, 75, 95)
    local YELLOW = Color3.fromRGB(255, 205, 75)

    local old = nil
    pcall(function()
        old = (gethui and gethui() or game:GetService("CoreGui")):FindFirstChild("ForbidCyberPanel")
    end)
    if old then old:Destroy() end

    local guiParent = (gethui and gethui()) or game:GetService("CoreGui")
    local gui = Instance.new("ScreenGui")
    gui.Name = "ForbidCyberPanel"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.DisplayOrder = 20000
    gui.Parent = guiParent

    local function corner(obj, radius)
        local c = Instance.new("UICorner")
        c.CornerRadius = UDim.new(0, radius or 8)
        c.Parent = obj
        return c
    end

    local function stroke(obj, color, thickness, transparency)
        local s = Instance.new("UIStroke")
        s.Color = color or LINE
        s.Thickness = thickness or 1
        s.Transparency = transparency or 0
        s.Parent = obj
        return s
    end

    local function gradient(obj, a, b, rotation)
        local g = Instance.new("UIGradient")
        g.Color = ColorSequence.new(a, b)
        g.Rotation = rotation or 0
        g.Parent = obj
        return g
    end

    local function label(parent, text, size, color, font)
        local x = Instance.new("TextLabel")
        x.BackgroundTransparency = 1
        x.Text = text or ""
        x.TextColor3 = color or WHITE
        x.Font = font or Enum.Font.Gotham
        x.TextSize = size or 12
        x.TextXAlignment = Enum.TextXAlignment.Left
        x.Parent = parent
        return x
    end

    local function button(parent, text)
        local b = Instance.new("TextButton")
        b.AutoButtonColor = false
        b.Text = text
        b.TextColor3 = WHITE
        b.Font = Enum.Font.GothamBold
        b.TextSize = 11
        b.BackgroundColor3 = PANEL2
        b.BorderSizePixel = 0
        b.Parent = parent
        corner(b, 7)
        stroke(b, LINE, 1)
        b.MouseEnter:Connect(function()
            TweenService:Create(b, TweenInfo.new(.15), {
                BackgroundColor3 = Color3.fromRGB(18, 35, 43),
                TextColor3 = CYAN
            }):Play()
        end)
        b.MouseLeave:Connect(function()
            TweenService:Create(b, TweenInfo.new(.15), {
                BackgroundColor3 = PANEL2,
                TextColor3 = WHITE
            }):Play()
        end)
        return b
    end

    -- Main shell
    local shell = Instance.new("Frame")
    shell.Name = "CyberShell"
    shell.Size = UDim2.new(0, 850, 0, 520)
    shell.Position = UDim2.new(.5, -425, .5, -260)
    shell.BackgroundColor3 = BLACK
    shell.BorderSizePixel = 0
    shell.Parent = gui
    corner(shell, 12)
    stroke(shell, CYAN_DARK, 1.5)
    gradient(shell, Color3.fromRGB(6, 10, 14), Color3.fromRGB(12, 18, 24), 90)

    -- Dragging
    local dragging, dragStart, startPos
    local function makeDraggable(handle, target)
        handle.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
                or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = target.Position
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
                or input.UserInputType == Enum.UserInputType.Touch) then
                local delta = input.Position - dragStart
                target.Position = UDim2.new(
                    startPos.X.Scale, startPos.X.Offset + delta.X,
                    startPos.Y.Scale, startPos.Y.Offset + delta.Y
                )
            end
        end)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
                or input.UserInputType == Enum.UserInputType.Touch then
                dragging = false
            end
        end)
    end

    local top = Instance.new("Frame")
    top.Size = UDim2.new(1, 0, 0, 58)
    top.BackgroundColor3 = Color3.fromRGB(7, 12, 17)
    top.BorderSizePixel = 0
    top.Parent = shell
    corner(top, 12)
    makeDraggable(top, shell)

    local brand = label(top, "F0RBID // CYBER PANEL", 16, WHITE, Enum.Font.GothamBlack)
    brand.Position = UDim2.new(0, 18, 0, 8)
    brand.Size = UDim2.new(0, 300, 0, 22)

    local subtitle = label(top, "SECURE CONSOLE  •  LIVE SESSION", 9, MUTED, Enum.Font.GothamBold)
    subtitle.Position = UDim2.new(0, 19, 0, 32)
    subtitle.Size = UDim2.new(0, 300, 0, 14)

    local status = label(top, "● ONLINE", 10, GREEN, Enum.Font.GothamBold)
    status.Position = UDim2.new(1, -155, 0, 11)
    status.Size = UDim2.new(0, 85, 0, 18)
    status.TextXAlignment = Enum.TextXAlignment.Right

    local close = button(top, "×")
    close.Size = UDim2.new(0, 32, 0, 30)
    close.Position = UDim2.new(1, -42, 0, 14)
    close.TextSize = 18
    -- Left navigation
    local nav = Instance.new("Frame")
    nav.Size = UDim2.new(0, 150, 1, -70)
    nav.Position = UDim2.new(0, 10, 0, 65)
    nav.BackgroundColor3 = Color3.fromRGB(7, 11, 15)
    nav.BorderSizePixel = 0
    nav.Parent = shell
    corner(nav, 9)
    stroke(nav, LINE, 1)

    local navTitle = label(nav, "MODULES", 9, MUTED, Enum.Font.GothamBold)
    navTitle.Position = UDim2.new(0, 13, 0, 12)
    navTitle.Size = UDim2.new(1, -26, 0, 16)

    local navList = Instance.new("UIListLayout")
    navList.Padding = UDim.new(0, 6)
    navList.Parent = nav
    navList.HorizontalAlignment = Enum.HorizontalAlignment.Center

    local navPad = Instance.new("UIPadding")
    navPad.PaddingTop = UDim.new(0, 35)
    navPad.Parent = nav

    local content = Instance.new("Frame")
    content.Size = UDim2.new(1, -175, 1, -70)
    content.Position = UDim2.new(0, 165, 0, 65)
    content.BackgroundTransparency = 1
    content.Parent = shell

    local pages = {}
    local navButtons = {}
    local function page(name)
        local p = Instance.new("Frame")
        p.Name = name
        p.Size = UDim2.fromScale(1, 1)
        p.BackgroundTransparency = 1
        p.Visible = false
        p.Parent = content
        pages[name] = p
        return p
    end

    local function navButton(text, pageName)
        local b = button(nav, text)
        b.Size = UDim2.new(1, -16, 0, 38)
        navButtons[pageName] = b
        b.MouseButton1Click:Connect(function()
            for n, p in pairs(pages) do p.Visible = (n == pageName) end
            for n, nb in pairs(navButtons) do
                nb.BackgroundColor3 = (n == pageName) and Color3.fromRGB(10, 45, 55) or PANEL2
                nb.TextColor3 = (n == pageName) and CYAN or WHITE
            end
        end)
        return b
    end

    local dashboard = page("Dashboard")
    local playersPage = page("Players")
    local monitor = page("Monitor")
    local themesPage = page("Themes")
    local settingsPage = page("Settings")

    navButton("▣  DASHBOARD", "Dashboard")
    navButton("◈  PLAYERS", "Players")
    navButton("◉  MONITOR", "Monitor")
    navButton("✦  THEMES", "Themes")
    navButton("⚙  SETTINGS", "Settings")

    local mini = label(nav, "CYBER // 01", 8, CYAN_DARK, Enum.Font.GothamBold)
    mini.Position = UDim2.new(0, 13, 1, -28)
    mini.Size = UDim2.new(1, -26, 0, 14)

    -- Dashboard
    local dTitle = label(dashboard, "SYSTEM OVERVIEW", 18, WHITE, Enum.Font.GothamBlack)
    dTitle.Position = UDim2.new(0, 5, 0, 4)
    dTitle.Size = UDim2.new(1, -10, 0, 28)

    local dSub = label(dashboard, "Live client telemetry and session information", 10, MUTED)
    dSub.Position = UDim2.new(0, 6, 0, 31)
    dSub.Size = UDim2.new(1, -12, 0, 18)

    local cards = Instance.new("Frame")
    cards.Position = UDim2.new(0, 5, 0, 62)
    cards.Size = UDim2.new(1, -10, 0, 95)
    cards.BackgroundTransparency = 1
    cards.Parent = dashboard

    local cardLayout = Instance.new("UIGridLayout")
    cardLayout.CellSize = UDim2.new(0.24, 0, 1, 0)
    cardLayout.CellPadding = UDim2.new(0, 8, 0, 0)
    cardLayout.Parent = cards

    local cardValues = {}
    local function statCard(title, initial, color)
        local c = Instance.new("Frame")
        c.BackgroundColor3 = PANEL
        c.BorderSizePixel = 0
        c.Parent = cards
        corner(c, 9)
        stroke(c, LINE, 1)
        local t = label(c, title, 9, MUTED, Enum.Font.GothamBold)
        t.Position = UDim2.new(0, 10, 0, 10)
        t.Size = UDim2.new(1, -20, 0, 16)
        local v = label(c, tostring(initial), 22, color or CYAN, Enum.Font.GothamBlack)
        v.Position = UDim2.new(0, 10, 0, 32)
        v.Size = UDim2.new(1, -20, 0, 32)
        cardValues[title] = v
        return c
    end
    statCard("PLAYERS", #Players:GetPlayers(), CYAN)
    statCard("LOCAL USER", LocalPlayer.DisplayName, WHITE)
    statCard("PLACE ID", game.PlaceId, YELLOW)
    statCard("FPS", "--", GREEN)

    local info = Instance.new("Frame")
    info.Position = UDim2.new(0, 5, 0, 175)
    info.Size = UDim2.new(1, -10, 0, 150)
    info.BackgroundColor3 = PANEL
    info.BorderSizePixel = 0
    info.Parent = dashboard
    corner(info, 9)
    stroke(info, LINE, 1)

    local it = label(info, "SESSION MATRIX", 10, CYAN, Enum.Font.GothamBold)
    it.Position = UDim2.new(0, 14, 0, 12)
    it.Size = UDim2.new(1, -28, 0, 18)

    local lines = {
        "Client: " .. LocalPlayer.Name,
        "UserId: " .. tostring(LocalPlayer.UserId),
        "Players in server: " .. tostring(#Players:GetPlayers()),
        "Camera mode: " .. tostring(workspace.CurrentCamera and workspace.CurrentCamera.CameraType or "Unknown"),
        "GUI state: ONLINE",
    }
    for i, txt in ipairs(lines) do
        local l = label(info, txt, 10, i == 1 and WHITE or MUTED)
        l.Position = UDim2.new(0, 14, 0, 35 + (i - 1) * 21)
        l.Size = UDim2.new(1, -28, 0, 18)
    end

    -- Players page
    local pTitle = label(playersPage, "PLAYER NETWORK", 18, WHITE, Enum.Font.GothamBlack)
    pTitle.Position = UDim2.new(0, 5, 0, 4)
    pTitle.Size = UDim2.new(1, -10, 0, 28)

    local search = Instance.new("TextBox")
    search.Size = UDim2.new(0, 230, 0, 34)
    search.Position = UDim2.new(0, 5, 0, 40)
    search.BackgroundColor3 = PANEL
    search.BorderSizePixel = 0
    search.Text = ""
    search.PlaceholderText = "Search player..."
    search.PlaceholderColor3 = MUTED
    search.TextColor3 = WHITE
    search.Font = Enum.Font.Gotham
    search.TextSize = 11
    search.ClearTextOnFocus = false
    search.Parent = playersPage
    corner(search, 7)
    stroke(search, LINE, 1)
    local searchPad = Instance.new("UIPadding")
    searchPad.PaddingLeft = UDim.new(0, 10)
    searchPad.Parent = search

    local refresh = button(playersPage, "⟳  REFRESH")
    refresh.Size = UDim2.new(0, 105, 0, 34)
    refresh.Position = UDim2.new(0, 245, 0, 40)

    local list = Instance.new("ScrollingFrame")
    list.Size = UDim2.new(0, 335, 1, -88)
    list.Position = UDim2.new(0, 5, 0, 82)
    list.BackgroundColor3 = PANEL
    list.BorderSizePixel = 0
    list.ScrollBarThickness = 3
    list.ScrollBarImageColor3 = CYAN_DARK
    list.CanvasSize = UDim2.new()
    list.AutomaticCanvasSize = Enum.AutomaticSize.Y
    list.Parent = playersPage
    corner(list, 9)
    stroke(list, LINE, 1)

    local listLayout = Instance.new("UIListLayout")
    listLayout.Padding = UDim.new(0, 5)
    listLayout.Parent = list
    local listPad = Instance.new("UIPadding")
    listPad.PaddingTop = UDim.new(0, 7)
    listPad.PaddingLeft = UDim.new(0, 7)
    listPad.PaddingRight = UDim.new(0, 7)
    listPad.Parent = list

    local detail = Instance.new("Frame")
    detail.Size = UDim2.new(1, -355, 1, -88)
    detail.Position = UDim2.new(0, 350, 0, 82)
    detail.BackgroundColor3 = PANEL
    detail.BorderSizePixel = 0
    detail.Parent = playersPage
    corner(detail, 9)
    stroke(detail, LINE, 1)

    local avatar = Instance.new("ImageLabel")
    avatar.Size = UDim2.new(0, 82, 0, 82)
    avatar.Position = UDim2.new(.5, -41, 0, 20)
    avatar.BackgroundColor3 = PANEL2
    avatar.BorderSizePixel = 0
    avatar.Parent = detail
    corner(avatar, 12)

    local selectedName = label(detail, "NO PLAYER SELECTED", 14, WHITE, Enum.Font.GothamBlack)
    selectedName.Position = UDim2.new(0, 12, 0, 112)
    selectedName.Size = UDim2.new(1, -24, 0, 22)
    selectedName.TextXAlignment = Enum.TextXAlignment.Center

    local selectedMeta = label(detail, "Select a player from the live list", 9, MUTED)
    selectedMeta.Position = UDim2.new(0, 12, 0, 137)
    selectedMeta.Size = UDim2.new(1, -24, 0, 18)
    selectedMeta.TextXAlignment = Enum.TextXAlignment.Center

    local detailBox = Instance.new("Frame")
    detailBox.Position = UDim2.new(0, 12, 0, 170)
    detailBox.Size = UDim2.new(1, -24, 0, 115)
    detailBox.BackgroundColor3 = PANEL2
    detailBox.BorderSizePixel = 0
    detailBox.Parent = detail
    corner(detailBox, 7)

    local detailLines = {}
    for i = 1, 5 do
        local dl = label(detailBox, "", 9, MUTED)
        dl.Position = UDim2.new(0, 10, 0, 8 + (i - 1) * 20)
        dl.Size = UDim2.new(1, -20, 0, 16)
        detailLines[i] = dl
    end

    local spectate = button(detail, "◎  SPECTATE")
    spectate.Size = UDim2.new(0.46, -6, 0, 34)
    spectate.Position = UDim2.new(0, 12, 1, -48)

    local stopSpectate = button(detail, "■  LOCAL CAMERA")
    stopSpectate.Size = UDim2.new(0.46, -6, 0, 34)
    stopSpectate.Position = UDim2.new(.54, -6, 1, -48)

    local selectedPlayer = nil
    local oldCameraSubject = nil

    local function setDetails(p)
        selectedPlayer = p
        if not p then
            selectedName.Text = "NO PLAYER SELECTED"
            selectedMeta.Text = "Select a player from the live list"
            avatar.Image = ""
            for _, x in ipairs(detailLines) do x.Text = "" end
            return
        end

        selectedName.Text = p.DisplayName
        selectedMeta.Text = "@" .. p.Name
        pcall(function()
            avatar.Image = Players:GetUserThumbnailAsync(
                p.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150
            )
        end)

        local hum = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
        local hp = hum and math.floor(hum.Health) or 0
        local maxHp = hum and math.floor(hum.MaxHealth) or 0
        local team = p.Team and p.Team.Name or "No Team"

        detailLines[1].Text = "USER ID     : " .. tostring(p.UserId)
        detailLines[2].Text = "ACCOUNT AGE : " .. tostring(p.AccountAge) .. " days"
        detailLines[3].Text = "HEALTH      : " .. tostring(hp) .. " / " .. tostring(maxHp)
        detailLines[4].Text = "TEAM        : " .. team
        detailLines[5].Text = "CHARACTER   : " .. (p.Character and "LOADED" or "NOT LOADED")
    end

    local function rebuildPlayers()
        for _, child in ipairs(list:GetChildren()) do
            if child:IsA("TextButton") then child:Destroy() end
        end
        local q = string.lower(search.Text or "")
        local all = Players:GetPlayers()
        table.sort(all, function(a, b) return string.lower(a.Name) < string.lower(b.Name) end)

        for _, p in ipairs(all) do
            if q == "" or string.find(string.lower(p.Name), q, 1, true)
                or string.find(string.lower(p.DisplayName), q, 1, true) then

                local row = button(list, "")
                row.Size = UDim2.new(1, 0, 0, 46)
                row.Text = ""
                local dot = Instance.new("Frame")
                dot.Size = UDim2.new(0, 7, 0, 7)
                dot.Position = UDim2.new(0, 10, .5, -3)
                dot.BackgroundColor3 = (p == LocalPlayer) and YELLOW or GREEN
                dot.BorderSizePixel = 0
                dot.Parent = row
                corner(dot, 99)

                local name = label(row, p.DisplayName, 11, WHITE, Enum.Font.GothamBold)
                name.Position = UDim2.new(0, 26, 0, 6)
                name.Size = UDim2.new(1, -35, 0, 17)

                local uname = label(row, "@" .. p.Name .. "  •  " .. tostring(p.UserId), 8, MUTED)
                uname.Position = UDim2.new(0, 26, 0, 24)
                uname.Size = UDim2.new(1, -35, 0, 14)

                row.MouseButton1Click:Connect(function()
                    setDetails(p)
                end)
            end
        end

        cardValues["PLAYERS"].Text = tostring(#all)
    end

    search:GetPropertyChangedSignal("Text"):Connect(rebuildPlayers)
    refresh.MouseButton1Click:Connect(rebuildPlayers)
    Players.PlayerAdded:Connect(rebuildPlayers)
    Players.PlayerRemoving:Connect(function(p)
        if selectedPlayer == p then setDetails(nil) end
        rebuildPlayers()
    end)

    spectate.MouseButton1Click:Connect(function()
        if selectedPlayer and selectedPlayer.Character then
            local hum = selectedPlayer.Character:FindFirstChildOfClass("Humanoid")
            if hum and workspace.CurrentCamera then
                oldCameraSubject = workspace.CurrentCamera.CameraSubject
                workspace.CurrentCamera.CameraSubject = hum
                status.Text = "● SPECTATING"
                status.TextColor3 = YELLOW
            end
        end
    end)

    stopSpectate.MouseButton1Click:Connect(function()
        if workspace.CurrentCamera then
            workspace.CurrentCamera.CameraSubject =
                LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                or oldCameraSubject
        end
        status.Text = "● ONLINE"
        status.TextColor3 = GREEN
    end)

    rebuildPlayers()

    -- Monitor
    local mTitle = label(monitor, "LIVE MONITOR", 18, WHITE, Enum.Font.GothamBlack)
    mTitle.Position = UDim2.new(0, 5, 0, 4)
    mTitle.Size = UDim2.new(1, -10, 0, 28)

    local terminal = Instance.new("ScrollingFrame")
    terminal.Position = UDim2.new(0, 5, 0, 45)
    terminal.Size = UDim2.new(1, -10, 1, -50)
    terminal.BackgroundColor3 = Color3.fromRGB(3, 6, 8)
    terminal.BorderSizePixel = 0
    terminal.ScrollBarThickness = 3
    terminal.Parent = monitor
    corner(terminal, 8)
    stroke(terminal, LINE, 1)

    local termLayout = Instance.new("UIListLayout")
    termLayout.Padding = UDim.new(0, 2)
    termLayout.Parent = terminal

    local function logLine(msg, color)
        local l = label(terminal, "> " .. msg, 9, color or MUTED, Enum.Font.Code)
        l.Size = UDim2.new(1, -16, 0, 16)
        l.Position = UDim2.new(0, 8, 0, 0)
        return l
    end

    logLine("CYBER PANEL INITIALIZED", CYAN)
    logLine("Session user: " .. LocalPlayer.Name, WHITE)
    logLine("Live player watcher: ACTIVE", GREEN)
    logLine("Player search index: READY", GREEN)
    logLine("Spectate module: READY", GREEN)
    logLine("Theme engine: READY", GREEN)
    logLine("Waiting for events...", MUTED)

    Players.PlayerAdded:Connect(function(p)
        logLine("[JOIN] " .. p.Name .. " / " .. tostring(p.UserId), GREEN)
    end)
    Players.PlayerRemoving:Connect(function(p)
        logLine("[LEAVE] " .. p.Name, RED)
    end)

    -- Themes
    local thTitle = label(themesPage, "THEME MATRIX", 18, WHITE, Enum.Font.GothamBlack)
    thTitle.Position = UDim2.new(0, 5, 0, 4)
    thTitle.Size = UDim2.new(1, -10, 0, 28)

    local thSub = label(themesPage, "Choose the visual accent for the cyber console", 10, MUTED)
    thSub.Position = UDim2.new(0, 6, 0, 31)
    thSub.Size = UDim2.new(1, -12, 0, 18)

    local themeRow = Instance.new("Frame")
    themeRow.Position = UDim2.new(0, 5, 0, 65)
    themeRow.Size = UDim2.new(1, -10, 0, 150)
    themeRow.BackgroundTransparency = 1
    themeRow.Parent = themesPage
    local tl = Instance.new("UIGridLayout")
    tl.CellSize = UDim2.new(.31, 0, 0, 42)
    tl.CellPadding = UDim2.new(.02, 0, 0, 8)
    tl.Parent = themeRow

    local function themeButton(name, color)
        local b = button(themeRow, name)
        b.BackgroundColor3 = PANEL
        b.TextColor3 = color
        b.MouseButton1Click:Connect(function()
            for _, obj in ipairs(gui:GetDescendants()) do
                if obj:IsA("UIStroke") and obj.Color == CYAN_DARK then
                    obj.Color = color
                elseif obj:IsA("TextLabel") and obj.Text == "● ONLINE" then
                    obj.TextColor3 = color
                end
            end
        end)
    end
    themeButton("CYAN // MATRIX", CYAN)
    themeButton("PURPLE // VOID", Color3.fromRGB(190, 100, 255))
    themeButton("RED // ALERT", RED)
    themeButton("GREEN // TERMINAL", GREEN)
    themeButton("GOLD // PRIME", YELLOW)
    themeButton("ICE // SILVER", Color3.fromRGB(190, 225, 235))

    -- Settings
    local sTitle = label(settingsPage, "CONSOLE SETTINGS", 18, WHITE, Enum.Font.GothamBlack)
    sTitle.Position = UDim2.new(0, 5, 0, 4)
    sTitle.Size = UDim2.new(1, -10, 0, 28)

    local sInfo = Instance.new("Frame")
    sInfo.Position = UDim2.new(0, 5, 0, 50)
    sInfo.Size = UDim2.new(1, -10, 0, 190)
    sInfo.BackgroundColor3 = PANEL
    sInfo.BorderSizePixel = 0
    sInfo.Parent = settingsPage
    corner(sInfo, 9)
    stroke(sInfo, LINE, 1)

    local settingsText = {
        "• Drag the top bar to move the panel.",
        "• Use PLAYERS to inspect everyone currently in the server.",
        "• Search filters by username or display name.",
        "• Spectate follows the selected player's Humanoid.",
        "• REFRESH rebuilds the live player index.",
        "• Theme buttons change the console accent.",
        "• Close with ×; reopen with the floating CYBER button.",
    }
    for i, txt in ipairs(settingsText) do
        local l = label(sInfo, txt, 10, i == 1 and CYAN or MUTED)
        l.Position = UDim2.new(0, 14, 0, 14 + (i - 1) * 24)
        l.Size = UDim2.new(1, -28, 0, 18)
    end

    -- Floating reopen button
    local reopen = button(gui, "C")
    reopen.Size = UDim2.new(0, 48, 0, 48)
    reopen.Position = UDim2.new(0, 18, .55, 0)
    reopen.BackgroundColor3 = Color3.fromRGB(5, 14, 18)
    reopen.TextColor3 = CYAN
    reopen.TextSize = 20
    corner(reopen, 14)
    stroke(reopen, CYAN_DARK, 1.5)
    reopen.Visible = false
    reopen.MouseButton1Click:Connect(function()
        gui.Enabled = true
        shell.Visible = true
        reopen.Visible = false
    end)

    close.MouseButton1Click:Connect(function()
        shell.Visible = false
        reopen.Visible = true
    end)

    -- FPS meter
    local frames = 0
    local last = os.clock()
    RunService.RenderStepped:Connect(function()
        frames += 1
        local now = os.clock()
        if now - last >= 1 then
            local fps = math.floor(frames / (now - last))
            frames = 0
            last = now
            if cardValues["FPS"] then cardValues["FPS"].Text = tostring(fps) end
        end
    end)

    -- Responsive scaling
    local scale = Instance.new("UIScale")
    scale.Parent = shell
    local function resize()
        local cam = workspace.CurrentCamera
        if not cam then return end
        local v = cam.ViewportSize
        if v.X < 700 then
            scale.Scale = math.clamp(v.X / 900, .72, .88)
        else
            scale.Scale = math.clamp(v.X / 1000, .88, 1)
        end
    end
    if workspace.CurrentCamera then
        workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(resize)
    end
    resize()

    -- Scanline / cyber pulse
    local scan = Instance.new("Frame")
    scan.Size = UDim2.new(1, -2, 0, 2)
    scan.Position = UDim2.new(0, 1, 0, 58)
    scan.BackgroundColor3 = CYAN
    scan.BackgroundTransparency = .72
    scan.BorderSizePixel = 0
    scan.Parent = shell

    task.spawn(function()
        while gui.Parent do
            TweenService:Create(scan, TweenInfo.new(1.8, Enum.EasingStyle.Linear), {
                Position = UDim2.new(0, 1, 1, -4)
            }):Play()
            task.wait(1.8)
            scan.Position = UDim2.new(0, 1, 0, 58)
        end
    end)

    -- Default page
    pages.Dashboard.Visible = true
    navButtons.Dashboard.BackgroundColor3 = Color3.fromRGB(10, 45, 55)
    navButtons.Dashboard.TextColor3 = CYAN

    shell.BackgroundTransparency = 1
    shell.Size = UDim2.new(0, 800, 0, 490)
    TweenService:Create(shell, TweenInfo.new(.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0,
        Size = UDim2.new(0, 850, 0, 520)
    }):Play()
end)

-- ============================================================
-- FORBID SPAMMER // CELESTIAL PREMIUM UPGRADE
-- Adds: top Chat Roast module, Celestial theme, Avatar ID viewer,
-- whole-window dragging, minimize/restore, and mobile-friendly UI.
-- ============================================================

task.spawn(function()
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local LocalPlayer = Players.LocalPlayer
    local Camera = workspace.CurrentCamera

    task.wait(0.35)

    local old = nil
    pcall(function()
        local parent = (gethui and gethui()) or game:GetService("CoreGui")
        old = parent:FindFirstChild("ForbidCyberPanel")
    end)
    if old then
        old:Destroy()
    end

    local parent = (gethui and gethui()) or game:GetService("CoreGui")
    local gui = Instance.new("ScreenGui")
    gui.Name = "ForbidCelestialPanel"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.DisplayOrder = 25000
    gui.Parent = parent

    -- Celestial palette
    local BG = Color3.fromRGB(5, 6, 18)
    local PANEL = Color3.fromRGB(10, 12, 30)
    local PANEL2 = Color3.fromRGB(16, 18, 43)
    local PANEL3 = Color3.fromRGB(23, 24, 55)
    local STAR = Color3.fromRGB(205, 225, 255)
    local BLUE = Color3.fromRGB(95, 180, 255)
    local VIOLET = Color3.fromRGB(170, 105, 255)
    local PINK = Color3.fromRGB(235, 125, 255)
    local GREEN = Color3.fromRGB(95, 255, 190)
    local GOLD = Color3.fromRGB(255, 220, 120)
    local RED = Color3.fromRGB(255, 105, 125)
    local MUTED = Color3.fromRGB(135, 145, 180)
    local LINE = Color3.fromRGB(66, 70, 125)
    local WHITE = Color3.fromRGB(242, 245, 255)

    local function corner(o, r)
        local c = Instance.new("UICorner")
        c.CornerRadius = UDim.new(0, r or 8)
        c.Parent = o
        return c
    end

    local function stroke(o, color, thickness)
        local st = Instance.new("UIStroke")
        st.Color = color or LINE
        st.Thickness = thickness or 1
        st.Parent = o
        return st
    end

    local function label(parent2, text, size, color, font)
        local l = Instance.new("TextLabel")
        l.BackgroundTransparency = 1
        l.Text = text or ""
        l.TextColor3 = color or WHITE
        l.Font = font or Enum.Font.Gotham
        l.TextSize = size or 12
        l.TextXAlignment = Enum.TextXAlignment.Left
        l.Parent = parent2
        return l
    end

    local function button(parent2, text, accent)
        local b = Instance.new("TextButton")
        b.AutoButtonColor = false
        b.BackgroundColor3 = PANEL2
        b.BorderSizePixel = 0
        b.Text = text
        b.TextColor3 = accent or WHITE
        b.Font = Enum.Font.GothamBold
        b.TextSize = 11
        b.Parent = parent2
        corner(b, 7)
        stroke(b, LINE, 1)
        b.MouseEnter:Connect(function()
            TweenService:Create(b, TweenInfo.new(.12), {
                BackgroundColor3 = PANEL3,
                TextColor3 = accent or BLUE
            }):Play()
        end)
        b.MouseLeave:Connect(function()
            TweenService:Create(b, TweenInfo.new(.12), {
                BackgroundColor3 = PANEL2,
                TextColor3 = accent or WHITE
            }):Play()
        end)
        return b
    end

    -- Main shell
    local shell = Instance.new("Frame")
    shell.Name = "CelestialShell"
    shell.Size = UDim2.new(0, 900, 0, 560)
    shell.Position = UDim2.new(.5, -450, .5, -280)
    shell.BackgroundColor3 = BG
    shell.BorderSizePixel = 0
    shell.Parent = gui
    corner(shell, 16)
    stroke(shell, VIOLET, 1.6)

    local shellGradient = Instance.new("UIGradient")
    shellGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(5, 7, 24)),
        ColorSequenceKeypoint.new(.5, Color3.fromRGB(11, 8, 28)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 10, 25))
    })
    shellGradient.Rotation = 35
    shellGradient.Parent = shell

    -- Whole-window dragging: clicking anywhere on the shell can start a drag,
    -- while buttons/text boxes keep their normal click/focus behavior.
    local dragging = false
    local dragStart
    local startPos

    shell.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = shell.Position
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            shell.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    -- Star field
    local starLayer = Instance.new("Frame")
    starLayer.Size = UDim2.fromScale(1, 1)
    starLayer.BackgroundTransparency = 1
    starLayer.ClipsDescendants = true
    starLayer.ZIndex = 0
    starLayer.Parent = shell

    for i = 1, 55 do
        local dot = Instance.new("Frame")
        local size = math.random(1, 3)
        dot.Size = UDim2.fromOffset(size, size)
        dot.Position = UDim2.new(math.random(), 0, math.random(), 0)
        dot.BackgroundColor3 = (i % 4 == 0) and VIOLET or STAR
        dot.BackgroundTransparency = math.random(20, 70) / 100
        dot.BorderSizePixel = 0
        dot.ZIndex = 0
        dot.Parent = starLayer
        corner(dot, 99)
        task.spawn(function()
            while dot.Parent do
                local target = math.random(25, 85) / 100
                TweenService:Create(dot, TweenInfo.new(math.random(8, 18) / 10), {
                    BackgroundTransparency = target
                }):Play()
                task.wait(math.random(8, 18) / 10)
            end
        end)
    end

    local top = Instance.new("Frame")
    top.Size = UDim2.new(1, 0, 0, 62)
    top.BackgroundColor3 = Color3.fromRGB(8, 8, 25)
    top.BackgroundTransparency = .08
    top.BorderSizePixel = 0
    top.ZIndex = 5
    top.Parent = shell
    corner(top, 16)

    local title = label(top, "✦  F0RBID // CELESTIAL", 17, WHITE, Enum.Font.GothamBlack)
    title.Position = UDim2.new(0, 18, 0, 8)
    title.Size = UDim2.new(0, 360, 0, 22)
    title.ZIndex = 6

    local subtitle = label(top, "CHAT ROAST  •  PLAYERS  •  AVATAR INTEL  •  PREMIUM CONSOLE", 8, MUTED, Enum.Font.GothamBold)
    subtitle.Position = UDim2.new(0, 20, 0, 34)
    subtitle.Size = UDim2.new(0, 500, 0, 15)
    subtitle.ZIndex = 6

    local status = label(top, "● CELESTIAL ONLINE", 9, GREEN, Enum.Font.GothamBold)
    status.Position = UDim2.new(1, -245, 0, 10)
    status.Size = UDim2.new(0, 150, 0, 18)
    status.TextXAlignment = Enum.TextXAlignment.Right
    status.ZIndex = 6

    local minimize = button(top, "—", VIOLET)
    minimize.Size = UDim2.fromOffset(34, 30)
    minimize.Position = UDim2.new(1, -82, 0, 16)
    minimize.TextSize = 16
    minimize.ZIndex = 7

    local close = button(top, "×", PINK)
    close.Size = UDim2.fromOffset(34, 30)
    close.Position = UDim2.new(1, -42, 0, 16)
    close.TextSize = 18
    close.ZIndex = 7

    -- Navigation
    local nav = Instance.new("Frame")
    nav.Size = UDim2.new(0, 158, 1, -76)
    nav.Position = UDim2.new(0, 10, 0, 70)
    nav.BackgroundColor3 = PANEL
    nav.BorderSizePixel = 0
    nav.ZIndex = 3
    nav.Parent = shell
    corner(nav, 10)
    stroke(nav, LINE, 1)

    local navTitle = label(nav, "CELESTIAL MODULES", 8, MUTED, Enum.Font.GothamBold)
    navTitle.Position = UDim2.new(0, 12, 0, 12)
    navTitle.Size = UDim2.new(1, -24, 0, 16)

    local navList = Instance.new("UIListLayout")
    navList.Padding = UDim.new(0, 6)
    navList.HorizontalAlignment = Enum.HorizontalAlignment.Center
    navList.Parent = nav

    local pad = Instance.new("UIPadding")
    pad.PaddingTop = UDim.new(0, 36)
    pad.Parent = nav

    local content = Instance.new("Frame")
    content.Size = UDim2.new(1, -178, 1, -76)
    content.Position = UDim2.new(0, 168, 0, 70)
    content.BackgroundTransparency = 1
    content.ZIndex = 3
    content.Parent = shell

    local pages = {}
    local navButtons = {}

    local function makePage(name)
        local p = Instance.new("Frame")
        p.Name = name
        p.Size = UDim2.fromScale(1, 1)
        p.BackgroundTransparency = 1
        p.Visible = false
        p.ZIndex = 3
        p.Parent = content
        pages[name] = p
        return p
    end

    local function navButton(text, name, accent)
        local b = button(nav, text, accent or WHITE)
        b.Size = UDim2.new(1, -16, 0, 39)
        navButtons[name] = b
        b.MouseButton1Click:Connect(function()
            for n, p in pairs(pages) do
                p.Visible = (n == name)
            end
            for n, x in pairs(navButtons) do
                x.BackgroundColor3 = (n == name) and Color3.fromRGB(27, 20, 58) or PANEL2
                x.TextColor3 = (n == name) and (accent or VIOLET) or WHITE
            end
        end)
        return b
    end

    local roastPage = makePage("ChatRoast")
    local playersPage = makePage("Players")
    local avatarPage = makePage("AvatarIDs")
    local monitorPage = makePage("Monitor")
    local settingsPage = makePage("Settings")

    navButton("✦  CHAT ROAST", "ChatRoast", PINK)
    navButton("◈  PLAYER LIST", "Players", BLUE)
    navButton("◇  AVATAR IDs", "AvatarIDs", VIOLET)
    navButton("◉  MONITOR", "Monitor", GREEN)
    navButton("⚙  SETTINGS", "Settings", GOLD)

    local navFooter = label(nav, "CELESTIAL // 02", 8, VIOLET, Enum.Font.GothamBold)
    navFooter.Position = UDim2.new(0, 12, 1, -28)
    navFooter.Size = UDim2.new(1, -24, 0, 14)

    -- CHAT ROAST TOP MODULE
    local rt = label(roastPage, "CHAT ROAST", 20, WHITE, Enum.Font.GothamBlack)
    rt.Position = UDim2.new(0, 6, 0, 4)
    rt.Size = UDim2.new(1, -12, 0, 30)

    local rs = label(roastPage, "Original roast section • single-message preview controls", 10, MUTED)
    rs.Position = UDim2.new(0, 7, 0, 33)
    rs.Size = UDim2.new(1, -14, 0, 18)

    local roastBox = Instance.new("Frame")
    roastBox.Position = UDim2.new(0, 6, 0, 62)
    roastBox.Size = UDim2.new(1, -12, 0, 165)
    roastBox.BackgroundColor3 = PANEL
    roastBox.BorderSizePixel = 0
    roastBox.Parent = roastPage
    corner(roastBox, 10)
    stroke(roastBox, Color3.fromRGB(95, 60, 135), 1)

    local roastHeader = label(roastBox, "ORIGINAL CHAT ROAST", 11, PINK, Enum.Font.GothamBold)
    roastHeader.Position = UDim2.new(0, 14, 0, 12)
    roastHeader.Size = UDim2.new(1, -28, 0, 18)

    local targetBox = Instance.new("TextBox")
    targetBox.Position = UDim2.new(0, 14, 0, 42)
    targetBox.Size = UDim2.new(1, -28, 0, 36)
    targetBox.BackgroundColor3 = PANEL2
    targetBox.BorderSizePixel = 0
    targetBox.Text = ""
    targetBox.PlaceholderText = "Optional player name / target..."
    targetBox.PlaceholderColor3 = MUTED
    targetBox.TextColor3 = WHITE
    targetBox.Font = Enum.Font.Gotham
    targetBox.TextSize = 11
    targetBox.ClearTextOnFocus = false
    targetBox.Parent = roastBox
    corner(targetBox, 7)
    stroke(targetBox, LINE, 1)
    local tp = Instance.new("UIPadding")
    tp.PaddingLeft = UDim.new(0, 10)
    tp.Parent = targetBox

    local normalRoast = button(roastBox, "NORMAL ROAST", PINK)
    normalRoast.Size = UDim2.new(.31, -8, 0, 34)
    normalRoast.Position = UDim2.new(0, 14, 0, 93)

    local selfRoast = button(roastBox, "SELF ROAST", VIOLET)
    selfRoast.Size = UDim2.new(.31, -8, 0, 34)
    selfRoast.Position = UDim2.new(.345, -8, 0, 93)

    local copyPreview = button(roastBox, "PREVIEW", BLUE)
    copyPreview.Size = UDim2.new(.31, -8, 0, 34)
    copyPreview.Position = UDim2.new(.69, -8, 0, 93)

    local roastPreview = label(roastBox, "Preview: ready", 9, MUTED, Enum.Font.Code)
    roastPreview.Position = UDim2.new(0, 14, 0, 135)
    roastPreview.Size = UDim2.new(1, -28, 0, 20)

    local function pick(list)
        if type(list) ~= "table" or #list == 0 then
            return "No roast entries available."
        end
        return list[math.random(1, #list)]
    end

    normalRoast.MouseButton1Click:Connect(function()
        local text = pick(v29)
        if targetBox.Text ~= "" then
            text = targetBox.Text .. " • " .. text
        end
        roastPreview.Text = "Preview: " .. text
        -- Preview-only: does not start a spam loop.
    end)

    selfRoast.MouseButton1Click:Connect(function()
        local text = pick(v30)
        roastPreview.Text = "Preview: " .. text
    end)

    copyPreview.MouseButton1Click:Connect(function()
        if setclipboard then
            pcall(function() setclipboard(string.gsub(roastPreview.Text, "^Preview:%s*", "")) end)
            status.Text = "● COPIED PREVIEW"
            status.TextColor3 = BLUE
            task.delay(1.2, function()
                if status.Parent then
                    status.Text = "● CELESTIAL ONLINE"
                    status.TextColor3 = GREEN
                end
            end)
        else
            status.Text = "● PREVIEW READY"
            status.TextColor3 = GOLD
        end
    end)

    local roastInfo = Instance.new("Frame")
    roastInfo.Position = UDim2.new(0, 6, 0, 239)
    roastInfo.Size = UDim2.new(1, -12, 0, 100)
    roastInfo.BackgroundColor3 = PANEL
    roastInfo.BorderSizePixel = 0
    roastInfo.Parent = roastPage
    corner(roastInfo, 10)
    stroke(roastInfo, LINE, 1)

    local ri = label(roastInfo,
        "Original roast presets are surfaced here as a dedicated top module.\n"
        .. "Use NORMAL ROAST / SELF ROAST to generate a preview. The preview controls do not run an automatic spam loop.",
        10, MUTED)
    ri.Position = UDim2.new(0, 14, 0, 12)
    ri.Size = UDim2.new(1, -28, 0, 70)
    ri.TextWrapped = true

    -- PLAYER LIST
    local pt = label(playersPage, "PLAYER LIST", 20, WHITE, Enum.Font.GothamBlack)
    pt.Position = UDim2.new(0, 6, 0, 4)
    pt.Size = UDim2.new(1, -12, 0, 30)

    local search = Instance.new("TextBox")
    search.Position = UDim2.new(0, 6, 0, 42)
    search.Size = UDim2.new(0, 245, 0, 34)
    search.BackgroundColor3 = PANEL
    search.BorderSizePixel = 0
    search.Text = ""
    search.PlaceholderText = "Search username / display name..."
    search.PlaceholderColor3 = MUTED
    search.TextColor3 = WHITE
    search.Font = Enum.Font.Gotham
    search.TextSize = 10
    search.ClearTextOnFocus = false
    search.Parent = playersPage
    corner(search, 7)
    stroke(search, LINE, 1)
    local sp = Instance.new("UIPadding")
    sp.PaddingLeft = UDim.new(0, 10)
    sp.Parent = search

    local refresh = button(playersPage, "⟳ REFRESH", BLUE)
    refresh.Position = UDim2.new(0, 258, 0, 42)
    refresh.Size = UDim2.new(0, 105, 0, 34)

    local playerList = Instance.new("ScrollingFrame")
    playerList.Position = UDim2.new(0, 6, 0, 84)
    playerList.Size = UDim2.new(0, 365, 1, -90)
    playerList.BackgroundColor3 = PANEL
    playerList.BorderSizePixel = 0
    playerList.ScrollBarThickness = 3
    playerList.ScrollBarImageColor3 = VIOLET
    playerList.AutomaticCanvasSize = Enum.AutomaticSize.Y
    playerList.Parent = playersPage
    corner(playerList, 9)
    stroke(playerList, LINE, 1)

    local playout = Instance.new("UIListLayout")
    playout.Padding = UDim.new(0, 5)
    playout.Parent = playerList

    local pp = Instance.new("UIPadding")
    pp.PaddingTop = UDim.new(0, 7)
    pp.PaddingLeft = UDim.new(0, 7)
    pp.PaddingRight = UDim.new(0, 7)
    pp.Parent = playerList

    local selected = nil
    local detail = Instance.new("Frame")
    detail.Position = UDim2.new(0, 382, 0, 84)
    detail.Size = UDim2.new(1, -388, 1, -90)
    detail.BackgroundColor3 = PANEL
    detail.BorderSizePixel = 0
    detail.Parent = playersPage
    corner(detail, 9)
    stroke(detail, LINE, 1)

    local pAvatar = Instance.new("ImageLabel")
    pAvatar.Position = UDim2.new(.5, -44, 0, 16)
    pAvatar.Size = UDim2.fromOffset(88, 88)
    pAvatar.BackgroundColor3 = PANEL2
    pAvatar.BorderSizePixel = 0
    pAvatar.Parent = detail
    corner(pAvatar, 14)

    local pName = label(detail, "NO PLAYER SELECTED", 14, WHITE, Enum.Font.GothamBlack)
    pName.Position = UDim2.new(0, 10, 0, 112)
    pName.Size = UDim2.new(1, -20, 0, 22)
    pName.TextXAlignment = Enum.TextXAlignment.Center

    local pMeta = label(detail, "Select a player from the list", 9, MUTED)
    pMeta.Position = UDim2.new(0, 10, 0, 137)
    pMeta.Size = UDim2.new(1, -20, 0, 18)
    pMeta.TextXAlignment = Enum.TextXAlignment.Center

    local pInfo = label(detail, "", 9, MUTED, Enum.Font.Code)
    pInfo.Position = UDim2.new(0, 14, 0, 170)
    pInfo.Size = UDim2.new(1, -28, 0, 100)
    pInfo.TextWrapped = true

    local function setSelected(p)
        selected = p
        if not p then
            pName.Text = "NO PLAYER SELECTED"
            pMeta.Text = "Select a player from the list"
            pAvatar.Image = ""
            pInfo.Text = ""
            return
        end
        pName.Text = p.DisplayName
        pMeta.Text = "@" .. p.Name
        pcall(function()
            pAvatar.Image = Players:GetUserThumbnailAsync(
                p.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150
            )
        end)
        local hum = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
        local hp = hum and math.floor(hum.Health) or 0
        local max = hum and math.floor(hum.MaxHealth) or 0
        pInfo.Text =
            "USER ID      : " .. tostring(p.UserId)
            .. "\nACCOUNT AGE  : " .. tostring(p.AccountAge) .. " days"
            .. "\nHEALTH       : " .. tostring(hp) .. " / " .. tostring(max)
            .. "\nTEAM         : " .. (p.Team and p.Team.Name or "No Team")
            .. "\nCHARACTER    : " .. (p.Character and "LOADED" or "NOT LOADED")
    end

    local function rebuildPlayers()
        for _, x in ipairs(playerList:GetChildren()) do
            if x:IsA("TextButton") then x:Destroy() end
        end
        local q = string.lower(search.Text or "")
        local all = Players:GetPlayers()
        table.sort(all, function(a, b) return string.lower(a.Name) < string.lower(b.Name) end)
        for _, p in ipairs(all) do
            if q == "" or string.find(string.lower(p.Name), q, 1, true)
                or string.find(string.lower(p.DisplayName), q, 1, true) then
                local row = button(playerList, "")
                row.Size = UDim2.new(1, 0, 0, 46)
                row.Text = ""
                local n = label(row, p.DisplayName, 10, WHITE, Enum.Font.GothamBold)
                n.Position = UDim2.new(0, 12, 0, 5)
                n.Size = UDim2.new(1, -22, 0, 17)
                local u = label(row, "@" .. p.Name .. "  •  ID " .. tostring(p.UserId), 8, MUTED)
                u.Position = UDim2.new(0, 12, 0, 24)
                u.Size = UDim2.new(1, -22, 0, 14)
                row.MouseButton1Click:Connect(function() setSelected(p) end)
            end
        end
    end

    search:GetPropertyChangedSignal("Text"):Connect(rebuildPlayers)
    refresh.MouseButton1Click:Connect(rebuildPlayers)
    Players.PlayerAdded:Connect(rebuildPlayers)
    Players.PlayerRemoving:Connect(function(p)
        if selected == p then setSelected(nil) end
        rebuildPlayers()
    end)
    rebuildPlayers()

    -- AVATAR IDS
    local at = label(avatarPage, "AVATAR ID PREVIEW", 20, WHITE, Enum.Font.GothamBlack)
    at.Position = UDim2.new(0, 6, 0, 4)
    at.Size = UDim2.new(1, -12, 0, 30)

    local as = label(avatarPage,
        "Select a player to inspect the asset IDs exposed by their HumanoidDescription.",
        10, MUTED)
    as.Position = UDim2.new(0, 7, 0, 33)
    as.Size = UDim2.new(1, -14, 0, 18)

    local avatarList = Instance.new("ScrollingFrame")
    avatarList.Position = UDim2.new(0, 6, 0, 62)
    avatarList.Size = UDim2.new(0, 300, 1, -68)
    avatarList.BackgroundColor3 = PANEL
    avatarList.BorderSizePixel = 0
    avatarList.ScrollBarThickness = 3
    avatarList.AutomaticCanvasSize = Enum.AutomaticSize.Y
    avatarList.Parent = avatarPage
    corner(avatarList, 9)
    stroke(avatarList, LINE, 1)

    local alayout = Instance.new("UIListLayout")
    alayout.Padding = UDim.new(0, 5)
    alayout.Parent = avatarList

    local avPad = Instance.new("UIPadding")
    avPad.PaddingTop = UDim.new(0, 7)
    avPad.PaddingLeft = UDim.new(0, 7)
    avPad.PaddingRight = UDim.new(0, 7)
    avPad.Parent = avatarList

    local idPanel = Instance.new("Frame")
    idPanel.Position = UDim2.new(0, 318, 0, 62)
    idPanel.Size = UDim2.new(1, -324, 1, -68)
    idPanel.BackgroundColor3 = PANEL
    idPanel.BorderSizePixel = 0
    idPanel.Parent = avatarPage
    corner(idPanel, 9)
    stroke(idPanel, LINE, 1)

    local idTitle = label(idPanel, "ASSET ID MATRIX", 10, VIOLET, Enum.Font.GothamBold)
    idTitle.Position = UDim2.new(0, 12, 0, 12)
    idTitle.Size = UDim2.new(1, -24, 0, 18)

    local idText = label(idPanel, "Select a player to load avatar IDs.", 9, MUTED, Enum.Font.Code)
    idText.Position = UDim2.new(0, 12, 0, 40)
    idText.Size = UDim2.new(1, -24, 1, -50)
    idText.TextWrapped = true
    idText.TextYAlignment = Enum.TextYAlignment.Top

    local function assetLine(name, value)
        local v = tostring(value or 0)
        if v == "" then v = "0" end
        return name .. " = " .. v
    end

    local function loadAvatarIDs(p)
        if not p then
            idText.Text = "Select a player to load avatar IDs."
            return
        end
        idText.Text = "Loading avatar description for @" .. p.Name .. "..."
        task.spawn(function()
            local ok, desc = pcall(function()
                return Players:GetHumanoidDescriptionFromUserId(p.UserId)
            end)
            if not ok or not desc then
                idText.Text = "Avatar description could not be loaded."
                return
            end

            local lines = {
                "PLAYER: " .. p.DisplayName .. "  (@" .. p.Name .. ")",
                "USER ID: " .. tostring(p.UserId),
                "",
                assetLine("Shirt", desc.Shirt),
                assetLine("Pants", desc.Pants),
                assetLine("GraphicTShirt", desc.GraphicTShirt),
                assetLine("Face", desc.Face),
                assetLine("Head", desc.Head),
                assetLine("Torso", desc.Torso),
                assetLine("LeftArm", desc.LeftArm),
                assetLine("RightArm", desc.RightArm),
                assetLine("LeftLeg", desc.LeftLeg),
                assetLine("RightLeg", desc.RightLeg),
                assetLine("BodyTypeScale", desc.BodyTypeScale),
                assetLine("DepthScale", desc.DepthScale),
                assetLine("HeadScale", desc.HeadScale),
                assetLine("HeightScale", desc.HeightScale),
                assetLine("ProportionScale", desc.ProportionScale),
                assetLine("WidthScale", desc.WidthScale),
                "",
                "Accessory string properties:",
                "HatAccessory = " .. tostring(desc.HatAccessory),
                "HairAccessory = " .. tostring(desc.HairAccessory),
                "FaceAccessory = " .. tostring(desc.FaceAccessory),
                "NeckAccessory = " .. tostring(desc.NeckAccessory),
                "ShouldersAccessory = " .. tostring(desc.ShouldersAccessory),
                "FrontAccessory = " .. tostring(desc.FrontAccessory),
                "BackAccessory = " .. tostring(desc.BackAccessory),
                "WaistAccessory = " .. tostring(desc.WaistAccessory),
            }
            idText.Text = table.concat(lines, "\n")
        end)
    end

    local function rebuildAvatarList()
        for _, x in ipairs(avatarList:GetChildren()) do
            if x:IsA("TextButton") then x:Destroy() end
        end
        local all = Players:GetPlayers()
        table.sort(all, function(a, b) return string.lower(a.Name) < string.lower(b.Name) end)
        for _, p in ipairs(all) do
            local row = button(avatarList, p.DisplayName, VIOLET)
            row.Size = UDim2.new(1, 0, 0, 38)
            row.MouseButton1Click:Connect(function()
                loadAvatarIDs(p)
            end)
        end
    end

    Players.PlayerAdded:Connect(rebuildAvatarList)
    Players.PlayerRemoving:Connect(rebuildAvatarList)
    rebuildAvatarList()

    -- MONITOR
    local mt = label(monitorPage, "CELESTIAL MONITOR", 20, WHITE, Enum.Font.GothamBlack)
    mt.Position = UDim2.new(0, 6, 0, 4)
    mt.Size = UDim2.new(1, -12, 0, 30)

    local terminal = Instance.new("ScrollingFrame")
    terminal.Position = UDim2.new(0, 6, 0, 48)
    terminal.Size = UDim2.new(1, -12, 1, -54)
    terminal.BackgroundColor3 = Color3.fromRGB(3, 4, 14)
    terminal.BorderSizePixel = 0
    terminal.ScrollBarThickness = 3
    terminal.Parent = monitorPage
    corner(terminal, 9)
    stroke(terminal, LINE, 1)

    local tlayout = Instance.new("UIListLayout")
    tlayout.Padding = UDim.new(0, 2)
    tlayout.Parent = terminal

    local function log(msg, color)
        local l = label(terminal, "✦ " .. msg, 9, color or MUTED, Enum.Font.Code)
        l.Size = UDim2.new(1, -16, 0, 16)
        l.Position = UDim2.new(0, 8, 0, 0)
    end

    log("CELESTIAL PANEL ONLINE", VIOLET)
    log("Chat Roast module loaded", PINK)
    log("Player List loaded", BLUE)
    log("Avatar ID viewer loaded", VIOLET)
    log("Whole-window drag system loaded", GREEN)
    log("Minimize / restore loaded", GREEN)

    Players.PlayerAdded:Connect(function(p) log("[JOIN] " .. p.Name, GREEN) end)
    Players.PlayerRemoving:Connect(function(p) log("[LEAVE] " .. p.Name, RED) end)

    -- SETTINGS
    local st = label(settingsPage, "CELESTIAL SETTINGS", 20, WHITE, Enum.Font.GothamBlack)
    st.Position = UDim2.new(0, 6, 0, 4)
    st.Size = UDim2.new(1, -12, 0, 30)

    local settings = Instance.new("Frame")
    settings.Position = UDim2.new(0, 6, 0, 52)
    settings.Size = UDim2.new(1, -12, 0, 220)
    settings.BackgroundColor3 = PANEL
    settings.BorderSizePixel = 0
    settings.Parent = settingsPage
    corner(settings, 10)
    stroke(settings, LINE, 1)

    local settingsText = {
        "✦ Celestial dark-space theme with animated stars.",
        "✦ The entire shell can be dragged from any empty area.",
        "✦ Use the — button to minimize the panel.",
        "✦ Use the floating ✦ button to restore it.",
        "✦ Player List shows every current player and their UserId.",
        "✦ Avatar ID Preview loads HumanoidDescription asset IDs.",
        "✦ Chat Roast is the original roast section presented at the top.",
        "✦ Roast controls are preview-only and do not create an automatic spam loop.",
    }
    for i, txt in ipairs(settingsText) do
        local l = label(settings, txt, 10, i == 1 and VIOLET or MUTED)
        l.Position = UDim2.new(0, 14, 0, 14 + (i - 1) * 25)
        l.Size = UDim2.new(1, -28, 0, 18)
    end

    -- Minimize / restore
    local minimized = false
    local restore = button(gui, "✦", VIOLET)
    restore.Size = UDim2.fromOffset(52, 52)
    restore.Position = UDim2.new(0, 18, .55, 0)
    restore.BackgroundColor3 = Color3.fromRGB(12, 9, 30)
    restore.TextSize = 20
    restore.Visible = false
    restore.ZIndex = 50
    stroke(restore, VIOLET, 1.5)

    minimize.MouseButton1Click:Connect(function()
        minimized = true
        shell.Visible = false
        restore.Visible = true
    end)

    close.MouseButton1Click:Connect(function()
        shell.Visible = false
        restore.Visible = true
        minimized = true
    end)

    restore.MouseButton1Click:Connect(function()
        minimized = false
        shell.Visible = true
        restore.Visible = false
    end)

    -- Responsive scale
    local uiScale = Instance.new("UIScale")
    uiScale.Parent = shell

    local function resize()
        local cam = workspace.CurrentCamera
        if not cam then return end
        local v = cam.ViewportSize
        if v.X < 720 then
            uiScale.Scale = math.clamp(v.X / 980, .62, .82)
        else
            uiScale.Scale = math.clamp(v.X / 1080, .82, 1)
        end
    end

    if workspace.CurrentCamera then
        workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(resize)
    end
    resize()

    -- Celestial glow pulse
    task.spawn(function()
        while gui.Parent do
            local s = shell:FindFirstChildOfClass("UIStroke")
            if s then
                TweenService:Create(s, TweenInfo.new(1.4, Enum.EasingStyle.Sine), {
                    Transparency = .35
                }):Play()
                task.wait(1.4)
                TweenService:Create(s, TweenInfo.new(1.4, Enum.EasingStyle.Sine), {
                    Transparency = 0
                }):Play()
                task.wait(1.4)
            else
                task.wait(1)
            end
        end
    end)

    -- Default to top Chat Roast section
    roastPage.Visible = true
    navButtons.ChatRoast.BackgroundColor3 = Color3.fromRGB(42, 18, 52)
    navButtons.ChatRoast.TextColor3 = PINK

    shell.BackgroundTransparency = 1
    TweenService:Create(shell, TweenInfo.new(.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0
    }):Play()
end)
