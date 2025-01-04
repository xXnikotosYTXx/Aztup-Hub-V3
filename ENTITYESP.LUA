local EntityESP = {}
EntityESP.__index = EntityESP

-- Constructor for creating a new Entity ESP
function EntityESP.new(player)
    local self = setmetatable({}, EntityESP)
    self._player = player
    self._playerName = player.Name
    self._espText = nil  -- Can be used to display name or other information

    -- Initialize Drawing objects
    self:InitDrawing()
    return self
end

function EntityESP:InitDrawing()
    self._espText = Drawing.new("Text")
    self._espText.Text = self._playerName
    self._espText.Size = 16
    self._espText.Color = Color3.fromRGB(255, 255, 255)
    self._espText.Visible = true
end

function EntityESP:Update()
    -- Update ESP drawing logic, such as position, size, color, etc.
    local screenPosition = workspace.CurrentCamera:WorldToScreenPoint(self._player.Character.PrimaryPart.Position)
    if screenPosition.Z > 0 then
        self._espText.Position = Vector2.new(screenPosition.X, screenPosition.Y)
    else
        self._espText.Visible = false
    end
end

function EntityESP:Hide()
    self._espText.Visible = false
end

function EntityESP:Destroy()
    self._espText:Remove()
end

return EntityESP
