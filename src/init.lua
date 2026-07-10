-- note 2 self: aROK stands for autoRejoinOnKick

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local env = getgenv()

if not isfolder("brP") then makefolder("brP" ) end
if not isfile("brp/config.json") then
    makefile("brP/config.json", game:GetService("HttpService"):JSONEncode({
        settings = {
            aROK = false, 
        }
    }))
end

function env.import(id)
    return game:GetObjects("rbxassetid://"..id)[1]
end

function env.getgitpath(origin)
    local build = "https://raw.githubusercontent.com/somerandomcoderlol-design/brP/refs/heads/main/"
    if origin == "src" then
        return build.."/src"
    elseif origin == "games" then
        return build.."src/games"
    end

    return build.."src"
end

function env.setConfig(k, v)
    local httpservice = game:GetService("HttpService")
    local dec = httpservice:JSONDecode(readfile("brP/config.json"))
    dec[tostring(game.PlaceId)] = dec[tostring(game.PlaceId)] or {}
    dec[tostring(game.PlaceId)][k] = v
    writefile("brP/config.json", httpservice:JSONEncode(dec))
end

game:GetService("GuiService").ErrorMessageChanged:Connect(function()
    if env.autoRejoin then
        game:GetService("TeleportService"):Teleport(game.PlaceId)
    end
end)

loadstring(game:HttpGet(getgitpath("src").."ui.lua"))()