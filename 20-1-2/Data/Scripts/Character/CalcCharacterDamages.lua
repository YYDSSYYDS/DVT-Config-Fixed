-- Character Classes
CLASS_WIZARD                                          = 0	-- Fairy Elf, Muse Elf, High Elf
CLASS_KNIGHT                                          = 1	-- Dark Wizard, Soul Master, Grand Master
CLASS_ELF                                             = 2	-- Dark Knight, Blade Knight, Blade Master
CLASS_GLADIATOR                                       = 3	-- Magic Gladiator, Duel Master
CLASS_DARKLORD                                        = 4	-- Dark Lord, Lord Emperor
CLASS_SUMMONER                                        = 5	-- Summoner, Bloody Summoner, Dimension Master
CLASS_RAGEFIGHTER                                     = 6	-- Rage Fighter, Fist Master
CLASS_GROWLANCER									  = 7	-- Grow Lancer, Mirage Lancer
CLASS_RUNEWIZARD									  = 8	-- Rune Wizard, Rune Spell Master, Grand Rune Master
CLASS_SLAYER									  	  = 9	-- Slayer, Royal Slayer, Master Slayer, Slaughterer
CLASS_GUNCRUSHER									  = 10	-- Gun Crusher, Gun Breaker, Master Gun Breaker, Heist Gun Crusher
CLASS_LIGHTWIZARD									  = 11	-- Light Wizard, Shining Wizard, Luminous Wizard
CLASS_LEMURIAMAGE									  = 12	-- Lemuria Mage, Warmage, Archmage, Mystic Mage
CLASS_ILLUSIONKNIGHT								  	  = 13	-- Illusion Knight, Mirage Knight, Illusion Master, Mystic Knight
ClASS_ALCHEMIST										  = 14  -- Alchemist, ALCHEMIC MAGICIAN, ALCHEMIC MASTER, ALCHEMIC FORCE,CREATOR

-- Character Damage - Fist Fighting - (Dark Knight, Blade Knight, Blade Master)
-- Replace Option StatID="0" Class="1" and Option StatID="1" Class="1" in CharacterFormula.xml
function KnightDamageCalc(Strength, Dexterity, Vitality, Energy, IsSpecialBuff)
	local AttackDamageMinLeft = 0
	local AttackDamageMaxLeft = 0
	local AttackDamageMinRight = 0
	local AttackDamageMaxRight = 0
	
	if (IsSpecialBuff == 1) then -- Strong Belief buff id 325,336
		AttackDamageMinLeft = Strength / 9 -- Minimum Left Hand Damage
		AttackDamageMinRight = Strength / 9 -- Minimum Right Hand Damage
		AttackDamageMaxLeft = Strength / 6 -- Maximum Left Hand Damage
		AttackDamageMaxRight = Strength / 6 -- Maximum Right Hand Damage
	else
		AttackDamageMinLeft = Strength / 6 -- Minimum Left Hand Damage
		AttackDamageMinRight = Strength / 6 -- Minimum Right Hand Damage
		AttackDamageMaxLeft = Strength / 4 -- Maximum Left Hand Damage
		AttackDamageMaxRight = Strength / 4 -- Maximum Right Hand Damage
	end
	
	return AttackDamageMinLeft, AttackDamageMinRight, AttackDamageMaxLeft, AttackDamageMaxRight
end

