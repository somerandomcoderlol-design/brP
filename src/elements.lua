local elements = import(115718494709261)
local stuff = {}

function stuff:Button(str, par, clicked)
    local lab = elements.Button:Clone()
    lab.Label.Text = str
    lab.Parent = par

    lab.Button.MouseButton1Click:Connect(clicked)

    return lab
end

function stuff:Toggle(str, par, default, clicked)
    local toggle = elements.Toggle:Clone()
    toggle.Label.Text = str
    toggle.Parent = par

    local toggled = default
    if toggled then
        toggle.OnState.Visible = true
    else
        toggle.OnState.Visible = false
    end

    task.defer(function() clicked(toggled) end)

    toggle.Button.MouseButton1Click:Connect(function()
        toggled = not toggled
        if toggled then
            toggle.OnState.Visible = true
        else
            toggle.OnState.Visible = false
        end

        clicked(toggled)
    end
end

return stuff