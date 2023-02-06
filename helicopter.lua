--ААААА НЕГРЫ
CVar.FindVar("cl_crosshairalpha"):SetInt(1)


-- ColorPicker
local window = Menu.CreateWindow("Helicopter Aim##title", 2)
local helicopter_color_picker  = window:AddCheckbox("Helicopter##indicator", false)
local color_h = helicopter_color_picker:AddColorEdit("Normal Color##keys", Color.FromRGBA(255, 39, 39, 255), function()end, EColorEditFlags.None)

-- Helicopter
local math_ceil, math_tan, math_correctRadians, math_fact, math_log10, math_randomseed, math_cos, math_sinh, math_random, math_huge, math_pi, math_max, math_atan2, math_ldexp, math_floor, math_sqrt, math_deg, math_atan = math.ceil, math.tan, math.correctRadians, math.fact, math.log10, math.randomseed, math.cos, math.sinh, math.random, math.huge, math.pi, math.max, math.atan2, math.ldexp, math.floor, math.sqrt, math.deg, math.atan 
local math_fmod, math_acos, math_pow, math_abs, math_min, math_sin, math_frexp, math_log, math_tanh, math_exp, math_modf, math_cosh, math_asin, math_rad = math.fmod, math.acos, math.pow, math.abs, math.min, math.sin, math.frexp, math.log, math.tanh, math.exp, math.modf, math.cosh, math.asin, math.rad 

local function DEG2RAD(x) return x * math_pi / 180 end
local function RAD2DEG(x) return x * 180 / math_pi end

local rotationdegree = 0.000;

local function draw_helicopter(x, y, size)
    local frametime = GlobalVars.flFrameTime
    local a = size / 60
    local gamma = math_atan(a / a)
    if rotationdegree > 89 then rotationdegree = 0 end
    local color = color_h:GetValue()
    for i = 0, 4 do  
        local p_0 = (a * math_sin(DEG2RAD(rotationdegree + (i * 90))))
        local p_1 = (a * math_cos(DEG2RAD(rotationdegree + (i * 90))))
        local p_2 =((a / math_cos(gamma)) * math_sin(DEG2RAD(rotationdegree + (i * 90) + RAD2DEG(gamma))))
        local p_3 =((a / math_cos(gamma)) * math_cos(DEG2RAD(rotationdegree + (i * 90) + RAD2DEG(gamma))))


        firstline_start = Vector2D.new(x, y)
        firstline_end = Vector2D.new(x + p_0, y - p_1)
        Render.Line(firstline_start, firstline_end, color, 1)

        secondline_start = Vector2D.new(x + p_0, y - p_1)
        secondline_end = Vector2D.new(x + p_2, y - p_3)
        Render.Line(secondline_start, secondline_end, color, 1)
    end
    rotationdegree = rotationdegree + (frametime * 150)
end

Hooks.RegisterCallback("OnDraw", function()
    screen_size = Engine.GetScreenSize()
    draw_helicopter(screen_size.x / 2, screen_size.y / 2, screen_size.y /2) 
end)
