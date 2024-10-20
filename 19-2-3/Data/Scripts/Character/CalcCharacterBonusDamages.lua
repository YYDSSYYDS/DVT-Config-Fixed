-- Only for DK MG SL when equip 2 Weapon for physical atk 
function CalcTwoSameWeaponBonus(AtkMinLeft, AtkMaxLeft, AtkMinRight, AtkMaxRight, Class)
	local OutDamageMinLeft = 0
	local OutDamageMaxLeft = 0
	local OutDamageMinRight = 0
	local OutDamageMaxRight = 0
	
	OutDamageMinLeft = AtkMinLeft * 65 / 100
	OutDamageMinRight = AtkMinRight * 65 / 100
	OutDamageMaxLeft = AtkMaxLeft * 65 / 100
	OutDamageMaxRight = AtkMaxRight * 65 / 100
	
	return OutDamageMinLeft, OutDamageMinRight, OutDamageMaxLeft, OutDamageMaxRight
end

-- Only for DK MG SL when equip 2 Weapon for physical atk 
function CalcTwoDifferentWeaponBonus(AtkMinLeft, AtkMaxLeft, AtkMinRight, AtkMaxRight, Class)
	local OutDamageMinLeft = 0
	local OutDamageMaxLeft = 0
	local OutDamageMinRight = 0
	local OutDamageMaxRight = 0
	
	OutDamageMinLeft = AtkMinLeft * 55 / 100
	OutDamageMinRight = AtkMinRight * 55 / 100
	OutDamageMaxLeft = AtkMaxLeft * 55 / 100
	OutDamageMaxRight = AtkMaxRight * 55 / 100
	
	return OutDamageMinLeft, OutDamageMinRight, OutDamageMaxLeft, OutDamageMaxRight
end

-- Only for RF when equip 2 Weapon for physical atk
function CalcRageFighterTwoWeaponBonus(AtkMinLeft, AtkMaxLeft, AtkMinRight, AtkMaxRight)
	local OutDamageMinLeft = 0
	local OutDamageMaxLeft = 0
	local OutDamageMinRight = 0
	local OutDamageMaxRight = 0
	
	OutDamageMinLeft = AtkMinLeft * 120 / 100 / 2
	OutDamageMinRight = AtkMinRight * 120 / 100 / 2
	OutDamageMaxLeft = AtkMaxLeft * 130 / 100 / 2
	OutDamageMaxRight = AtkMaxRight * 130 / 100 / 2
	
	return OutDamageMinLeft, OutDamageMinRight, OutDamageMaxLeft, OutDamageMaxRight
end

-- Only for MG when equip 2 one hand Staffs for MagicPowe (must 2 one hand staff,magic sword don't use this calcu)
function CalcMgTwoStaffsBonus(MagicPowerLeft, MagicPowerRight)
	local OutMagicPowerLeft = 0
	local OutMagicPowerRight = 0
	
	OutMagicPowerLeft = MagicPowerLeft * 65 / 100
	OutMagicPowerRight = MagicPowerRight * 65 / 100
	
	return OutMagicPowerLeft, OutMagicPowerRight
end

--For this 4 class when equip 2 Weapon for speed
function CalcIncreaseSpeed(LeftWeaponSpeed, RightWeaponSpeed)
	local OutSpeedLeft = 0
	local OutSpeedRight = 0

	OutSpeedLeft = LeftWeaponSpeed / 2
	OutSpeedRight = RightWeaponSpeed / 2

	return OutSpeedLeft, OutSpeedRight
end