-- Character Magic Damage - (Summoner, Bloody Summoner, Dimension Master)
-- Replace Option StatID="9" Class="5" , Option StatID="10" Class="5" ,Option StatID="11" Class="5" ,Option StatID="12" Class="5" in CharacterFormula.xml
function SummonerMagicDamageCalc(Energy, IsSpecialBuff)
	local MagicDamageMin = 0
	local MagicDamageMax = 0
	local CurseDamageMin = 0
	local CurseDamageMax = 0
	
	if (IsSpecialBuff == 1) then -- Darkness buff id 301,302,303
		MagicDamageMin = Energy / 18 --Option StatID="9"
		MagicDamageMax = Energy / 10 --Option StatID="10"
		CurseDamageMin = Energy / 9  --Option StatID="11"
		CurseDamageMax = Energy / 4  --Option StatID="12"
	else
		MagicDamageMin = Energy / 9   --Option StatID="9"
		MagicDamageMax = Energy / 4   --Option StatID="10"
		CurseDamageMin = Energy / 18  --Option StatID="11"
		CurseDamageMax = Energy / 10  --Option StatID="12"
	end
	
	return MagicDamageMin, MagicDamageMax, CurseDamageMin, CurseDamageMax
end

-- Character Magic Damage - (Gun Crusher, Gun Breaker, Master Gun Breaker)
-- Replace Option StatID="9" Class="10" , Option StatID="10" Class="10" in CharacterFormula.xml
function GunCrusherMagicDamageCalc(Energy, IsSpecialBuff)
	local MagicDamageMin = 0
	local MagicDamageMax = 0
	
	if (IsSpecialBuff == 1) then -- Fixed Fire buff id 380,381,382
		MagicDamageMin = Energy / 6 -- Minimum Magic Damage
		MagicDamageMax = Energy / 3 -- Maximum Magic Damage
	else
		MagicDamageMin = Energy / 8 -- Minimum Magic Damage
		MagicDamageMax = Energy / 4 -- Maximum Magic Damage
	end

	return MagicDamageMin, MagicDamageMax
end

-- Calc Character Attack Speed by Stats
-- Replace Option StatID="4" and Option StatID="5" in CharacterFormula.xml
function CalcAttackSpeed(Class, Dexterity,IsSpecialBuff)
	local AttackSpeed = 0
	local MagicSpeed = 0
	
	if(Class == CLASS_WIZARD) then
		AttackSpeed = Dexterity / 20
		MagicSpeed = Dexterity / 10
	elseif(Class == CLASS_KNIGHT) then
		AttackSpeed = Dexterity / 15
		MagicSpeed = Dexterity / 20
	elseif(Class == CLASS_ELF) then 
		AttackSpeed = Dexterity / 50
		MagicSpeed = Dexterity / 50
	elseif(Class == CLASS_GLADIATOR) then
		AttackSpeed = Dexterity / 10
		MagicSpeed = Dexterity / 20
	elseif(Class == CLASS_DARKLORD) then
		AttackSpeed = Dexterity / 10
		MagicSpeed = Dexterity / 10
	elseif(Class == CLASS_SUMMONER) then
		AttackSpeed = Dexterity / 20
		MagicSpeed = Dexterity / 20
	elseif(Class == CLASS_RAGEFIGHTER) then
		AttackSpeed = Dexterity / 9
		MagicSpeed = Dexterity / 9
	elseif(Class == CLASS_GROWLANCER) then
		AttackSpeed = Dexterity / 20
		MagicSpeed = Dexterity / 20
	elseif(Class == CLASS_RUNEWIZARD) then
		AttackSpeed = Dexterity / 12
		MagicSpeed = Dexterity / 12
	elseif(Class == CLASS_SLAYER) then
		AttackSpeed = Dexterity / 12
		MagicSpeed = Dexterity / 12
	elseif(Class == CLASS_GUNCRUSHER) then
		if (IsSpecialBuff == 1) then --  Fixed Fire buff id 380,381,382
			AttackSpeed = Dexterity / 13
			MagicSpeed = Dexterity / 13
		else
			AttackSpeed = Dexterity / 20
			MagicSpeed = Dexterity / 20
		end
	elseif(Class == CLASS_LIGHTWIZARD) then
		AttackSpeed = Dexterity / 20
		MagicSpeed = Dexterity / 10
	elseif(Class == CLASS_LEMURIAMAGE) then
		AttackSpeed = Dexterity / 20
		MagicSpeed = Dexterity / 10
	elseif(Class == CLASS_ILLUSIONKNIGHT) then
		AttackSpeed = Dexterity / 10
		MagicSpeed = Dexterity / 10
	elseif(Class == ClASS_ALCHEMIST) then
		AttackSpeed = Dexterity / 20
		MagicSpeed = Dexterity / 10	
	end
	
	return AttackSpeed, MagicSpeed
