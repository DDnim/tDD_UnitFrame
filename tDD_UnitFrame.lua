local _, class = UnitClass("player")
T_UNBATTLE = true


if class == "DEATHKNIGHT" then
    RuneButtonIndividual1:ClearAllPoints()
    RuneButtonIndividual1:SetPoint("BOTTOMLEFT",-25,-10)
end
if class == "WARLOCK" then
	ShardBarFrame:ClearAllPoints()
	ShardBarFrame:SetPoint("BOTTOMLEFT",-25,-10)
    BurningEmbersBarFrame:ClearAllPoints()
    BurningEmbersBarFrame:SetPoint("BOTTOMLEFT",-40,-1)
	DemonicFuryBarFrame:ClearAllPoints()
    DemonicFuryBarFrame:SetPoint("BOTTOMLEFT",-50, -24)
end
if class == "SHAMAN" then
	TotemFrame:ClearAllPoints()
	TotemFrame:SetPoint("BOTTOMLEFT",100,-10)
end
if class == "DRUID" then
	EclipseBarFrame:ClearAllPoints()
	EclipseBarFrame:SetPoint("BOTTOMLEFT",50,-10)
end	
if class == "PALADIN" then
	PaladinPowerBar:ClearAllPoints()
	PaladinPowerBar:SetPoint("BOTTOMLEFT",75,-10)
end
if class == "MONK" then
	MonkHarmonyBar:ClearAllPoints()
	MonkHarmonyBar:SetPoint("BOTTOMLEFT",125,-20)
end
if class == "PRIEST" then
	PriestBarFrame:ClearAllPoints()
	PriestBarFrame:SetPoint("BOTTOMLEFT",-25,-10)
end



local function t_login()

	PlayerName:SetWidth(0.01)

	local x={PlayerFrame:GetRegions()}

	x[3]:ClearAllPoints()
	x[3]:SetPoint("LEFT",-33,5)
	x[3]:SetWidth(80)
	x[3]:SetHeight(80)
	
	PlayerFrameGroupIndicatorLeft:Hide()
	PlayerFrameGroupIndicatorMiddle:Hide()
	PlayerFrameGroupIndicatorRight:Hide()

	PlayerLevelText:SetPoint("TOPLEFT",-36,-15)
	PlayerLevelText:SetFont('Interface\\AddOns\\tDD_UnitFrame\\edo.ttf', 12, 'THINOUTLINE')
	
	PlayerHitIndicator:SetPoint("LEFT",-65,0)
	PlayerFrameVehicleTexture:SetAlpha(0)
 
 
	PlayerFrameHealthBarText:ClearAllPoints()
	PlayerFrameHealthBarText:SetPoint("CENTER", PlayerFrameHealthBar, "CENTER", 0, 0)

     --PlayerFrameTexture
   PlayerFrameTexture:SetTexture("Interface\\AddOns\\tDD_UnitFrame\\player_player")
   PlayerFrameTexture:ClearAllPoints()
   PlayerFrameTexture:SetPoint("CENTER")
   PlayerFrameTexture:SetTexCoord(0,1,0,1)
   PlayerFrameTexture:Show()
   
   --PlayerFrameBackground
   PlayerFrameBackground:Show()
   PlayerFrameBackground:SetTexture("Interface\\AddOns\\tDD_UnitFrame\\player_bg")
   PlayerFrameBackground:SetTexCoord(0,1,0,1)
   PlayerFrameBackground:ClearAllPoints()
   PlayerFrameBackground:SetAllPoints(PlayerFrameTexture)
 
   --testing
   local mtindex = getmetatable(CreateFrame("StatusBar")).__index
   local mySetTexture = mtindex.SetStatusBarTexture
   local mySetTextureColor = mtindex.SetStatusBarColor
   
   
   mySetTexture(PlayerFrameManaBar,"Interface\\AddOns\\tDD_UnitFrame\\Steel")
   mySetTexture(PlayerFrameHealthBar,"Interface\\AddOns\\tDD_UnitFrame\\Steel" )
   mySetTextureColor(PlayerFrameHealthBar,1,0.3,0.4,0.5)
   mySetTextureColor(PlayerFrameManaBar,1,1,1,1)

	PlayerStatusTexture:SetAllPoints(PlayerFrameBackground)
   
   --PlayerFrameAlternateManaBar
   if class == "DRUID" then
	   local x={PlayerFrameAlternateManaBar:GetRegions()}
	   PlayerFrameAlternateManaBar:ClearAllPoints()
	   PlayerFrameAlternateManaBar:SetPoint("LEFT",62,15)
		PlayerFrameAlternateManaBar:SetWidth(189)
	   for i=3,5 do
		  x[i]:Hide()
	   end
	   x[7]:SetPoint("CENTER",0,5555)
	   x[8]:SetTexture("Interface\\AddOns\\tDD_UnitFrame\\Steel" )
	end
	
   PlayerFrame:GetRegions():SetTexture("Interface\\AddOns\\tDD_UnitFrame\\player_bg")
   PlayerFrame:GetRegions():SetTexCoord(0, 1, 0, 1);
   PlayerFrame:GetRegions():SetAllPoints(PlayerFrameBackground)



