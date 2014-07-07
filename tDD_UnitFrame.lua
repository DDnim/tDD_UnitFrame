--[[
Thanks 佛萼千草 & yaroot 

Author: BN_ASIA Tushu#3421
]]--

local function tdd()

PlayerName:SetWidth(0.01)

PlayerFrame:SetScale(2)
PlayerFrameGroupIndicatorText:ClearAllPoints()
PlayerFrameGroupIndicatorText:SetPoint("BOTTOMLEFT", PlayerFrame, "TOP", 0, -20)
PlayerFrameGroupIndicatorLeft:Hide()
PlayerFrameGroupIndicatorMiddle:Hide()
PlayerFrameGroupIndicatorRight:Hide()
PlayerFrameHealthBar:ClearAllPoints()
PlayerFrameHealthBar:SetPoint("LEFT", 100, 0)
PlayerFrameHealthBar:SetHeight(18)
PlayerFrameHealthBar:SetFrameStrata("LOW")
PlayerFrameHealthBarText:ClearAllPoints()
PlayerFrameHealthBarText:SetPoint("CENTER", PlayerFrameHealthBar, "CENTER", 0, 0)

PlayerFrameManaBar:ClearAllPoints()
PlayerFrameManaBar:SetPoint("LEFT", 100, -15)
PlayerFrameManaBar.SetPoint= function() end
PlayerFrameManaBar:SetFrameStrata("LOW")
PlayerFrameManaBar:SetHeight(10)
PlayerFrameManaBarText:ClearAllPoints()
PlayerFrameManaBarText:SetPoint("CENTER", PlayerFrameManaBar, "CENTER", 55550, 55550)


PlayerFrameTexture:SetTexture("Interface\\AddOns\\tDD_UnitFrame\\player_player")
PlayerFrameTexture:SetTexCoord(0,0.83,0,1.01)
PlayerFrameTexture:Show()



local mtindex = getmetatable(CreateFrame("StatusBar")).__index
local mySetTexture = mtindex.SetStatusBarTexture
local mySetTextureColor = mtindex.SetStatusBarColor


mySetTexture(PlayerFrameManaBar,"Interface\\AddOns\\tDD_UnitFrame\\Steel")
mySetTexture(PlayerFrameHealthBar,"Interface\\AddOns\\tDD_UnitFrame\\Steel" )
mySetTextureColor(PlayerFrameHealthBar,0.5,0.8,0.3,1)
mySetTextureColor(PlayerFrameManaBar,1,1,1,1)

mtindex.SetStatusBarColor = function() end

PlayerLevelText:SetPoint("TOPLEFT",52,-20)


PlayerFrameGroupIndicator:Hide()

PlayerFrameBackground:Show()
PlayerFrameBackground:SetTexture("Interface\\AddOns\\tDD_UnitFrame\\player_bg")
PlayerFrameBackground:SetTexCoord(0,0.83,0,1.01)
PlayerFrameBackground:SetAllPoints(PlayerFrame)

PlayerFrameBackground:SetWidth(500)




end

local c = CreateFrame( "frame", nil,UIParent);
c:RegisterEvent("PLAYER_LOGIN")
c:SetScript('OnEvent',
	function()
		LoadAddOn("Blizzard_TalentUI")
		tdd()
	end
		)
