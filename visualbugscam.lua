local HttpService = game:GetService("HttpService")

-- URL, von der du Daten abrufen möchtest
local url = "https://example.com/visualbugstatus"  -- Ersetze dies durch deine tatsächliche URL

-- Funktion, um HTTP-Request zu senden
local function GetVisualBugStatus()
    local success, response = pcall(function()
        return HttpService:GetAsync(url)
    end)

    if success then
        -- Wenn die Anfrage erfolgreich war, analysiere die Antwort
        local data = HttpService:JSONDecode(response)

        if data.visualBugEnabled then
            ActivateVisualBug()  -- Aktiviert den Visual Bug, wenn die Antwort dies angibt
        else
            ResetVisualBug()  -- Setzt den Visual Bug zurück, wenn die Antwort dies angibt
        end
    else
        warn("Fehler beim Abrufen des Visual Bug Status: " .. response)
    end
end

-- GUI für den Button erstellen
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui
ScreenGui.Name = "VisualBugGui"

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0, 200, 0, 50)
Button.Position = UDim2.new(0.5, -100, 0.8, -25)
Button.Text = "Lade Visual Bug Status"
Button.Parent = ScreenGui
Button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

-- Button-Click-Event
Button.MouseButton1Click:Connect(function()
    GetVisualBugStatus()  -- Lade den Status über HTTP
end)

-- Visual Bug Funktionen
local VisualBugItems = {}

local function ActivateVisualBug()
    -- Hier kommt deine Funktion, um den Visual Bug zu aktivieren
    print("🎭 Visual Bug aktiviert!")
    Button.Text = "Visual Bug Deaktivieren"
    Button.BackgroundColor3 = Color3.fromRGB(0, 255, 0)  -- Button wird grün
end

local function ResetVisualBug()
    -- Hier kommt deine Funktion, um den Visual Bug zu deaktivieren
    print("🔄 Visual Bug deaktiviert!")
    Button.Text = "Visual Bug Aktivieren"
    Button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Button wird rot
end