end


-- Character Defense - General
-- Replace Option StatID="6" in CharacterFormula.xml
function CalcDefense(Class, Strength, Dexterity, IsSpecialBuff)
	local Defense = 0
	
	if(Class == CLASS_WIZARD) then
		Defense = Dexterity / 4
	elseif(Class == CLASS_KNIGHT) then
		if (IsSpecialBuff == 1) then -- Strong Belief buff id 325,336
			Defense = Dexterity / 2
		else
			Defense = Dexterity / 3
		end
	elseif(Class == CLASS_ELF) then
		Defense = Dexterity / 10
	elseif(Class == CLASS_GLADIATOR) then
		Defense = Dexterity / 4
	elseif(Class == CLASS_DARKLORD) then
		Defense = Dexterity / 7
	elseif(Class == CLASS_SUMMONER) then
		Defense = Dexterity / 3
	elseif(Class == CLASS_RAGEFIGHTER) then
		Defense = Dexterity / 8
	elseif(Class == CLASS_GROWLANCER) then
		Defense = Dexterity / 7
	elseif(Class == CLASS_RUNEWIZARD) then
		Defense = Dexterity / 5
	elseif(Class == CLASS_SLAYER) then
		Defense = Dexterity / 5
	elseif(Class == CLASS_GUNCRUSHER) then
		if (IsSpecialBuff == 1) then --  Fixed Fire buff id 380,381,382
			Defense = Dexterity / 8
		else
			Defense = Dexterity / 4
		end
	elseif(Class == CLASS_LIGHTWIZARD) then
		Defense = Dexterity / 3
	elseif(Class == CLASS_LEMURIAMAGE) then
		Defense = Dexterity / 4
	elseif(Class == CLASS_ILLUSIONKNIGHT) then
		Defense = Dexterity / 10 + Strength / 5
	elseif(Class == ClASS_ALCHEMIST) then
		Defense = Dexterity / 4
	end
	
	return Defense
end

-- Character Elemental Defense - General
-- Replace Option StatID="13" in CharacterFormula.xml
function ElementalDefenseCalc(Class, Strength, Dexterity, Vitality, Energy, IsSpecialBuff)
	local Defense = 0
	
	if(Class == CLASS_WIZARD) then
		Defense = (Energy / 10) + (Dexterity / 6)
	elseif(Class == CLASS_KNIGHT) then
		if (IsSpecialBuff == 1) then -- Strong Belief buff id 325,336
			Defense = (Dexterity / 3) + (Energy / 4)
		else
			Defense = (Strength / 12) + (Energy / 11) + (Dexterity / 6)
		end
	elseif(Class == CLASS_ELF) then
		Defense = (Dexterity / 8) + (Energy / 8)
	elseif(Class == CLASS_GLADIATOR) then
		Defense = (Strength / 15) + (Energy / 15) + (Dexterity / 6)
	elseif(Class == CLASS_DARKLORD) then
		Defense = (Strength / 13) + (Dexterity / 7)
	elseif(Class == CLASS_SUMMONER) then
		Defense = (Energy / 13) + (Dexterity / 4)
	elseif(Class == CLASS_RAGEFIGHTER) then
		Defense = (Vitality / 8) + (Dexterity / 8)
	elseif(Class == CLASS_GROWLANCER) then
		Defense = (Strength / 9) + (Dexterity / 9)
	elseif(Class == CLASS_RUNEWIZARD) then
		Defense = (Dexterity / 10) + (Energy / 5)
	elseif(Class == CLASS_SLAYER) then
		Defense = (Strength / 12) + (Dexterity / 6)
	elseif(Class == CLASS_GUNCRUSHER) then
		Defense = (Energy / 8) + (Dexterity / 7)
	elseif(Class == CLASS_LIGHTWIZARD) then
		Defense = (Energy / 10) + (Dexterity / 6)
	elseif(Class == CLASS_LEMURIAMAGE) then
		Defense = (Energy / 5) + (Dexterity / 9)
	elseif(Class == CLASS_ILLUSIONKNIGHT) then
		Defense = (Strength / 6) + (Dexterity / 15)
	elseif(Class == ClASS_ALCHEMIST) then
		Defense = (Energy / 5) + (Dexterity / 9)
	end
	
	return Defense
