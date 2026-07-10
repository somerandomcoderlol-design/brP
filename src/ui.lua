print("ui start")
local hui = gethui or get_hidden_gui
local getexec = identifyexecutor
local coregui = game:GetService("CoreGui")

--game:GetObjects("rbxassetid://89236154208315")[1].Parent = workspace

local ui = import(89236154208315)

ui.Parent = hui and hui() or coregui

local toggle = ui.Toggle
local main = ui.Container
main.Visible = true

print(ui.Parent)