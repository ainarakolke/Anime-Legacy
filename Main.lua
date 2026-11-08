local BASE = "https://raw.githubusercontent.com/ainarakolke/Anime-Legacy/refs/heads/main/"

local function cargar(nombre, ...)
    local ok, res = pcall(function()
        local src = game:HttpGet(BASE .. nombre .. "?t=" .. os.time()) -- evita caché
        return loadstring(src)(...)
    end)
    if not ok then
        warn("[AutoTraits] Error cargando " .. nombre .. ": " .. tostring(res))
        return nil
    end
    return res
end

local UI = cargar("UI.lua")
if not UI then return end

cargar("AutoTraits.lua", UI)
