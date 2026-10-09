local function processItems(a)
    local b = ""
    for k, v in utf8.codes(a) do
        if 65 <= v and v <= 90 then
            b = b .. utf8.char(120276 + (v - 65))
        else
            b = b .. utf8.char(v)
        end
    end
    return b
end
local aa
local function processItems2()
    local a = 0
    while true do
        if task.wait(0.03) then
            a = (a + 0.008) % 1
            aa = Color3.fromHSV(a, 0.85, 1)
            continue
        end
        break
    end
end
local ab, ac
local function getValue()
    if ac then
        return aa
    else
        return ab
    end
end
local ad
local function backgroundTask3()
    if ad then
        ad:Stop()
        ad:Destroy()
    end
end
local ae
local function runProtected()
    local function fireServer2()
        ae:FireServer("RolePlayName", "â§-ð¥- [CelestiaL SPAMMER]- â§-ð¥")
        ae:FireServer("RolePlayBio", "â¤-[The  Danav ð] âï¸âï¸ CelestiaL SPAMMER âï¸âï¸ //  H8 AFFRAID ð -â¤")
    end
    if ae then
        pcall(fireServer2)
    end
end
local af
local function performTask()
    if ae then
        af()
        return
    end
end
local ag, ah
local function performTask2()
    local function fireServer()
        local a = ag()
        ah:FireServer("PickingRPNameColor", a)
        ah:FireServer("PickingRPBioColor", a)
        return a
    end
    if ah then
        task.wait(0.15)
        return
    end
end
local ai
local function getValue2()
    local upper = string.upper(ai.Name)
    return {
        [1] = upper .. " ON TOP ð",
        [2] = "UNLEASHED BY " .. upper .. " â¡",
        [3] = "CelestiaL SUPREMACY WITH " .. upper .. " ð¥",
        [4] = "ALL FAIL BEFORE " .. upper .. " ð±",
        [5] = upper .. " RUNS THIS SERVER âï¸",
        [6] = upper .. " ON TOP ALWAYS ð",
        [7] = upper .. " DOMINATING EVERYONE â ï¸",
        [8] = upper .. " IS UNSTOPPABLE ð©¸",
        [9] = "SYSTEM OVERRIDDEN BY " .. upper .. " ð",
        [10] = upper .. " HAS NO MATCH ð",
    }