end


local function t_update()

	PlayerFrameTexture:Show()
 --PlayerFrameGroupIndicatorText
	PlayerFrameGroupIndicatorText:ClearAllPoints()
	PlayerFrameGroupIndicatorText:SetPoint("BOTTOMLEFT", PlayerFrame, "TOP", 0, -20)

   PlayerFrameHealthBar:ClearAllPoints()
   PlayerFrameHealthBar:SetPoint("LEFT", 52, -1)
   PlayerFrameHealthBar:SetHeight(18)
   PlayerFrameHealthBar:SetWidth(211)
 --  PlayerFrameHealthBar:SetFrameStrata("LOW")
   PlayerFrameHealthBarText:ClearAllPoints()
   PlayerFrameHealthBarText:SetPoint("CENTER", PlayerFrameHealthBar, "CENTER", 0, 0)
   --PlayerFrameManaBar
   PlayerFrameManaBar:ClearAllPoints()
   PlayerFrameManaBar:SetPoint("LEFT", 61, -18)
  -- PlayerFrameManaBar.SetPoint= function() end
  -- PlayerFrameManaBar:SetFrameStrata("LOW")
   PlayerFrameManaBar:SetHeight(10)
   PlayerFrameManaBar:SetWidth(189)
   PlayerFrameManaBarText:ClearAllPoints()
   PlayerFrameManaBarText:SetPoint("CENTER", PlayerFrameManaBar, "CENTER", 2, 0)
	-- Icons
	PlayerPVPIcon:ClearAllPoints()
	PlayerPVPIcon:SetPoint("LEFT",40,20)
	PlayerAttackIcon:Hide()
	PlayerLeaderIcon:ClearAllPoints()
	PlayerLeaderIcon:SetPoint("LEFT",2,45)
	PlayerMasterIcon:ClearAllPoints()
	PlayerMasterIcon:SetPoint("LEFT",15,45)
    --PlayerStatus
	PlayerStatusTexture:SetTexture("Interface\\AddOns\\tDD_UnitFrame\\player_bg")
	PlayerStatusTexture:SetTexCoord(0, 1, 0, 1);
	PlayerFrame:GetRegions():SetTexture("Interface\\AddOns\\tDD_UnitFrame\\player_bg")
	PlayerFrame:GetRegions():SetTexCoord(-0.15, 1.15, 0.05, 0.92);
	PlayerFrame:GetRegions():SetAllPoints(PlayerFrameBackground)
 
end


local c = CreateFrame( "frame", nil,UIParent);
c:RegisterEvent("PLAYER_LOGIN")
c:RegisterEvent("PLAYER_REGEN_ENABLED")
c:RegisterEvent("PLAYER_REGEN_DISABLED")


c:SetScript('OnEvent',
 function(self,event)
	if event == "PLAYER_LOGIN" then
		t_login()
	end
	local hp = UnitHealth("player")/UnitHealthMax("player")

	if event == "PLAYER_REGEN_ENABLED" then
		PlayerFrameTexture:SetTexture("Interface\\AddOns\\tDD_UnitFrame\\player_player")
	elseif event == "PLAYER_REGEN_DISABLED" then
		PlayerFrameTexture:SetTexture("Interface\\AddOns\\tDD_UnitFrame\\player_player_high")
	end
end
 )


hooksecurefunc("PlayerFrame_UpdateStatus", t_update)
hooksecurefunc("PlayerFrame_UpdateArt", t_update)
hooksecurefunc("PlayerFrame_SequenceFinished", t_update)
