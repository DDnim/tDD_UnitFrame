local function tdd()
   
   TargetFrame:SetScale(2)
   TargetFrame.nameBackground:Hide()
   TargetFrameTextureFrameTexture:SetTexture("Interface\\AddOns\\tDD_UnitFrame\\target_boss")
   TargetFrameTextureFrameTexture:SetTexCoord(1.3,-0.45,-0.1,1.1)
   TargetFrameTextureFrameTexture:ClearAllPoints()
   TargetFrameTextureFrameTexture:SetPoint("CENTER")
   TargetFrameBackground:Hide()
   TargetFrame.deadText:ClearAllPoints()
   TargetFrame.deadText:SetPoint("CENTER", TargetFrameHealthBar, "CENTER", 0, 0)
   TargetFrameTextureFrameName:ClearAllPoints()
   TargetFrameTextureFrameName:SetPoint("BOTTOMRIGHT", TargetFrame, "TOP", 0, -20)
   TargetFrameHealthBar:ClearAllPoints()
   TargetFrameHealthBar:SetPoint("LEFT", 10, 0)
   TargetFrameHealthBar:SetHeight(18)
   TargetFrameHealthBar.background = TargetFrameHealthBar:CreateTexture("TargetFrameHealthBarBackground", "BACKGROUND")
   TargetFrameHealthBar.background:SetTexture(0, 0, 0, 0.5)
   TargetFrameHealthBar.background:SetAllPoints()
   TargetFrameTextureFrameHealthBarText:ClearAllPoints()
   TargetFrameTextureFrameHealthBarText:SetPoint("CENTER", TargetFrameHealthBar, "CENTER", 0, 0)
   TargetFrameManaBar:ClearAllPoints()
   TargetFrameManaBar:SetPoint("LEFT", 10, -15 )
   TargetFrameManaBar:SetHeight(10)
   TargetFrameManaBar.background = TargetFrameManaBar:CreateTexture("TargetFrameManaBarBackground", "BACKGROUND")
   TargetFrameManaBar.background:SetTexture(0, 0, 0, 0.5)
   TargetFrameManaBar.background:SetAllPoints()
   TargetFrameTextureFrameManaBarText:ClearAllPoints()
   TargetFrameTextureFrameManaBarText:SetPoint("CENTER", TargetFrameManaBar, "CENTER", 0, 0)
   TargetFrame.threatNumericIndicator:SetPoint("BOTTOM", PlayerFrame, "TOP", 75, -22)
   
   local mtindex = getmetatable(CreateFrame("StatusBar")).__index
   local mySetTexture = mtindex.SetStatusBarTexture
   local mySetTextureColor = mtindex.SetStatusBarColor
   
   mySetTexture(TargetFrameManaBar,"Interface\\AddOns\\tDD_UnitFrame\\Steel")
   mySetTexture(TargetFrameHealthBar,"Interface\\AddOns\\tDD_UnitFrame\\Steel" )
   mySetTextureColor(TargetFrameHealthBar,0.5,0.8,0.3,1)
   mySetTextureColor(TargetFrameManaBar,1,1,1,1)
   
end

local c = CreateFrame( "frame", nil,UIParent);
c:RegisterEvent("PLAYER_TARGET_CHANGED")
c:SetScript('OnEvent',
   function()
      tdd()
   end
)