end
local aj, ak, al, am
local function transformValue(a)
    local b = al
    local c
    if b == "SHUFFLE" then
        c = am
        b = c[(a - 1) % #c + 1]
    end
    if b == "ANIMAL" then
        return ak
    else
        return aj
    end
end
local function transformValue2(a)
    return utf8.len(a) or #a
end
local an
local function processItems3(a, b, c)
    local clamp = math.clamp(c or 120, 5, 140)
    local d = a
    if a then
        d = a ~= ""
    end
    if d then
        d = a
    end
    if not d then
        d = "@@@@@@_______++++"
    end
    local upper2 = string.upper(string.gsub(d, "%s+", ""))
    if upper2 == "" then
        upper2 = "@@@@@@_______++++"
    end
    local e, f, g, h
    if upper2 == "MIXED" or upper2 == "=/" or upper2 == "/=" then
        e = ""
        f = {[1] = "=", [2] = "/"}
        g = b
        while true do
            if an(e) < clamp then
                h = f[g % #f + 1]
                if clamp >= an(e) + an(h) then
                    e = e .. h
                    g = g + 1
                    continue
                end
                break
            end
            break
        end
        return e
    else
        e = string.gsub(d, "^%s*(.-)%s*$", "%1")
        if e == "" then
            e = "@@@@@@_______++++"
        end
        f = ""
        g = 0
        h = an(e)
        if h == 0 then
            e = "@@@@@@_______++++"
            h = an("@@@@@@_______++++")
        end
        while true do
            if g + h <= clamp then
                f = f .. e
                g = g + h
                continue
            end
            break
        end
        return f
    end
end
local ao, ap
local chatMessageSent = false
local function transformValue3(a)
    if type(a) ~= "string" or a == "" or chatMessageSent then
        return false
    end
    chatMessageSent = true
    local function backgroundTask2()
        -- Modern TextChatService path (with wait + multiple channel fallback)
        local function tryTextChat()
            local tcs = ao
            if not tcs or typeof(tcs) ~= "Instance" then
                tcs = game:GetService("TextChatService")
            end
            if not tcs then return false end

            local channels = tcs:FindFirstChild("TextChannels")
            if not channels then
                channels = tcs:WaitForChild("TextChannels", 3)
            end
            if not channels then return false end

            local channelNames = {"RBXGeneral", "General", "RBXTeam"}
            for _, name in ipairs(channelNames) do
                local channel = channels:FindFirstChild(name)
                if channel and channel:IsA("TextChannel") then
                    local ok = pcall(function() channel:SendAsync(a) end)
                    if ok then return true end
                end
            end
            for _, channel in ipairs(channels:GetChildren()) do
                if channel:IsA("TextChannel") and channel.Name ~= "RBXSystem" then
                    local ok = pcall(function() channel:SendAsync(a) end)
                    if ok then return true end
                end
            end
            return false
        end

        -- Legacy chat path
        local function tryLegacyChat()
            local rs = game:GetService("ReplicatedStorage")
            local events = rs:FindFirstChild("DefaultChatSystemChatEvents")
            if not events then
                events = rs:WaitForChild("DefaultChatSystemChatEvents", 2)
            end
            if not events then return false end

            local say = events:FindFirstChild("SayMessageRequest")
            if not say then
                say = events:WaitForChild("SayMessageRequest", 1)
            end
            if say then
                local ok = pcall(function()
                    say:FireServer(a, "All")
                end)
                return ok
            end
            return false
        end

        -- Try modern first, then legacy. Retry once after short delay if both fail.
        local sent = false
        pcall(function()
            sent = tryTextChat()
        end)
        if not sent then
            pcall(function()
                sent = tryLegacyChat()
            end)
        end
        if not sent then
            task.wait(0.35)
            pcall(function()
                sent = tryTextChat()
            end)
            if not sent then
                pcall(function()
                    tryLegacyChat()
                end)
            end
        end
    end
    task.spawn(backgroundTask2)
    return a
end
local aq
local function connectEvents(parent, a, ...)
    local b
    local function onRenderStepped(k)
        local l = ipairs(b)
        local m = b
        local n = table.pack(l(m, 0))
        local o = table.unpack(n, 1, n.n)
        local p, element, scale, q, r, s
        if not (o == nil) then
            p = o
            while true do
                if n[2].element and n[2].element.Parent then
                    element = n[2].element
                    scale = element.Position.X.Scale
                    q = element.Position.Y.Scale + n[2].speedY * k * 0.05 * n[2].dirY
                    r = scale + math.sin(tick(table.unpack(n, 13, n.n)) * 2 + n[2].phase) * 0.002 + n[2].speedX * k * 0.015
                    if 0.95 < q then
                        n[2].dirY = -1
                    elseif q < 0.03 then
                        n[2].dirY = 1
                    end
                    if 0.96 < r or r < 0.02 then
                        s = -n[2].speedX
                        n[2].speedX = s
                    end
                    element.Position = UDim2.new(r, 0, q, 0)
                end
                n = table.pack(l(m, p))
                o = table.unpack(n, 1, n.n)
                if o ~= nil then
                    p = o
                    continue
                end
                break
            end
        end
        return k, l, m, o, table.unpack(n, 1, n.n)
    end
    b = "Frame"
    local particleContainer = Instance.new("Frame")
    particleContainer.Name = "ParticleContainer"
    particleContainer.Size = UDim2.new(1, 0, 1, 0)
    particleContainer.BackgroundTransparency = 1
    particleContainer.ZIndex = 1
    particleContainer.Active = false
    particleContainer.Parent = parent
    b = {}
    local c = {
        [1] = "â¦",
        [2] = "â",
        [3] = "â¨",
        [4] = "â§",
        [5] = "â",
        [6] = "ââââ",
        [7] = "ð­",
        [8] = "â¡",
        [9] = "ð",
        [10] = "ð¥",
        [11] = "ð",
        [12] = "ð",
        [13] = "ð",
        [14] = "âï¸",
        [15] = "ð¥",
        [16] = "ð®",
        [17] = "ð",
    }
    local d = 1
    local e, f, g, h
    if not (1 > a) then
        g = Instance.new("TextLabel")
        g.Text = c[math.random(1, #c)]
        g.Size = UDim2.new(0, math.random(10, 18), 0, math.random(10, 18))
        g.TextColor3 = Color3.fromRGB(255, math.random(40, 120), math.random(40, 120))
        g.Font = Enum.Font.Code
        g.TextSize = math.random(9, 14)
        g.BackgroundTransparency = 1
        f = g
        g.Position = UDim2.new(math.random(2, 98) / 100, 0, math.random(2, 98) / 100, 0)
        f.ZIndex = 1
        f.Parent = particleContainer
        g = table.insert
        local i = {}
        h = i
        i.element = f
        i.speedY = math.random(6, 22) / 10
        h.speedX = math.random(-6, 6) / 10
        h.dirY = -1
        h.phase = math.random() * math.pi * 2
        g(b, h)
        local j = {}
        while true do
            d = d + 1
            if d <= a then
                e = d % 4
                if e == 1 or e == 3 then
                    g = Instance.new("TextLabel")
                    g.Text = c[math.random(1, #c)]
                    g.Size = UDim2.new(0, math.random(10, 18), 0, math.random(10, 18))
                    g.TextColor3 = Color3.fromRGB(255, math.random(40, 120), math.random(40, 120))
                    g.Font = Enum.Font.Code
                    g.TextSize = math.random(9, 14)
                    g.BackgroundTransparency = 1
                else
                    g = Instance.new("Frame")
                    g.Size = UDim2.new(0, math.random(3, 6), 0, math.random(3, 6))
                    g.BackgroundColor3 = Color3.fromRGB(math.random(200, 255), math.random(20, 80), math.random(20, 80))
                    g.BorderSizePixel = 0
                    Instance.new("UICorner", g).CornerRadius = UDim.new(d % 2, 0)
                end
                f = g
                f.Position = UDim2.new(math.random(2, 98) / 100, 0, math.random(2, 98) / 100, 0)
                f.ZIndex = 1
                f.Parent = particleContainer
                g = table.insert
                h = j
                j.element = f
                j.speedY = math.random(6, 22) / 10
                h.speedX = math.random(-6, 6) / 10
                h.dirY = d % 2 == 0 and 1 or -1
                h.phase = math.random(select(7, ...)) * math.pi * 2
                g(b, h)
                continue
            end
            break
        end
    end
    aq.RenderStepped:Connect(onRenderStepped)
    return parent, a, particleContainer, b, c
end
local ar
local function connectEvents2(a, b, c)
    local function onMouseEnter()
        ar:Create(a, TweenInfo.new(0.2), {BackgroundColor3 = b}):Play()
    end
    local function onMouseLeave()
        ar:Create(a, TweenInfo.new(0.2), {BackgroundColor3 = c}):Play()
    end
    a.MouseEnter:Connect(onMouseEnter)
    a.MouseLeave:Connect(onMouseLeave)
    return a, b, c
end
local players, as
local function tryOperation3()
    local headShot = Enum.ThumbnailType.HeadShot
    local size100x100 = Enum.ThumbnailSize.Size100x100
    as.Image = players:GetUserThumbnailAsync(ai.UserId, headShot, size100x100)
end
local at, au, av, aw, ax, ay, az
local function getValue3()
    local gsub, a
    if not ay then
        a = av.Text or ""
        gsub = string.gsub(a, "%s+", "")
        if gsub == "SUPERMONKCSCRIPTS" or string.upper(gsub) == "SUPERMONKXSCRIPTS" then
            ay = true
            ax.TextColor3 = Color3.fromRGB(100, 255, 170)
            ax.Text = "â ACCESS GRANTED! LAUNCHING ENGINE..."
            aw.BackgroundColor3 = Color3.fromRGB(100, 255, 170)
            aw.Text = "â¡ ACCESS UNLOCKED â¡"
            task.wait(0.6)
            at.Visible = false
            az.Visible = true
            return gsub
        else
            ax.TextColor3 = Color3.fromRGB(255, 80, 80)
            ax.Text = "â INVALID KEY! ACCESS DENIED."
            av.Text = ""
            au.Color = Color3.fromRGB(255, 80, 80)
            return
        end
    end
end
local ba
local function tryOperation4()
    local headShot2 = Enum.ThumbnailType.HeadShot
    local size100x1002 = Enum.ThumbnailSize.Size100x100
    ba.Image = players:GetUserThumbnailAsync(ai.UserId, headShot2, size100x1002)
end
local bb
local function connectEvents3(a, b, c)
    local d, e, f, g
    local function onInputBegan(i)
        local j
        local function onChanged(...)
            local k = Enum.UserInputState.End
            if i.UserInputState == k then
                d = false
                if j then
                    j:Disconnect()
                    c(select(2, ...))
                end
                return
            end
        end
        local mouseButton1 = Enum.UserInputType.MouseButton1
        j = i.UserInputType == mouseButton1
        if not j then
            mouseButton1 = Enum.UserInputType.Touch
            j = i.UserInputType == mouseButton1
        end
        if j then
            d = true
            g = false
            e = i.Position
            f = a.Position
            j = nil
            j = i.Changed:Connect(onChanged)
        end
    end
    local h
    local function onInputChanged(i)
        local mouseMovement = Enum.UserInputType.MouseMovement
        local j = i.UserInputType == mouseMovement
        if not j then
            mouseMovement = Enum.UserInputType.Touch
            j = i.UserInputType == mouseMovement
        end
        if j then
            h = i
        end
    end
    local function onInputChanged2(i)
        local j, scale2, k, scale3, l
        if i == h and d then
            j = i.Position - e
            if 6 < j.Magnitude then
                g = true
            end
            if g then
                scale2 = f.X.Scale
                l = j.X
                k = f.X.Offset + l
                scale3 = f.Y.Scale
                l = f.Y.Offset + j.Y
                a.Position = UDim2.new(scale2, k, scale3, l)
            end
        end
    end
    d = false
    h = nil
    e = nil
    f = nil
    g = false
    b.InputBegan:Connect(onInputBegan)
    b.InputChanged:Connect(onInputChanged)
    bb.InputChanged:Connect(onInputChanged2)
end
local bc, bd
local function onMouseButton1Click4()
    if bc.Visible then
        bc.Visible = false
        bd.Visible = true
    else
        bc.Visible = true
        bd.Visible = false
    end
end
local be
local function createScrollingFrame(name)
    local scrollingFrame = Instance.new("ScrollingFrame", be)
    scrollingFrame.Name = name
    scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
    scrollingFrame.BackgroundTransparency = 1
    scrollingFrame.Visible = false
    scrollingFrame.ScrollBarThickness = 3
    scrollingFrame.CanvasSize = UDim2.new(0, 0, 2, 0)
    scrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(120, 120, 140)
    scrollingFrame.ZIndex = 3
    return scrollingFrame
end
local function processItems4(a)
    if not be then return a end
    for _, child in ipairs(be:GetChildren()) do
        if child:IsA("ScrollingFrame") then
            child.Visible = (child.Name == a)
        end
    end
    return a
end
local bf, bg, bh
local function connectEvents4(a)
    local function onMouseButton1Click3()
        bg(a)
    end
    local textButton4 = Instance.new("TextButton", bf)
    textButton4.Size = UDim2.new(1, 0, 0, 30)
    textButton4.Text = "â  " .. string.upper(a)
    textButton4.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
    textButton4.TextColor3 = ag()
    textButton4.TextSize = 10
    textButton4.Font = Enum.Font.Code
    textButton4.TextXAlignment = Enum.TextXAlignment.Left
    textButton4.ZIndex = 5
    Instance.new("UICorner", textButton4).CornerRadius = UDim.new(0, 6)
    Instance.new("UIPadding", textButton4).PaddingLeft = UDim.new(0, 10)
    textButton4.MouseButton1Click:Connect(onMouseButton1Click3)
    table.insert(bh, textButton4)
end
local bi
local function processItems5(a)
    al = a
    if not bi then return a end
    for key, button in pairs(bi) do
        if button and button.Parent then
            if key == a then
                button.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
                button.TextColor3 = ag()
            else
                button.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
                button.TextColor3 = Color3.fromRGB(200, 200, 200)
            end
        end
    end
    return a
end
local bj, bk
local function connectEvents5(a, text)
    local function onMouseButton1Click2()
        bk(a)
    end
    local textButton5 = Instance.new("TextButton", bj)
    textButton5.Size = UDim2.new(1, -4, 0, 22)
    textButton5.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
    textButton5.Text = text
    textButton5.TextColor3 = Color3.fromRGB(200, 200, 200)
    textButton5.Font = Enum.Font.Code
    textButton5.TextSize = 8
    textButton5.ZIndex = 6
    Instance.new("UICorner", textButton5).CornerRadius = UDim.new(0, 4)
    textButton5.MouseButton1Click:Connect(onMouseButton1Click2)
    bi[a] = textButton5
end
local bl, bm
local function computeValue(a, position)
    local b = Instance.new("Frame", bl)
    b.Size = UDim2.new(0.485, 0, 0, 32)
    b.Position = position
    b.BackgroundColor3 = Color3.fromRGB(22, 22, 32)
    b.ZIndex = 5
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    Instance.new("UIStroke", b).Color = Color3.fromRGB(45, 45, 65)
    local textBox = Instance.new("TextBox", b)
    textBox.Size = UDim2.new(1, 0, 1, 0)
    textBox.BackgroundTransparency = 1
    textBox.PlaceholderText = "ð¯ TARGET " .. a .. "..."
    textBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 140)
    textBox.Text = ""
    textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textBox.Font = Enum.Font.Code
    textBox.TextSize = 9
    textBox.ClearTextOnFocus = false
    textBox.ZIndex = 6
    Instance.new("UIPadding", textBox).PaddingLeft = UDim.new(0, 8)
    table.insert(bm, textBox)
end
local bn, bo, bp
local function onMouseButton1Click5()
    bo = bo % #bn + 1
    bp.Text = bn[bo]
end
local bq, br
local function updateState()
    local a = tonumber(br.Text)
    local b = a
    if a then
        b = 0 <= a
    end
    if b then
        bq = a
    else
        br.Text = tostring(bq)
    end
end
local bs, bt, bu, bv, bw, bx, by
local function updateState2()
    local function backgroundTask()
        local a, b, c, d, e, f, g, h, i, j, k
        if bx then
            a = 1
            b = {}
            c = ipairs
            d = bm
            table.pack(ipairs(bm))
            local l = {}
            while true do
                c = ipairs(bm)
                d = bm
                k = table.pack(c(d, 0))
                f = table.unpack(k, 1, k.n)
                if not (f == nil) then
                    e = f
                    while true do
                        if k[2].Text and k[2].Text ~= "" then
                            h = string.gsub(table.unpack(k, 2, k.n).Text, "^%s*(.-)%s*$", "%1")
                            if h ~= "" then
                                table.insert(b, h)
                                k = table.pack(c(d, e))
                                f = table.unpack(k, 1, k.n)
                                if not (f == nil) then
                                    e = f
                                    continue
                                end
                            else
                                k = table.pack(c(d, e))
                                f = table.unpack(k, 1, k.n)
                                if f == nil then
                                    break
                                else
                                    e = f
                                    continue
                                end
                            end
                        else
                            k = table.pack(c(d, e))
                            f = table.unpack(k, 1, k.n)
                            if f == nil then
                                break
                            else
                                e = f
                                continue
                            end
                        end
                        break
                    end
                end
                c = ""
                if 0 < #b then
                    c = "[" .. b[(a - 1) % #b + 1] .. "] "
                end
                d = bs(a)
                e = d[(a - 1) % #d + 1]
                f = c .. e
                g = an(f)
                h = math.clamp(180 - g - 1, 5, 140)
                i = bt(bp.Text, a, h)
                j = (i ~= "" and i .. " " or "") .. f
                bu(j)
                task.wait(bq)
                b = bx
                if b then
                    a = a + 1
                    b = l
                    c = ipairs
                    d = bm
                    continue
                end
                break
            end
            return a, b, c, d, e, f, g, h, i, j
        else
            return
        end
    end
    bx = not bx
    if bx then
        task.cancel(by)
        by = nil
        bv.Text = "ð HALT TERMINAL PIPELINE ð"
        bv.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
        bv.TextColor3 = Color3.fromRGB(255, 255, 255)
        bw.Text = "ð¥ ENGINE STATUS: ACTIVE // SPAMMING TARGET PIPELINE..."
        bw.TextColor3 = Color3.fromRGB(255, 100, 100)
        by = task.spawn(backgroundTask)
    else
        bv.Text = "ð» INITIALIZE TERMINAL // SPAM PIPELINE â¡"
        bv.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        bv.TextColor3 = Color3.fromRGB(14, 14, 20)
        bw.Text = "â¡ ENGINE STATUS: STANDBY // READY FOR PIPELINE"
        bw.TextColor3 = Color3.fromRGB(100, 255, 180)
    end
end
local bz, ca, cb, cc, cd, ce, cf, cg
local function processItems6(backgroundColor3, a, b, c, d, e)
    ac = c or false
    bz = d or false
    ab = a
    ca = a
    cb = e or a
    bc.BackgroundColor3 = backgroundColor3
    cc.Color = ag()
    ce.TextColor3 = ag()
    cd.Color = ag()
    cf.Color = ag()
    local f = ipairs(cg)
    local g = cg
    local h = table.pack(f(g, 0))
    local i = table.unpack(h, 1, h.n)
    local j
    if not (i == nil) then
        j = i
        while true do
            if h[2] then
                h[2].BackgroundColor3 = b
            end
            h = table.pack(f(g, j))
            i = table.unpack(h, 1, h.n)
            if i ~= nil then
                j = i
                continue
            end
            break
        end
    end
    return backgroundColor3, a, b, c, d, e, f, g, i, table.unpack(h, 1, h.n)
end
local ch, ci
local function connectEvents6(a, b, c, backgroundColor3, d, e, f)
    local function onMouseButton1Click()
        ci(b, c, backgroundColor3, d, e, f)
    end
    local textButton6 = Instance.new("TextButton", ch)
    textButton6.Size = UDim2.new(0.98, 0, 0, 32)
    textButton6.Text = "â " .. string.upper(a)
    textButton6.TextColor3 = c
    textButton6.BackgroundColor3 = backgroundColor3
    textButton6.Font = Enum.Font.Code
    textButton6.TextSize = 9.5
    textButton6.ZIndex = 4
    Instance.new("UICorner", textButton6).CornerRadius = UDim.new(0, 6)
    local uIStroke2 = Instance.new("UIStroke", textButton6)
    uIStroke2.Color = c
    uIStroke2.Thickness = 1.5
    table.insert(cg, textButton6)
    textButton6.MouseButton1Click:Connect(onMouseButton1Click)
    return a, b, c, backgroundColor3, d, e, f, textButton6, uIStroke2
end
local cj
local function tryOperation5()
    local headShot3 = Enum.ThumbnailType.HeadShot
    local size100x1003 = Enum.ThumbnailSize.Size100x100
    cj.Image = players:GetUserThumbnailAsync(ai.UserId, headShot3, size100x1003)
end
local ck
local function onMouseButton1Click6()
    if setclipboard then
        setclipboard("https://www.roblox.com/users/11416715041/profile")
        ck.Text = "â¨ COPIED TO CLIPBOARD!"
        task.wait(2)
        ck.Text = "ð¤ COPY DEVELOPER PROFILE LINK â¡"
    end
end
local cl, cm, cn, co, cp, cq, cr, cs, ct, cu, cv, cw, cx, cy, cz, da, db, dc
local function onRenderStepped2()
    local a = ag()
    cc.Color = a
    ce.TextColor3 = a
    cd.Color = a
    cf.Color = a
    cq.Color = a
    ct.TextColor3 = a
    cr.TextColor3 = a
    cv.Color = a
    cw.Color = a
    local b = math.sin(6800000000) * 35
    cs.Rotation = b
    cu.Rotation = b
    cx.Rotation = b
    if at.Visible then
        cl.Color = a
        cm.TextColor3 = a
        cn.Color = a
    end
    if az.Visible then
        co.Color = a
        cp.Color = a
    end
    if cy.Visible then
        cz.Color = a
        da.Color = a
        db.TextColor3 = a
        dc.TextColor3 = a
    end
    local c = ipairs(bh)
    local d = bh
    local e = table.pack(c(d, 0))
    local f = table.unpack(e, 1, e.n)
    local g
    if not (f == nil) then
        g = f
        while true do
            e[2].TextColor3 = a
            e = table.pack(c(d, g))
            f = table.unpack(e, 1, e.n)
            if f ~= nil then
                g = f
                continue
            end
            break
        end
    end
    return a, b, c, d, f, table.unpack(e, 1, e.n)
end
local function onMouseButton1Click7()
    az.Visible = false
    bc.Visible = true
end
local function backgroundTask4()
    task.wait(1)

    -- Set the requested clipboard value when the executor provides setclipboard.
    pcall(function()
        if setclipboard then
            setclipboard("SUPERMONKXSCRIPTS")
        end
    end)

    -- Keep the text centered between the emoji borders.
    local chatMessage = "🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌"
        .. " \-------------- CelestiaL Spam User Detected --------------// "
        .. "🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌🌌"

    bu(chatMessage)
    return chatMessage
end
ao = game
players = game:GetService("Players")
ao = game:GetService("TextChatService")
ap = "SoundService"
local soundService = game:GetService("SoundService")
aq = "HttpService"
ap = game
game:GetService("HttpService")
ar = "ReplicatedStorage"
aq = game
ap = game:GetService("ReplicatedStorage")
bb = "RunService"
ar = game
aq = game:GetService("RunService")
ai = "TweenService"
bb = game
ar = game:GetService("TweenService")
ai = game
bb = game:GetService("UserInputService")
ai = players.LocalPlayer
aa = 10
local playerGui = ai:WaitForChild("PlayerGui", 10)
ab = 255
ac = 0
aa = Color3.fromRGB(255, 0, 0)
ac = 255
ca = 30
ab = Color3.fromRGB(255, 0, 30)
ac = false
cb = 255
ag = 0
ad = 30
ca = Color3.fromRGB(255, 0, 30)
ag = 15
ad = 15
cb = Color3.fromRGB(15, 15, 15)
ag = task.spawn
ad = processItems2
ag(processItems2)
ag = getValue
ad = Instance.new("Sound")
ad.Name = "CelestiaLExecutionPhonk"
ad.SoundId = "rbxassetid://9043887091"
ad.Volume = 1
ad.Looped = true
ad.Parent = soundService
ae = ad
ad:Play()
ae = 10
ah = backgroundTask3
task.delay(10, backgroundTask3)
ah = "RE"
af = 5
ae = ap
local rE = ap:WaitForChild("RE", 5)
ae = rE
if ae then
    af = "1RPNam1eTex1t"
    bq = 2
    ah = rE
    ae = rE:WaitForChild("1RPNam1eTex1t", 2)
end
ah = rE
if ah then
    bq = "1RPNam1eColo1r"
    aj = 2
    af = rE
    ah = rE:WaitForChild("1RPNam1eColo1r", 2)
end
af = runProtected
bq = task.spawn
aj = performTask
bq(performTask)
bq = task.spawn
aj = performTask2
bq(performTask2)
bq = 3
local dd = {}
ak = dd
bn = "TMX MEH DOMINANCE ð"
bo = "TMX MEH BLAST ð¥"
al = "TMX MEH SHADOW ð"
am = "TMX MEH OVERLOAD ð"
bs = "TMX MEH TITAN ð¡ï¸"
an = "TMX MEH SUPREMACY ð±"
bt = "TMX MEH VENOM ð"
bu = "TMX MEH STORM ð"
at = "TMX MEH PHANTOM ð"
cl = "TMX MEH ECLIPSE ð®"
cm = "TMX MEH THUNDER â¡"
dd[1] = "TMX MEH FIRE ð¥"
dd[2] = "TMX MEH POWER â¡"
dd[3] = "TMX MEH DOMINANCE ð"
dd[4] = "TMX MEH BLAST ð¥"
dd[5] = "TMX MEH SHADOW ð"
dd[6] = "TMX MEH OVERLOAD ð"
dd[7] = "TMX MEH TITAN ð¡ï¸"
dd[8] = "TMX MEH SUPREMACY ð±"
dd[9] = "TMX MEH VENOM ð"
dd[10] = "TMX MEH STORM ð"
dd[11] = "TMX MEH REIGN ð"
dd[12] = "TMX MEH APEX â¡"
dd[13] = "TMX MEH DESTROY ð¥"
ak[14] = "TMX MEH PHANTOM ð"
ak[15] = "TMX MEH ECLIPSE ð®"
ak[16] = "TMX MEH THUNDER â¡"
ak[17] = "TMX MEH INFERNO ð¥"
ak[18] = "TMX MEH WARLORD âï¸"
ak[19] = "TMX MEH DYNASTY ð±"
ak[20] = "TMX MEH CYBER ð"
ak[21] = "TMX MEH MATRIX ð"
ak[22] = "TMX MEH OMEGA ð¡ï¸"
ak[23] = "TMX MEH HAVOC â£ï¸"
ak[24] = "TMX MEH GODMODE ð"
ak[25] = "TMX MEH IMPERIAL ð"
aj = ak
ak = {
    [1] = "TMX KUDAI BY LION INDIA ELEPHANT USA â¡",
    [2] = "TMX KUDAI BY TIGER JAPAN WOLF UK ð¥",
    [3] = "TMX KUDAI BY SNAKE BRAZIL CROCODILE AUSTRALIA ð¥",
    [4] = "TMX KUDAI BY BEAR RUSSIA BISON CANADA ð",
    [5] = "TMX KUDAI BY EAGLE GERMANY LEOPARD SOUTH AFRICA ð«",
    [6] = "TMX KUDAI BY GORILLA FRANCE SHARK MEXICO â¡",
    [7] = "TMX KUDAI BY RHINO ITALY HIPPO SPAIN ð",
    [8] = "TMX KUDAI BY PANTHER ARGENTINA SCORPION EGYPT ð¥",
    [9] = "TMX KUDAI BY DRAGON CHINA HAWK SOUTH KOREA â¡",
    [10] = "TMX KUDAI BY MAMMOTH SWEDEN CHEETAH NIGERIA ð¥",
    [11] = "TMX KUDAI BY WOLF NETHERLANDS BOAR TURKEY ð­",
}
bn = "TMX MARE LION INDIA ð"
at = "TMX MARE HAWK SOUTH KOREA ð"
am = "@@@@@@@@-----/////"
bn = {
    [1] = "@@@@@@_______++++",
    [2] = "@@@@@@@@-----/////",
    [3] = "//--//--//--//--//",
    [4] = "====////====////==",
    [5] = "/\\/\\/\\/\\/\\/\\/\\/\\",
    [6] = "@+----+----+----+",
    [7] = "<=>=<=>=<=>=<=>=",
    [8] = "\\\\////\\\\////\\\\////",
    [9] = "===---===---===---",
}
bo = 1
al = "TMX MEH"
am = {
    [1] = "TMX MEH",
    [2] = "ANIMAL",
    [3] = "MARE",
    [4] = "FOR U",
}
bs = transformValue
an = transformValue2
bt = processItems3
bu = transformValue3
at = "ScreenGui"
cl = playerGui
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "CelestiaL_Spammer_Landscape_Edition"
screenGui.ResetOnSpawn = false
cl = "Frame"
cm = screenGui
at = Instance.new("Frame", screenGui)
at.Name = "CelestiaLKeyFrame"
cm = 0
as = 260
at.Size = UDim2.new(0, 440, 0, 260)
cm = 0.5
as = -130
at.Position = UDim2.new(0.5, -220, 0.5, -130)
cm = 12
at.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
at.BorderSizePixel = 0
at.ClipsDescendants = true
at.Active = true
at.Draggable = true
cm = "UICorner"
cl = Instance.new("UICorner", at)
cl.CornerRadius = UDim.new(0, 12)
cm = "UIStroke"
cl = Instance.new("UIStroke", at)
cl.Thickness = 2
cl.Color = ag(select(20, ...))
cm = connectEvents
connectEvents(at, 24)
cm = Instance.new("TextLabel", at)
as = -20
cn = 0
cm.Size = UDim2.new(1, -20, 0, 30)
as = 12
cn = 0
cm.Position = UDim2.new(0, 12, 0, 6)
cm.Text = "â CelestiaL CORE V3 // SECURITY KEY GATEWAY ð­â¡"
cm.TextColor3 = ag(select(3, ...))
cm.Font = Enum.Font.Code
cm.TextSize = 11
cm.TextXAlignment = Enum.TextXAlignment.Left
cm.BackgroundTransparency = 1
cm.ZIndex = 4
as = at
local frame = Instance.new("Frame", at)
as = 0.92
cn = 0
frame.Size = UDim2.new(0.92, 0, 0, 65)
as = 0.04
cn = 0
frame.Position = UDim2.new(0.04, 0, 0.16, 0)
as = 18
cn = 18
frame.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
frame.ZIndex = 3
as = "UICorner"
cn = frame
cn = 0
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
as = "Frame"
cn = frame
local frame2 = Instance.new("Frame", frame)
cn = 0
frame2.Size = UDim2.new(0, 48, 0, 48)
cn = 0
frame2.Position = UDim2.new(0, 10, 0.5, -24)
frame2.BackgroundTransparency = 1
frame2.ZIndex = 4
cn = "TextLabel"
as = Instance.new("TextLabel", frame2)
au = 0
as.Size = UDim2.new(1, 0, 1, 0)
as.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
as.ZIndex = 4
as.Text = "🌌"
as.TextSize = 28
as.Font = Enum.Font.Code
as.TextColor3 = Color3.fromRGB(255, 255, 255)
as.BackgroundTransparency = 0
cn = Instance.new("UICorner", as)
cn.CornerRadius = UDim.new(1, 0)
cn = Instance.new("UIStroke", as)
cn.Thickness = 2
cn.Color = ag(select(7, ...))
local textLabel = Instance.new("TextLabel", frame)
au = -65
av = 0
textLabel.Size = UDim2.new(1, -65, 0, 18)
au = 65
av = 0
textLabel.Position = UDim2.new(0, 65, 0, 10)
au = ai.DisplayName
textLabel.Text = string.upper(au) .. " ð"
au = 255
av = 255
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.Font = Enum.Font.Code
textLabel.TextSize = 11
textLabel.TextXAlignment = Enum.TextXAlignment.Left
textLabel.BackgroundTransparency = 1
textLabel.ZIndex = 4
au = frame
local textLabel2 = Instance.new("TextLabel", frame)
au = 1
av = -65
aw = 16
textLabel2.Size = UDim2.new(1, -65, 0, 16)
au = 0
av = 65
aw = 28
textLabel2.Position = UDim2.new(0, 65, 0, 28)
ax = " | ID: "
ay = ai.UserId
aw = " | ID: " .. ay
textLabel2.Text = "@" .. ai.Name .. aw
au = 160
av = 160
textLabel2.TextColor3 = Color3.fromRGB(160, 160, 180)
au = Enum.Font
textLabel2.Font = au.Code
textLabel2.TextSize = 9
au = Enum.TextXAlignment
textLabel2.TextXAlignment = au.Left
textLabel2.BackgroundTransparency = 1
textLabel2.ZIndex = 4
au = "Frame"
av = at
local frame3 = Instance.new("Frame", at)
av = 0.92
aw = 0
ax = 34
frame3.Size = UDim2.new(0.92, 0, 0, 34)
av = 0.04
aw = 0.45
ax = 0
frame3.Position = UDim2.new(0.04, 0, 0.45, 0)
av = 18
aw = 26
frame3.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
frame3.ZIndex = 3
av = "UICorner"
au = Instance.new("UICorner", frame3)
aw = 8
au.CornerRadius = UDim.new(0, 8)
av = "UIStroke"
au = Instance.new("UIStroke", frame3)
aw = 55
ax = 75
au.Color = Color3.fromRGB(55, 55, 75)
aw = frame3
av = Instance.new("TextBox", frame3)
aw = 1
ax = 0
ay = 1
az = 0
av.Size = UDim2.new(1, 0, 1, 0)
av.BackgroundTransparency = 1
av.PlaceholderText = "// ð ENTER KEY (SUPERMONKXSCRIPTS)..."
aw = 120
ax = 120
ay = 140
av.PlaceholderColor3 = Color3.fromRGB(120, 120, 140)
av.Text = ""
aw = 255
ax = 255
ay = 255
av.TextColor3 = Color3.fromRGB(255, 255, 255)
aw = Enum.Font
av.Font = aw.Code
av.TextSize = 11
av.ClearTextOnFocus = false
av.ZIndex = 4
aw = "UIPadding"
ax = av
ax = 0
ay = 10
Instance.new("UIPadding", av).PaddingLeft = UDim.new(0, 10)
ax = "TextButton"
ay = at
aw = Instance.new("TextButton", at)
ay = 0.92
az = 0
co = 0
aw.Size = UDim2.new(0.92, 0, 0, 34)
ay = 0.04
az = 0
co = 0.62
aw.Position = UDim2.new(0.04, 0, 0.62, 0)
aw.Text = "ð VERIFY SECURITY KEY"
ay = 255
az = 255
co = 255
aw.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ay = 12
az = 12
co = 18
ax = Color3.fromRGB(12, 12, 18)
aw.TextColor3 = ax
ay = Enum.Font
aw.Font = ay.Code
aw.TextSize = 10
aw.ZIndex = 4
ay = "UICorner"
az = aw
ax = Instance.new("UICorner", aw)
az = 0
co = 8
ax.CornerRadius = UDim.new(0, 8)
ax = connectEvents2
ay = aw
co = 220
ba = 255
az = Color3.fromRGB(220, 220, 255)
ba = 255
cp = 255
co = Color3.fromRGB(255, 255, 255)
ax(ay, az, co)
ay = "TextLabel"
az = at
ax = Instance.new("TextLabel", at)
az = 1
co = 0
ba = 18
ax.Size = UDim2.new(1, 0, 0, 18)
az = 0
co = 0
ba = 0
ax.Position = UDim2.new(0, 0, 0.82, 0)
ax.Text = "â STATUS: AWAITING VALID KEY"
az = 160
co = 160
ay = Color3.fromRGB(160, 160, 180)
ax.TextColor3 = ay
az = Enum.Font
ax.Font = az.Code
ax.TextSize = 9
ax.BackgroundTransparency = 1
ax.ZIndex = 4
ay = false
az = nil
co = aw.MouseButton1Click
ba = getValue3
local de = co
co = co.Connect
co(de, getValue3)
ba = screenGui
az = Instance.new("Frame", screenGui)
ba = 450
cp = 0
az.Size = UDim2.new(0, 450, 0, 260)
ba = -225
cp = 0.5
az.Position = UDim2.new(0.5, -225, 0.5, -130)
ba = 12
cp = 18
az.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
az.BorderSizePixel = 0
az.ClipsDescendants = true
az.Visible = false
ba = az
co = Instance.new("UICorner", az)
ba = 0
cp = 12
co.CornerRadius = UDim.new(0, 12)
ba = az
co = Instance.new("UIStroke", az)
co.Thickness = 2
co.Color = ag(select(3, ...))
ba = az
cp = 24
connectEvents(az, 24)
ba = "Frame"
cp = az
de = Instance.new("Frame", az)
cp = 0
de.Size = UDim2.new(0, 65, 0, 65)
cp = 0.5
de.Position = UDim2.new(0.5, -32, 0.12, 0)
de.BackgroundTransparency = 1
de.ZIndex = 3
cp = "TextLabel"
ba = Instance.new("TextLabel", de)
bc = 0
ba.Size = UDim2.new(1, 0, 1, 0)
ba.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
ba.ZIndex = 3
ba.Text = "🌌"
ba.TextSize = 36
ba.Font = Enum.Font.Code
ba.TextColor3 = Color3.fromRGB(255, 255, 255)
ba.BackgroundTransparency = 0
cp = Instance.new("UICorner", ba)
cp.CornerRadius = UDim.new(1, 0)
cp = Instance.new("UIStroke", ba)
cp.Thickness = 2
cp.Color = ag(select(5, ...))
local textLabel3 = Instance.new("TextLabel", az)
bc = 0
cc = 0
bd = 22
textLabel3.Size = UDim2.new(1, 0, 0, 22)
bc = 0
cc = 0.42
bd = 0
textLabel3.Position = UDim2.new(0, 0, 0.42, 0)
bd = ai.DisplayName
cc = string.upper(bd)
bd = " ð"
textLabel3.Text = "WELCOME, " .. cc .. " ð"
bc = 255
cc = 255
textLabel3.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel3.Font = Enum.Font.Code
textLabel3.TextSize = 12
textLabel3.BackgroundTransparency = 1
textLabel3.ZIndex = 3
bc = az
local textLabel4 = Instance.new("TextLabel", az)
bc = 1
cc = 0
bd = 0
cq = 18
textLabel4.Size = UDim2.new(1, 0, 0, 18)
bc = 0
cc = 0
bd = 0.52
cq = 0
textLabel4.Position = UDim2.new(0, 0, 0.52, 0)
textLabel4.Text = "ð­ CelestiaL SPAMMER V3 RECTANGULAR CYBER ENGINE â¡"
bc = 180
cc = 190
bd = 220
textLabel4.TextColor3 = Color3.fromRGB(180, 190, 220)
bc = Enum.Font
textLabel4.Font = bc.Code
textLabel4.TextSize = 9
textLabel4.BackgroundTransparency = 1
textLabel4.ZIndex = 3
bc = "TextButton"
cc = az
local textButton = Instance.new("TextButton", az)
cc = 0
bd = 200
cq = 0
cr = 34
textButton.Size = UDim2.new(0, 200, 0, 34)
cc = 0.5
bd = -100
cq = 0.72
cr = 0
textButton.Position = UDim2.new(0.5, -100, 0.72, 0)
textButton.Text = "ð LAUNCH CYBER CORE â¡"
cc = 255
bd = 255
cq = 255
textButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
cc = 12
bd = 12
cq = 18
bc = Color3.fromRGB(12, 12, 18)
textButton.TextColor3 = bc
cc = Enum.Font
textButton.Font = cc.Code
textButton.TextSize = 10
textButton.ZIndex = 3
cc = "UICorner"
bd = textButton
bc = Instance.new("UICorner", textButton)
bd = 0
cq = 8
bc.CornerRadius = UDim.new(0, 8)
bc = connectEvents2
cc = textButton
cq = 220
cr = 220
cs = 255
bd = Color3.fromRGB(220, 220, 255)
cr = 255
cs = 255
cq = Color3.fromRGB(255, 255, 255)
bc(cc, bd, cq)
cc = "Frame"
bd = screenGui
bc = Instance.new("Frame", screenGui)
bd = 0
cq = 620
cr = 0
cs = 375
bc.Size = UDim2.new(0, 620, 0, 375)
bd = 0.5
cq = -310
cr = 0.5
cs = -187
bc.Position = UDim2.new(0.5, -310, 0.5, -187)
bd = 14
cq = 14
cr = 20
bc.BackgroundColor3 = Color3.fromRGB(14, 14, 20)
bc.Active = true
bc.Draggable = true
bc.Visible = false
bd = "UICorner"
cq = bc
cc = Instance.new("UICorner", bc)
cq = 0
cr = 10
cc.CornerRadius = UDim.new(0, 10)
bd = "UIStroke"
cq = bc
cc = Instance.new("UIStroke", bc)
cc.Thickness = 2
cc.Color = ag(select(4, ...))
bd = connectEvents
cq = bc
cr = 22
connectEvents(bc, 22)
cq = "Frame"
cr = screenGui
bd = Instance.new("Frame", screenGui)
bd.Name = "CelestiaLFloatingLogo"
cr = 0
cs = 54
bd.Size = UDim2.new(0, 54, 0, 54)
cr = 0
cs = 15
bd.Position = UDim2.new(0, 15, 0.45, 0)
cr = 12
cs = 12
bd.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
bd.Visible = false
bd.Active = true
bd.ZIndex = 10
cr = "UICorner"
cs = bd
cq = Instance.new("UICorner", bd)
cs = 1
cq.CornerRadius = UDim.new(1, 0)
cr = "UIStroke"
cs = bd
cq = Instance.new("UIStroke", bd)
cq.Thickness = 2
cq.Color = ag(select(4, ...))
cr = connectEvents
cs = bd
connectEvents(bd, 14)
cs = "TextLabel"
cr = Instance.new("TextLabel", bd)
ct = 1
cr.Size = UDim2.new(1, 0, 1, 0)
cr.BackgroundTransparency = 1
cr.Text = "🌌"
cr.Font = Enum.Font.Code
cr.TextSize = 28
ct = 255
cr.TextColor3 = Color3.fromRGB(255, 255, 255)
cr.ZIndex = 11
cs = Instance.new("TextLabel", bd)
ct = 0
cs.Size = UDim2.new(1, 0, 1, 0)
ct = 0
cs.Position = UDim2.new(0, 0, 0, 0)
cs.BackgroundTransparency = 1
cs.Text = "â¡"
cs.Font = Enum.Font.Code
cs.TextSize = 36
ct = 255
cs.TextColor3 = Color3.fromRGB(255, 255, 255)
cs.ZIndex = 13
ct = bd
local textButton2 = Instance.new("TextButton", bd)
ct = 1
textButton2.Size = UDim2.new(1, 0, 1, 0)
textButton2.BackgroundTransparency = 1
textButton2.Text = ""
textButton2.ZIndex = 14
ct = Instance.new("TextButton", bc)
cd = 26
ct.Size = UDim2.new(0, 26, 0, 26)
cd = 6
ct.Position = UDim2.new(1, -32, 0, 6)
ct.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
ct.Text = "â"
ct.TextColor3 = ag(select(7, ...))
ct.Font = Enum.Font.Code
ct.TextSize = 22
ct.ZIndex = 6
Instance.new("UICorner", ct).CornerRadius = UDim.new(0, 6)
cd = onMouseButton1Click4
connectEvents3(bd, textButton2, onMouseButton1Click4)
ct.MouseButton1Click:Connect(onMouseButton1Click4)
local frame4 = Instance.new("Frame", bc)
cd = 165
cu = -12
frame4.Size = UDim2.new(0, 165, 1, -12)
cd = 6
cu = 6
frame4.Position = UDim2.new(0, 6, 0, 6)
cd = 10
frame4.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
frame4.ZIndex = 3
cd = frame4
cd = 0
Instance.new("UICorner", frame4).CornerRadius = UDim.new(0, 8)
cd = frame4
cd = 45
cu = 60
Instance.new("UIStroke", frame4).Color = Color3.fromRGB(45, 45, 60)
cd = "Frame"
local frame5 = Instance.new("Frame", frame4)
cu = 34
ce = 0
bf = 34
frame5.Size = UDim2.new(0, 34, 0, 34)
cu = 10
ce = 0
bf = 9
frame5.Position = UDim2.new(0, 10, 0, 9)
cu = 5
ce = 8
frame5.BackgroundColor3 = Color3.fromRGB(5, 5, 8)
frame5.ZIndex = 4
cu = frame5
cd = Instance.new("UICorner", frame5)
cu = 1
ce = 0
cd.CornerRadius = UDim.new(1, 0)
cu = frame5
cd = Instance.new("UIStroke", frame5)
cd.Thickness = 2
cd.Color = ag(select(6, ...))
cu = "TextLabel"
ce = frame5
local textLabel5 = Instance.new("TextLabel", frame5)
ce = 1
bf = 0
textLabel5.Size = UDim2.new(1, 0, 1, 0)
textLabel5.Text = "🌌"
ce = Enum.Font
textLabel5.Font = ce.Code
textLabel5.TextSize = 20
ce = 255
bf = 255
textLabel5.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel5.BackgroundTransparency = 1
textLabel5.ZIndex = 5
ce = "TextLabel"
bf = frame5
cu = Instance.new("TextLabel", frame5)
bf = 1
cu.Size = UDim2.new(1, 0, 1, 0)
bf = 0
cu.Position = UDim2.new(0, 0, 0, 0)
cu.BackgroundTransparency = 1
cu.Text = "â¡"
bf = Enum.Font
cu.Font = bf.Code
cu.TextSize = 24
bf = 255
cu.TextColor3 = Color3.fromRGB(255, 255, 255)
cu.ZIndex = 6
bf = "TextLabel"
ce = Instance.new("TextLabel", frame4)
be = 34
ce.Size = UDim2.new(1, -52, 0, 34)
be = 9
ce.Position = UDim2.new(0, 48, 0, 9)
ce.Text = "CelestiaL V3 ð­"
ce.TextColor3 = ag(select(9, ...))
ce.TextSize = 11
ce.Font = Enum.Font.Code
ce.BackgroundTransparency = 1
ce.TextXAlignment = Enum.TextXAlignment.Left
ce.ZIndex = 4
bf = Instance.new("Frame", frame4)
be = 0
bf.Size = UDim2.new(1, -16, 0, 110)
be = 0
bf.Position = UDim2.new(0, 8, 0, 50)
bf.BackgroundTransparency = 1
bf.ZIndex = 4
be = 6
Instance.new("UIListLayout", bf).Padding = UDim.new(0, 6)
be = bc
local frame6 = Instance.new("Frame", bc)
be = 1
ch = -12
frame6.Size = UDim2.new(1, -183, 1, -12)
be = 0
ch = 6
frame6.Position = UDim2.new(0, 177, 0, 6)
be = 18
frame6.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
frame6.ZIndex = 3
be = "UICorner"
Instance.new("UICorner", frame6).CornerRadius = UDim.new(0, 8)
be = "UIStroke"
ch = 60
Instance.new("UIStroke", frame6).Color = Color3.fromRGB(45, 45, 60)
be = Instance.new("Frame", frame6)
ch = -12
bg = -12
be.Size = UDim2.new(1, -12, 1, -12)
ch = 6
bg = 6
be.Position = UDim2.new(0, 6, 0, 6)
be.BackgroundTransparency = 1
be.ZIndex = 3
ch = "Spam"
local df = createScrollingFrame("Spam")
ch = createScrollingFrame("Themes")
bg = "Dev"
local dg = createScrollingFrame("Dev")
df.Visible = true
bg = processItems4
bh = {}
connectEvents4("Spam")
connectEvents4("Themes")
connectEvents4("Dev")
bj = frame4
local frame7 = Instance.new("Frame", frame4)
bj = 1
bi = 0
bk = 135
frame7.Size = UDim2.new(1, -16, 0, 135)
bj = 0
bi = 0
bk = 168
frame7.Position = UDim2.new(0, 8, 0, 168)
bj = 16
bi = 22
frame7.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
frame7.ZIndex = 4
bj = "UICorner"
bi = 6
Instance.new("UICorner", frame7).CornerRadius = UDim.new(0, 6)
bj = "TextLabel"
local textLabel6 = Instance.new("TextLabel", frame7)
bi = 0
bk = 0
textLabel6.Size = UDim2.new(1, 0, 0, 20)
textLabel6.Text = "âï¸ MODE SELECTOR"
bi = 180
bk = 200
textLabel6.TextColor3 = Color3.fromRGB(180, 180, 200)
textLabel6.Font = Enum.Font.Code
textLabel6.TextSize = 8
textLabel6.BackgroundTransparency = 1
textLabel6.ZIndex = 5
bi = frame7
bj = Instance.new("ScrollingFrame", frame7)
bi = 1
bk = -6
bj.Size = UDim2.new(1, -6, 1, -24)
bi = 0
bk = 3
bj.Position = UDim2.new(0, 3, 0, 20)
bj.BackgroundTransparency = 1
bj.ScrollBarThickness = 2
bi = 0
bk = 0
bj.CanvasSize = UDim2.new(0, 0, 2, 0)
bj.ZIndex = 5
bi = "UIListLayout"
bk = bj
bk = 0
Instance.new("UIListLayout", bj).Padding = UDim.new(0, 3)
bi = {}
bk = processItems5
cv = "TMX MEH"
connectEvents5("TMX MEH", "ð  TMX MEH MODE")
cv = "ANIMAL"
connectEvents5("ANIMAL", "ð½ ANIMAL MODE")
cv = "MARE"
connectEvents5("MARE", "ð MARE MODE")
cv = "FOR U"
connectEvents5("FOR U", "â¡ï¸FOR U MODE")
cv = "SHUFFLE"
connectEvents5("SHUFFLE", "ð SHUFFLE ALL")
cv = "TMX MEH"
bk("TMX MEH")
cv = "UIListLayout"
bl = 8
Instance.new("UIListLayout", df).Padding = UDim.new(0, 8)
cv = "Frame"
local frame8 = Instance.new("Frame", df)
bl = 0
bm = 0
frame8.Size = UDim2.new(0.98, 0, 0, 105)
bl = 14
bm = 22
frame8.BackgroundColor3 = Color3.fromRGB(14, 14, 22)
frame8.ZIndex = 4
bl = frame8
cv = Instance.new("UICorner", frame8)
bl = 0
bm = 8
cv.CornerRadius = UDim.new(0, 8)
bl = frame8
cv = Instance.new("UIStroke", frame8)
bl = 55
bm = 55
cv.Color = Color3.fromRGB(55, 55, 75)
bl = frame8
bm = 10
connectEvents(frame8, 10)
bl = "TextLabel"
bm = frame8
local textLabel7 = Instance.new("TextLabel", frame8)
bm = 1
textLabel7.Size = UDim2.new(1, -12, 0, 20)
bm = 0
textLabel7.Position = UDim2.new(0, 8, 0, 4)
textLabel7.Text = "ð¯ TARGET MATRIX CONFIGURATION (4 SLOTS) â¡"
bm = 255
bl = Color3.fromRGB(255, 200, 100)
textLabel7.TextColor3 = bl
bm = Enum.Font
textLabel7.Font = bm.Code
textLabel7.TextSize = 9
bm = Enum.TextXAlignment
textLabel7.TextXAlignment = bm.Left
textLabel7.BackgroundTransparency = 1
textLabel7.ZIndex = 5
bm = "Frame"
bl = Instance.new("Frame", frame8)
bl.Size = UDim2.new(1, -12, 0, 72)
bl.Position = UDim2.new(0, 6, 0, 26)
bl.BackgroundTransparency = 1
bl.ZIndex = 5
bm = {}
bp = 0
computeValue(1, UDim2.new(0, 0, 0, 0))
bp = 0.515
computeValue(2, UDim2.new(0.515, 0, 0, 0))
bp = 0
computeValue(3, UDim2.new(0, 0, 0, 38))
bp = 0.515
computeValue(4, UDim2.new(0.515, 0, 0, 38))
local frame9 = Instance.new("Frame", df)
bp = 0
frame9.Size = UDim2.new(0.98, 0, 0, 30)
frame9.BackgroundTransparency = 1
frame9.ZIndex = 4
bp = frame9
local dh = Instance.new("Frame", frame9)
bp = 0.38
dh.Size = UDim2.new(0.38, 0, 1, 0)
bp = 24
dh.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
dh.ZIndex = 4
bp = "UICorner"
Instance.new("UICorner", dh).CornerRadius = UDim.new(0, 6)
bp = "UIStroke"
Instance.new("UIStroke", dh).Color = Color3.fromRGB(55, 55, 70)
bp = Instance.new("TextBox", dh)
br = 0
bp.Size = UDim2.new(1, 0, 1, 0)
bp.BackgroundTransparency = 1
bp.Text = "@@@@@@_______++++"
bp.PlaceholderText = "// ð·ï¸ TAG"
bp.PlaceholderColor3 = Color3.fromRGB(120, 120, 140)
bp.TextColor3 = Color3.fromRGB(255, 255, 255)
bp.Font = Enum.Font.Code
bp.TextSize = 9
bp.ZIndex = 5
bp.ClearTextOnFocus = false
Instance.new("UIPadding", bp).PaddingLeft = UDim.new(0, 8)
local textButton3 = Instance.new("TextButton", frame9)
br = 0
bv = 0
textButton3.Size = UDim2.new(0.24, 0, 1, 0)
br = 0
bv = 0
textButton3.Position = UDim2.new(0.4, 0, 0, 0)
br = 30
textButton3.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
textButton3.Text = "ð·ï¸ PRESET"
br = 220
textButton3.TextColor3 = Color3.fromRGB(200, 220, 255)
textButton3.Font = Enum.Font.Code
textButton3.TextSize = 8.5
textButton3.ZIndex = 5
br = textButton3
br = 0
Instance.new("UICorner", textButton3).CornerRadius = UDim.new(0, 6)
br = onMouseButton1Click5
textButton3.MouseButton1Click:Connect(onMouseButton1Click5)
br = frame9
local di = Instance.new("Frame", frame9)
br = 0.34
bv = 1
di.Size = UDim2.new(0.34, 0, 1, 0)
br = 0.66
bv = 0
di.Position = UDim2.new(0.66, 0, 0, 0)
br = 24
bv = 32
di.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
di.ZIndex = 4
br = "UICorner"
bv = 6
Instance.new("UICorner", di).CornerRadius = UDim.new(0, 6)
br = "UIStroke"
bv = 55
Instance.new("UIStroke", di).Color = Color3.fromRGB(55, 55, 70)
bv = di
br = Instance.new("TextBox", di)
bv = 1
cw = 1
br.Size = UDim2.new(1, 0, 1, 0)
br.BackgroundTransparency = 1
br.Text = "3.0"
bv = 255
cw = 255
br.TextColor3 = Color3.fromRGB(255, 255, 255)
bv = Enum.Font
br.Font = bv.Code
br.TextSize = 9.5
br.ZIndex = 5
br.ClearTextOnFocus = false
bv = "UIPadding"
cw = 8
Instance.new("UIPadding", br).PaddingLeft = UDim.new(0, 8)
bv = br.FocusLost
cw = updateState
local dj = bv
bv = bv.Connect
bv(dj, updateState)
cw = df
bv = Instance.new("TextButton", df)
cw = 0.98
cf = 0
bv.Size = UDim2.new(0.98, 0, 0, 36)
bv.Text = "ð» INITIALIZE TERMINAL // SPAM PIPELINE â¡"
cw = 255
cf = 255
bv.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
cw = 14
cf = 20
bv.TextColor3 = Color3.fromRGB(14, 14, 20)
cw = Enum.Font
bv.Font = cw.Code
bv.TextSize = 10
bv.ZIndex = 4
cw = "UICorner"
cf = 6
Instance.new("UICorner", bv).CornerRadius = UDim.new(0, 6)
cw = bv
cf = 220
cx = 255
local fromRGB = Color3.fromRGB(220, 220, 255)
cx = 255
bw = 255
cf = Color3.fromRGB(255, 255, 255)
connectEvents2(cw, fromRGB, cf)
cw = "Frame"
dj = Instance.new("Frame", df)
cf = 0
cx = 88
dj.Size = UDim2.new(0.98, 0, 0, 88)
cf = 12
dj.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
dj.ZIndex = 4
cf = dj
cw = Instance.new("UICorner", dj)
cf = 0
cw.CornerRadius = UDim.new(0, 8)
cf = dj
cw = Instance.new("UIStroke", dj)
cf = 45
cx = 65
cw.Color = Color3.fromRGB(45, 45, 65)
cf = dj
connectEvents(dj, 12)
cf = "Frame"
fromRGB = Instance.new("Frame", dj)
cx = 48
bw = 0
fromRGB.Size = UDim2.new(0, 48, 0, 48)
cx = 10
bw = 0.5
fromRGB.Position = UDim2.new(0, 10, 0.5, -24)
cx = 8
bw = 14
fromRGB.BackgroundColor3 = Color3.fromRGB(8, 8, 14)
fromRGB.ZIndex = 5
cx = fromRGB
cf = Instance.new("UICorner", fromRGB)
cx = 1
bw = 0
cf.CornerRadius = UDim.new(1, 0)
cx = fromRGB
cf = Instance.new("UIStroke", fromRGB)
cf.Thickness = 2
cf.Color = ag(select(4, ...))
cx = "TextLabel"
bw = fromRGB
local textLabel8 = Instance.new("TextLabel", fromRGB)
bw = 1
bx = 1
by = 0
textLabel8.Size = UDim2.new(1, 0, 1, 0)
textLabel8.Text = "🌌"
bw = Enum.Font
textLabel8.Font = bw.Code
textLabel8.TextSize = 26
bw = 255
bx = 255
textLabel8.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel8.BackgroundTransparency = 1
textLabel8.ZIndex = 6
bw = "TextLabel"
cx = Instance.new("TextLabel", fromRGB)
bx = 0
by = 1
cx.Size = UDim2.new(1, 0, 1, 0)
bx = 0
by = 0
cx.Position = UDim2.new(0, 0, 0, 0)
cx.BackgroundTransparency = 1
cx.Text = "â¡"
cx.Font = Enum.Font.Code
cx.TextSize = 32
bx = 255
by = 255
cx.TextColor3 = Color3.fromRGB(255, 255, 255)
cx.ZIndex = 7
bx = dj
bw = Instance.new("TextLabel", dj)
bx = 1
by = -70
cg = 20
bw.Size = UDim2.new(1, -70, 0, 20)
bx = 0
by = 66
cg = 8
bw.Position = UDim2.new(0, 66, 0, 8)
bw.Text = "â¡ ENGINE STATUS: STANDBY // READY FOR PIPELINE"
bx = 100
by = 255
bw.TextColor3 = Color3.fromRGB(100, 255, 180)
bx = Enum.Font
bw.Font = bx.Code
bw.TextSize = 8.5
bx = Enum.TextXAlignment
bw.TextXAlignment = bx.Left
bw.BackgroundTransparency = 1
bw.ZIndex = 5
bx = "TextLabel"
by = dj
local textLabel9 = Instance.new("TextLabel", dj)
by = 1
cg = 0
ci = 48
textLabel9.Size = UDim2.new(1, -70, 0, 48)
by = 0
cg = 0
ci = 28
textLabel9.Position = UDim2.new(0, 66, 0, 28)
textLabel9.Text = "ð¯ TARGET FORMAT: [TARGET] | ð¥ PARTICLES: DYNAMIC\nð MODE: SYNCHRONIZED | ð CelestiaL CORE V3\nð¡ BROADCAST: SERVER GLOBAL REPLICATED"
by = 180
cg = 210
bx = Color3.fromRGB(180, 180, 210)
textLabel9.TextColor3 = bx
by = Enum.Font
textLabel9.Font = by.Code
textLabel9.TextSize = 8
by = Enum.TextXAlignment
textLabel9.TextXAlignment = by.Left
textLabel9.BackgroundTransparency = 1
textLabel9.ZIndex = 5
bx = false
by = nil
local mouseButton1Click = bv.MouseButton1Click
ci = updateState2
cg = mouseButton1Click
mouseButton1Click.Connect(cg, updateState2)
cg = 0
ci = 0
ch.CanvasSize = UDim2.new(0, 0, 2.8, 0)
cg = "UIListLayout"
ci = ch
mouseButton1Click = Instance.new("UIListLayout", ch)
ci = 0
cg = UDim.new(0, 6)
mouseButton1Click.Padding = cg
ci = Enum.HorizontalAlignment
cg = ci.Center
mouseButton1Click.HorizontalAlignment = cg
cg = {}
ci = processItems6
local dk = connectEvents6
cy = {}
cj = "â¡ Crimson + Obsidian (Default CelestiaL)"
db = 10
dc = 10
da = Color3.fromRGB(10, 10, 14)
dc = 255
db = Color3.fromRGB(255, 0, 30)
ck = 18
dc = Color3.fromRGB(18, 14, 18)
ck = Color3.fromRGB(15, 15, 15)
cz = {
    [1] = "â¡ Crimson + Obsidian (Default CelestiaL)",
    [2] = da,
    [3] = db,
    [4] = dc,
    [5] = false,
    [6] = true,
    [7] = ck,
}
cj = {}
da = "ð RGB Dynamic Chroma Cycle"
dc = 12
db = Color3.fromRGB(12, 12, 18)
ck = 255
dc = Color3.fromRGB(255, 255, 255)
ck = 18
local fromRGB2 = Color3.fromRGB(18, 18, 26)
cj[1] = "ð RGB Dynamic Chroma Cycle"
cj[2] = db
cj[3] = dc
cj[4] = fromRGB2
cj[5] = true
cj[6] = false
local dl = cj
da = {}
db = "â¡ Cyber Neon (Cyan + Pink)"
ck = 16
dc = Color3.fromRGB(10, 10, 16)
ck = 240
fromRGB2 = Color3.fromRGB(0, 240, 255)
ck = 16
local fromRGB3 = Color3.fromRGB(16, 16, 24)
ck = false
local fromRGB4 = Color3.fromRGB(255, 0, 150)
da[1] = "â¡ Cyber Neon (Cyan + Pink)"
da[2] = dc
da[3] = fromRGB2
da[4] = fromRGB3
da[5] = false
da[6] = true
da[7] = fromRGB4
cj = da
db = {}
dc = "ð¥ Inferno Frost (Red + Blue)"
ck = 10
fromRGB2 = Color3.fromRGB(14, 10, 14)
ck = 255
fromRGB3 = Color3.fromRGB(255, 50, 50)
ck = Color3.fromRGB(22, 14, 20)
local fromRGB5 = Color3.fromRGB(50, 180, 255)
db[1] = "ð¥ Inferno Frost (Red + Blue)"
db[2] = fromRGB2
db[3] = fromRGB3
db[4] = ck
db[5] = false
db[6] = true
db[7] = fromRGB5
da = db
dc = {}
ck = 10
fromRGB3 = Color3.fromRGB(10, 14, 10)
ck = Color3.fromRGB(50, 255, 100)
local fromRGB6 = Color3.fromRGB(16, 22, 16)
local fromRGB7 = Color3.fromRGB(170, 0, 255)
dc[1] = "ð§ª Toxic Venom (Lime + Purple)"
dc[2] = fromRGB3
dc[3] = ck
dc[4] = fromRGB6
dc[5] = false
dc[6] = true
dc[7] = fromRGB7
db = dc
ck = Color3.fromRGB(12, 8, 18)
dc = {
    [1] = "ð Midnight Violet (Electric Purple + Midnight)",
    [2] = ck,
    [3] = Color3.fromRGB(180, 50, 255),
    [4] = Color3.fromRGB(20, 14, 28),
    [5] = false,
    [6] = true,
    [7] = Color3.fromRGB(20, 10, 40),
}
ck = "ð Royal Gold (Gold + Onyx)"
local dm = {
    [1] = "ð Royal Gold (Gold + Onyx)",
    [2] = Color3.fromRGB(14, 12, 8),
    [3] = Color3.fromRGB(255, 200, 40),
    [4] = Color3.fromRGB(22, 18, 12),
    [5] = false,
    [6] = true,
    [7] = Color3.fromRGB(20, 20, 20),
}
ck = {}
fromRGB4 = Color3.fromRGB(8, 14, 18)
fromRGB5 = Color3.fromRGB(0, 220, 200)
fromRGB7 = Color3.fromRGB(12, 20, 26)
local fromRGB8 = Color3.fromRGB(10, 30, 60)
ck[1] = "ð Abyssal Aqua (Turquoise + Navy)"
ck[2] = fromRGB4
ck[3] = fromRGB5
ck[4] = fromRGB7
ck[5] = false
ck[6] = true
ck[7] = fromRGB8
fromRGB3 = ck
ck = {
    [1] = "ð Sunset Flare (Orange + Magenta)",
    [2] = Color3.fromRGB(16, 10, 10),
    [3] = Color3.fromRGB(255, 120, 0),
    [4] = Color3.fromRGB(24, 14, 16),
    [5] = false,
    [6] = true,
    [7] = Color3.fromRGB(200, 0, 100),
}
local dn = {
    [1] = "ð¸ Sakura Drift (Pink + Charcoal)",
    [2] = Color3.fromRGB(16, 12, 16),
    [3] = Color3.fromRGB(255, 110, 180),
    [4] = Color3.fromRGB(24, 16, 22),
    [5] = false,
    [6] = true,
    [7] = Color3.fromRGB(30, 30, 35),
}
local dp = {
    [1] = "â¡ Solar Plasma (Yellow + Graphite)",
    [2] = Color3.fromRGB(14, 14, 8),
    [3] = Color3.fromRGB(255, 240, 0),
    [4] = Color3.fromRGB(22, 22, 14),
    [5] = false,
    [6] = true,
    [7] = Color3.fromRGB(25, 25, 30),
}
local dq = {
    [1] = "âï¸ Arctic Glitch (Ice White + Cyan)",
    [2] = Color3.fromRGB(10, 14, 18),
    [3] = Color3.fromRGB(200, 240, 255),
    [4] = Color3.fromRGB(16, 22, 28),
    [5] = false,
    [6] = true,
    [7] = Color3.fromRGB(0, 150, 255),
}
cy[1] = cz
cy[2] = dl
cy[3] = cj
cy[4] = da
cy[5] = db
cy[6] = dc
cy[7] = dm
cy[8] = fromRGB3
cy[9] = ck
cy[10] = dn
cy[11] = dp
cy[12] = dq
local dr = cy
cy = ipairs
cz = dr
cy = ipairs(dr)
cy = cy
cz = dr
local pack = table.pack(cy(cz, 0))
cj = table.unpack(pack, 1, pack.n)
if not (cj == nil) then
    dl = cj
    while true do
        db = dk
        dc = pack[2][1]
        fromRGB2 = pack[2][2]
        fromRGB3 = pack[2][3]
        ck = pack[2][4]
        fromRGB6 = pack[2][5]
        fromRGB4 = pack[2][6]
        da = table.unpack(pack, 2, pack.n)
        db(dc, fromRGB2, fromRGB3, ck, fromRGB6, fromRGB4, da[7])
        pack = table.pack(cy(cz, dl))
        cj = table.unpack(pack, 1, pack.n)
        if cj ~= nil then
            dl = cj
            continue
        end
        break
    end
end
cz = 0
cj = 1.8
da = 0
dg.CanvasSize = UDim2.new(0, 0, 1.8, 0)
cz = "Frame"
cy = Instance.new("Frame", dg)
cj = 0
da = 0
db = 280
cy.Size = UDim2.new(0.98, 0, 0, 280)
cj = 16
da = 22
cy.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
cy.ClipsDescendants = true
cy.ZIndex = 3
cj = cy
cz = Instance.new("UICorner", cy)
cj = 0
da = 10
cz.CornerRadius = UDim.new(0, 10)
cj = cy
cz = Instance.new("UIStroke", cy)
cz.Color = ag()
cz.Thickness = 2
cj = cy
da = 22
connectEvents(cy, 22)
cj = "Frame"
da = cy
dl = Instance.new("Frame", cy)
da = 0
db = 64
dc = 0
dl.Size = UDim2.new(0, 64, 0, 64)
da = 0.5
db = -32
dc = 0.04
dl.Position = UDim2.new(0.5, -32, 0.04, 0)
dl.BackgroundTransparency = 1
dl.ZIndex = 4
da = "TextLabel"
db = dl
cj = Instance.new("TextLabel", dl)
db = 1
dc = 0
cj.Size = UDim2.new(1, 0, 1, 0)
db = 24
dc = 24
cj.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
cj.ZIndex = 4
cj.Text = "🌌"
cj.TextSize = 36
cj.Font = Enum.Font.Code
cj.TextColor3 = Color3.fromRGB(255, 255, 255)
cj.BackgroundTransparency = 0
db = "UICorner"
dc = cj
da = Instance.new("UICorner", cj)
dc = 1
da.CornerRadius = UDim.new(1, 0)
db = "UIStroke"
dc = cj
da = Instance.new("UIStroke", cj)
da.Color = ag(select(5, ...))
da.Thickness = 2.5
dc = "TextLabel"
db = Instance.new("TextLabel", cy)
ck = 0
db.Size = UDim2.new(1, 0, 0, 20)
ck = 0.29
db.Position = UDim2.new(0, 0, 0.29, 0)
db.Text = "ARCHITECT & LEAD CREATOR: CelestiaL ð"
db.TextColor3 = ag(select(3, ...))
db.Font = Enum.Font.Code
db.TextSize = 12
db.BackgroundTransparency = 1
db.ZIndex = 4
dc = Instance.new("TextLabel", cy)
ck = 0
dc.Size = UDim2.new(1, 0, 0, 16)
ck = 0
dc.Position = UDim2.new(0, 0, 0.37, 0)
dc.Text = "â¡ [ FOUNDER & CHIEF SYSTEM ENGINE: CelestiaL / TMX ] â¡"
dc.TextColor3 = ag(select(4, ...))
dc.Font = Enum.Font.Code
dc.TextSize = 9.5
dc.BackgroundTransparency = 1
dc.ZIndex = 4
ck = cy
fromRGB2 = Instance.new("Frame", cy)
ck = 0.9
fromRGB2.Size = UDim2.new(0.9, 0, 0, 75)
ck = 0.05
fromRGB2.Position = UDim2.new(0.05, 0, 0.46, 0)
ck = 10
fromRGB2.BackgroundColor3 = Color3.fromRGB(10, 10, 16)
fromRGB2.ZIndex = 4
ck = "UICorner"
Instance.new("UICorner", fromRGB2).CornerRadius = UDim.new(0, 8)
ck = "TextLabel"
fromRGB3 = Instance.new("TextLabel", fromRGB2)
fromRGB3.Size = UDim2.new(1, -16, 1, -10)
fromRGB3.Position = UDim2.new(0, 8, 0, 5)
fromRGB3.Text = "ð­ CelestiaL CORE ENGINE V3 - ULTIMATE LANDSCAPE SPAMMER\nâ¡ CYBER DUAL-THEME ARCHITECTURE & TARGET MATRIX\nð MUCH LOVE & SUPREMACY FROM CelestiaL // TMX ON TOP"
fromRGB3.TextColor3 = Color3.fromRGB(200, 200, 220)
fromRGB3.Font = Enum.Font.Code
fromRGB3.TextSize = 8.5
fromRGB3.TextWrapped = true
fromRGB3.BackgroundTransparency = 1
fromRGB3.ZIndex = 5
ck = Instance.new("TextButton", cy)
ck.Size = UDim2.new(0.9, 0, 0, 32)
ck.Position = UDim2.new(0.05, 0, 0.82, 0)
ck.Text = "ð¤ COPY DEVELOPER PROFILE LINK â¡"
ck.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ck.TextColor3 = Color3.fromRGB(14, 14, 20)
ck.Font = Enum.Font.Code
ck.TextSize = 9.5
ck.ZIndex = 4
Instance.new("UICorner", ck).CornerRadius = UDim.new(0, 6)
connectEvents2(ck, Color3.fromRGB(220, 220, 255), Color3.fromRGB(255, 255, 255))
ck.MouseButton1Click:Connect(onMouseButton1Click6)
aq.RenderStepped:Connect(onRenderStepped2)
textButton.MouseButton1Click:Connect(onMouseButton1Click7)
af(select(2, ...))
-- Startup auto-send disabled; chat messages are only sent by a user-triggered GUI action.
