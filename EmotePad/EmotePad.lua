
EmotePad = LibStub("AceAddon-3.0"):NewAddon("EmotePad", "AceConsole-3.0", "AceEvent-3.0");

local AceGUI = LibStub("AceGUI-3.0");

function EmotePad:OnInitialize()

    -- Register chat commands to open the EmotePad
    self:RegisterChatCommand("epshow", "OpenEmotePad");
    self:RegisterChatCommand("ep", "OpenEmotePad");
    self:RegisterChatCommand("emotepad", "OpenEmotePad");
    self:RegisterChatCommand("ephelp", "EmotePadHelp");
    self:Print("EmotePad 0.8 loaded");
    self:Print("Type /ephelp for a list of commands");
    
end

function EmotePad:OpenEmotePad()
    local frame = AceGUI:Create("Frame");
    frame:SetTitle("EmotePad");
    frame:SetStatusText("EmotePad Version 0.8");

    -- Set initial size
    frame:SetWidth(400);
    frame:SetHeight(400);

    -- Define min and max sizes
    local minWidth, minHeight = 200, 450
    local maxWidth, maxHeight = 800, 450

    -- Resize width
    frame.frame:SetScript("OnUpdate", function(self)
        local width = self:GetWidth()
        local height = self:GetHeight()

        if width < minWidth then
            self:SetWidth(minWidth)
        elseif width > maxWidth then
            self:SetWidth(maxWidth)
        end

        if height < minHeight then
            self:SetHeight(minHeight)
        elseif height > maxHeight then
            self:SetHeight(maxHeight)
        end
    end)
    frame:SetCallback("OnClose", function(widget) AceGUI:Release(widget) end);
    frame:SetLayout("Flow");

    local editBox = AceGUI:Create("MultiLineEditBox");
    editBox:SetLabel("Type your emote here:");
    editBox:SetNumLines(10);
    editBox:SetMaxLetters(10000);
    editBox:SetFullWidth(true);
    editBox:DisableButton(true);
    editBox:SetHeight(320);
    

    frame:AddChild(editBox);

    local sayButton = AceGUI:Create("Button");
    sayButton:SetText("Say");
    sayButton:SetWidth(60);
    sayButton:SetCallback("OnClick", function() 
        local text = editBox:GetText();
        SendChatMessage(text, "SAY");
    end);
    frame:AddChild(sayButton);

    local emoteButton = AceGUI:Create("Button");
    emoteButton:SetText("Emote");
    emoteButton:SetWidth(60);
    emoteButton:SetCallback("OnClick", function() 
        local text = editBox:GetText();
        SendChatMessage(text, "EMOTE");
    end);
    frame:AddChild(emoteButton);

    local raidButton = AceGUI:Create("Button");
    raidButton:SetText("Raid");
    raidButton:SetWidth(60);
    raidButton:SetCallback("OnClick", function() 
        local text = editBox:GetText();
        SendChatMessage(text, "RAID");
    end);
    frame:AddChild(raidButton);

    local raidWarningButton = AceGUI:Create("Button");
    raidWarningButton:SetText("RW");
    raidWarningButton:SetWidth(60);
    raidWarningButton:SetCallback("OnClick", function() 
        local text = editBox:GetText();
        SendChatMessage(text, "RAID_WARNING");
    end);
    frame:AddChild(raidWarningButton);

    local partyButton = AceGUI:Create("Button");
    partyButton:SetText("Party");
    partyButton:SetWidth(60);
    partyButton:SetCallback("OnClick", function() 
        local text = editBox:GetText();
        SendChatMessage(text, "PARTY");
    end);
    frame:AddChild(partyButton);

end

function EmotePad:EmotePadHelp()
    self:Print("EmotePad Version 0.8");
    self:Print("Commands:");
    self:Print("/epshow, /ep, /emotepad - Open the EmotePad");
    self:Print("/ephelp - Show this help message");
end