end

function CalcStamina(Class, Strength, Dexterity, Vitality, Energy, Leadership, NormalLevel, MasterLevel, MajesticLevel)
	local Stamina = 0
	local TotalLevel = NormalLevel + MasterLevel + MajesticLevel
	
	if(Class == CLASS_WIZARD) then
		Stamina = (Strength * 0.2) + (Dexterity * 0.4) + (Vitality * 0.3) + (Energy * 0.2)
	elseif(Class == CLASS_KNIGHT) then
		Stamina = (Strength * 0.15) + (Dexterity * 0.2) + (Vitality * 0.3) + (Energy * 1.0)
	elseif(Class == CLASS_ELF) then
		Stamina = (Strength * 0.3) + (Dexterity * 0.2) + (Vitality * 0.3) + (Energy * 0.2)
	elseif(Class == CLASS_GLADIATOR) then
		Stamina = (Strength * 0.2) + (Dexterity * 0.25) + (Vitality * 0.3) + (Energy * 0.15)
	elseif(Class == CLASS_DARKLORD) then
		Stamina = (Strength * 0.3) + (Dexterity * 0.2) + (Vitality * 0.1) + (Energy * 0.15) + (Leadership * 0.3)
	elseif(Class == CLASS_SUMMONER) then
		Stamina = (Strength * 0.2) + (Dexterity * 0.25) + (Vitality * 0.3) + (Energy * 0.15)
	elseif(Class == CLASS_RAGEFIGHTER) then
		Stamina = (Strength * 0.15) + (Dexterity * 0.2) + (Vitality * 0.3) + (Energy * 1.0)
	elseif(Class == CLASS_GROWLANCER) then
		Stamina = (Strength * 0.15) + (Dexterity * 0.2) + (Vitality * 0.3) + (Energy * 1.0)
	elseif(Class == CLASS_RUNEWIZARD) then
		Stamina = (Strength * 0.15) + (Dexterity * 0.2) + (Vitality * 0.3) + (Energy * 1.0)
	elseif(Class == CLASS_SLAYER) then
		Stamina = (Strength * 0.15) + (Dexterity * 0.2) + (Vitality * 0.3) + (Energy * 1.0)
	elseif(Class == CLASS_GUNCRUSHER) then
		Stamina = (Strength * 0.2) + (Dexterity * 0.25) + (Vitality * 0.3) + (Energy * 0.15)
	elseif(Class == CLASS_LIGHTWIZARD) then
		Stamina = (Strength * 0.2) + (Dexterity * 0.24) + (Vitality * 0.2) + (Energy * 0.4)
	elseif(Class == CLASS_LEMURIAMAGE) then
		Stamina = (Strength * 0.2) + (Dexterity * 0.24) + (Vitality * 0.2) + (Energy * 0.4)
	elseif(Class == CLASS_ILLUSIONKNIGHT) then
		Stamina = (Strength * 0.3) + (Dexterity * 0.5) + (Vitality * 0.2) + (Energy * 0.2)
	elseif(Class == ClASS_ALCHEMIST) then
		Stamina = (Strength * 0.2) + (Dexterity * 0.24) + (Vitality * 0.2) + (Energy * 0.4)
	end
	
	return Stamina
end


