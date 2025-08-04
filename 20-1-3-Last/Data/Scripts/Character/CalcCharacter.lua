-- //============================================================
-- //== 				MUONLINE SERVER EMULATOR			   ==
-- //== 				    POWERED BY DV-Team				   ==
-- //== 				File Name: CalcCharacter			   ==
-- //============================================================

-- Character Classes
CLASS_WIZARD = 0 -- Dark Wizard, Soul Master, Grand Master
CLASS_KNIGHT = 1 -- Dark Knight, Blade Knight, Blade Master
CLASS_ELF = 2 -- Fairy Elf, Muse Elf, High Elf
CLASS_GLADIATOR = 3 -- Magic Gladiator, Duel Master
CLASS_DARKLORD = 4 -- Dark Lord, Lord Emperor
CLASS_SUMMONER = 5 -- Summoner, Bloody Summoner, Dimension Master
CLASS_RAGEFIGHTER = 6 -- Rage Fighter, Fist Master
CLASS_GROWLANCER = 7 -- Grow Lancer, Mirage Lancer
CLASS_RUNEWIZARD = 8 -- Rune Wizard, Rune Spell Master, Grand Rune Master
CLASS_SLAYER = 9 -- Slayer, Royal Slayer, Master Slayer, Slaughterer
CLASS_GUNCRUSHER = 10 -- Gun Crusher, Gun Breaker, Master Gun Breaker, Heist Gun Crusher
CLASS_LIGHTWIZARD = 11 -- Light Wizard, Shining Wizard, Luminous Wizard
CLASS_LEMURIAMAGE = 12 -- Lemuria Mage, Warmage, Archmage, Mystic Mage
CLASS_ILLUSIONKNIGHT = 13 -- Illusion Knight, Mirage Knight, Illusion Master, Mystic Knight
CLASS_ALCHEMIST = 14 -- Alchemist, Alchemic Magician, Alchemic Master, Alchemic Force, Creator

-- Character Damage - Fist Fighting - (Dark Wizard, Soul Master, Grand Master)
function WizardDamageCalc(Strength, Dexterity, Vitality, Energy)
	local AttackDamageMin = 0
	local AttackDamageMax = 0
		
	AttackDamageMin = Strength / 8 -- Minimum Left Hand Damage
	AttackDamageMax = Strength / 4 -- Maximum Left Hand Damage	
	
	return AttackDamageMin, AttackDamageMax
end

-- Character Damage - Fist Fighting - (Dark Knight, Blade Knight, Blade Master)
function KnightDamageCalc(Strength, Dexterity, Vitality, Energy, IsSpecialBuff)
	
	local AttackDamageMin = 0
	local AttackDamageMax = 0
	
	
	if (IsSpecialBuff == 1) then -- Strong Belief
		AttackDamageMin = Strength / 9 -- Minimum Left Hand Damage
		AttackDamageMax = Strength / 6 -- Maximum Left Hand Damage		
	else
		AttackDamageMin = Strength / 6 -- Minimum Left Hand Damage
		AttackDamageMax = Strength / 4 -- Maximum Left Hand Damage		
	end
	
	return AttackDamageMin, AttackDamageMax
end

-- Character Damage without bow - Fist Fighting - (Fairy Elf, Muse Elf, High Elf)
function ElfWithoutBowDamageCalc(Strength, Dexterity, Vitality, Energy)
	local AttackDamageMin = 0
	local AttackDamageMax = 0
	
	AttackDamageMin = (Dexterity + Strength) / 7 -- Minimum Left Hand Damage
	AttackDamageMax = (Dexterity + Strength) / 4 -- Maximum Left Hand Damage

	return AttackDamageMin, AttackDamageMax
end

-- Character Damage with Bow - (Fairy Elf, Muse Elf, High Elf)
function ElfWithBowDamageCalc(Strength, Dexterity, Vitality, Energy)
	local AttackDamageMin = 0
	local AttackDamageMax = 0
		
	AttackDamageMin = Strength / 14 + Dexterity / 7 -- Minimum Left Hand Damage
	AttackDamageMax = Strength / 8 + Dexterity / 4 -- Maximum Left Hand Damage
	
	
	return AttackDamageMin, AttackDamageMax
end

-- Character Damage - Fist Fighting - (Magic Gladiator, Duel master)
function GladiatorDamageCalc(Strength, Dexterity, Vitality, Energy)
	
	local AttackDamageMin = 0
	local AttackDamageMax = 0
	
	AttackDamageMin = Strength / 6 + Energy / 12 -- Minimum Left Hand Damage
	AttackDamageMax = Strength / 4 + Energy / 8 -- Maximum Left Hand Damage
	
	
	return AttackDamageMin, AttackDamageMax
end

-- Character Damage - Fist Fighting - (Dark Lord, Lord Emperor)
function LordDamageCalc(Strength, Dexterity, Vitality, Energy, Command)
	local AttackDamageMin = 0
	local AttackDamageMax = 0

	
	AttackDamageMin = Strength / 7 + Energy / 14 + Command / 7 -- Minimum Left Hand Damage
	AttackDamageMax = Strength / 5 + Energy / 10 + Command / 5 -- Maximum Left Hand Damage	
	
	return AttackDamageMin, AttackDamageMax
end

-- Character Damage - Fist Fighting - (Summoner, Bloody Summoner, Dimension Master)
function SummonerDamageCalc(Strength, Dexterity, Vitality, Energy)
	local AttackDamageMin = 0
	local AttackDamageMax = 0
	
	
	AttackDamageMin = (Dexterity + Strength) / 7 -- Minimum Left Hand Damage
	AttackDamageMax = (Dexterity + Strength) / 4 -- Maximum Left Hand Damage	
	
	return AttackDamageMin, AttackDamageMax
end

-- Character Damage - Fist Fighting - (Rage Fighter, Fist Master)
function RageFighterDamageCalc(Strength, Dexterity, Vitality, Energy)
	local AttackDamageMin = 0
	local AttackDamageMax = 0
		
	AttackDamageMin = Strength / 7 + Vitality / 15 -- Minimum Left Hand Damage
	AttackDamageMax = Strength / 5 + Vitality / 12 -- Maximum Left Hand Damage
	
	return AttackDamageMin, AttackDamageMax
end

-- Character Damage - Fist Fighting - (Grow Lancer, Mirage Lancer)
function GrowLancerDamageCalc(Strength, Dexterity, Vitality, Energy)
	local AttackDamageMin = 0
	local AttackDamageMax = 0
		
	AttackDamageMin = Strength / 8 + Dexterity / 10 -- Minimum Left Hand Damage	
	AttackDamageMax = Strength / 4 + Dexterity / 6 -- Maximum Left Hand Damage
	
	
	return AttackDamageMin, AttackDamageMax
end

function RuneWizardDamageCalc(Strength, Dexterity, Vitality, Energy)
	
	local AttackDamageMin = 0
	local AttackDamageMax = 0
	
	
	AttackDamageMin = Strength / 8 -- Minimum Left Hand Damage
	AttackDamageMax = Strength / 4 -- Maximum Right Hand Damage
	
	return AttackDamageMin, AttackDamageMax
end

function SlayerDamageCalc(Strength, Dexterity, Vitality, Energy)
	local AttackDamageMin = 0
	local AttackDamageMax = 0
	
	AttackDamageMin = (Dexterity / 20) + (Strength / 9) -- Minimum Left Hand Damage
	AttackDamageMax = (Dexterity / 14) + (Strength / 5) -- Maximum Left Hand Damage

	return AttackDamageMin, AttackDamageMax
end

function GunCrusherDamageCalc(Strength, Dexterity, Vitality, Energy)
	local AttackDamageMin = 0
	local AttackDamageMax = 0
	
	AttackDamageMin = Strength / 8 -- Minimum Left Hand Damage
	AttackDamageMax = Strength / 5 -- Maximum Left Hand Damage	
	
	return AttackDamageMin, AttackDamageMax
end

function LightWizardDamageCalc(Strength, Dexterity, Vitality, Energy)
	local AttackDamageMin = 0
	local AttackDamageMax = 0
	
	
	AttackDamageMin = Strength / 8 -- Minimum Left Hand Damage
	AttackDamageMax = Strength / 4 -- Maximum Left Hand Damage

	return AttackDamageMin, AttackDamageMax
end

function LemuriaMageDamageCalc(Strength, Dexterity, Vitality, Energy)
	local AttackDamageMin = 0
	local AttackDamageMax = 0
	
	AttackDamageMin = Strength / 8 -- Minimum Left Hand Damage
	AttackDamageMax = Strength / 4 -- Maximum Left Hand Damage
		
	return AttackDamageMin, AttackDamageMax
end

function IllusionKnightDamageCalc(Strength, Dexterity, Vitality, Energy)
	local AttackDamageMin = 0
	local AttackDamageMax = 0
	
	
	AttackDamageMin = Dexterity / 9 + Strength / 11 -- Minimum Left Hand Damage
	AttackDamageMax = Dexterity / 6 + Strength / 9 -- Maximum Left Hand Damage	
	
	return AttackDamageMin, AttackDamageMax
end

function AlchemistDamageCalc(Strength, Dexterity, Vitality, Energy)
	local AttackDamageMin = 0
	local AttackDamageMax = 0
		
	AttackDamageMin = Strength / 8 -- Minimum Left Hand Damage
	AttackDamageMax = Strength / 4 -- Maximum Left Hand Damage
		
	return AttackDamageMin, AttackDamageMax
end

-- Character Magic Damage - (Dark Wizard, Soul Master, Grand Master)
function WizardMagicDamageCalc(Energy)
	local MagicDamageMin = 0
	local MagicDamageMax = 0
	
	MagicDamageMin = Energy / 9 -- Minimum Magic Damage
	MagicDamageMax = Energy / 4 -- Maximum Magic Damage
	
	return MagicDamageMin, MagicDamageMax
end

-- Character Magic Damage - (Dark Knight, Blade Knight, Blade Master)
function KnightMagicDamageCalc(Energy)
	local MagicDamageMin = 0
	local MagicDamageMax = 0
	
	MagicDamageMin = Energy / 9 -- Minimum Magic Damage
	MagicDamageMax = Energy / 4 -- Maximum Magic Damage
	
	return MagicDamageMin, MagicDamageMax
end

-- Character Magic Damage - (Fairy Elf, Muse Elf, High Elf)
function ElfMagicDamageCalc(Energy)
	local MagicDamageMin = 0
	local MagicDamageMax = 0
	
	MagicDamageMin = Energy / 9 -- Minimum Magic Damage
	MagicDamageMax = Energy / 4 -- Maximum Magic Damage
	
	return MagicDamageMin, MagicDamageMax
end

-- Character Magic Damage - (Magic Gladiator, Duel Master)
function GladiatorMagicDamageCalc(Energy)
	local MagicDamageMin = 0
	local MagicDamageMax = 0
	
	MagicDamageMin = Energy / 9 -- Minimum Magic Damage
	MagicDamageMax = Energy / 4 -- Maximum Magic Damage
	
	return MagicDamageMin, MagicDamageMax
end

-- Character Magic Damage - (Dark Lord, Lord Emperor)
function LordMagicDamageCalc(Energy)
	local MagicDamageMin = 0
	local MagicDamageMax = 0
	
	MagicDamageMin = Energy / 9 -- Minimum Magic Damage
	MagicDamageMax = Energy / 4 -- Maximum Magic Damage
	
	return MagicDamageMin, MagicDamageMax
end

-- Character Magic Damage - (Summoner, Bloody Summoner, Dimension Master)
function SummonerMagicDamageCalc(Energy, IsSpecialBuff)
	local MagicDamageMin = 0
	local MagicDamageMax = 0
	local CurseDamageMin = 0
	local CurseDamageMax = 0
	
	if (IsSpecialBuff == 1) then -- Darkness
		MagicDamageMin = Energy / 18
		MagicDamageMax = Energy / 10
		CurseDamageMin = Energy / 9
		CurseDamageMax = Energy / 4
	else
		MagicDamageMin = Energy / 9
		MagicDamageMax = Energy / 4
		CurseDamageMin = Energy / 18
		CurseDamageMax = Energy / 10
	end
	
	return MagicDamageMin, MagicDamageMax, CurseDamageMin, CurseDamageMax
end

-- Magic Damage is not used by Rage Fighter, refer to individual Rage Fighter skills formulas 
-- Character Magic Damage - (Rage Fighter, Fist Master)
function RageFighterMagicDamageCalc(Energy)
	local MagicDamageMin = 0
	local MagicDamageMax = 0
	
	MagicDamageMin = Energy / 9 -- Minimum Magic Damage
	MagicDamageMax = Energy / 4 -- Maximum Magic Damage
	
	return MagicDamageMin, MagicDamageMax
end

-- Character Magic Damage - (Grow Lancer, Mirage Lancer)
function GrowLancerMagicDamageCalc(Energy)
	local MagicDamageMin = 0
	local MagicDamageMax = 0
	
	MagicDamageMin = Energy / 9 -- Minimum Magic Damage
	MagicDamageMax = Energy / 4 -- Maximum Magic Damage
	
	return MagicDamageMin, MagicDamageMax
end

-- Character Magic Damage - (Rune Wizard, Rune Spell Master, Grand Rune Master)
function RuneWizardMagicDamageCalc(Energy)
	local MagicDamageMin = 0
	local MagicDamageMax = 0
	
	MagicDamageMin = Energy / 9 -- Minimum Magic Damage
	MagicDamageMax = Energy / 4 -- Maximum Magic Damage
	
	return MagicDamageMin, MagicDamageMax
end

-- Character Magic Damage - (Slayer, Royal Slayer, Master Slayer)
function SlayerMagicDamageCalc(Energy)
	local MagicDamageMin = 0
	local MagicDamageMax = 0
	
	MagicDamageMin = Energy / 9 -- Minimum Magic Damage
	MagicDamageMax = Energy / 4 -- Maximum Magic Damage
	
	return MagicDamageMin, MagicDamageMax
end

-- Character Magic Damage - (Gun Crusher, Gun Breaker, Master Gun Breaker)
function GunCrusherMagicDamageCalc(Energy, IsSpecialBuff)
	local MagicDamageMin = 0
	local MagicDamageMax = 0
	
	if (IsSpecialBuff == 1) then -- Fixed Fire
		MagicDamageMin = Energy / 6 -- Minimum Magic Damage
		MagicDamageMax = Energy / 3 -- Maximum Magic Damage
	else
		MagicDamageMin = Energy / 8 -- Minimum Magic Damage
		MagicDamageMax = Energy / 4 -- Maximum Magic Damage
	end

	return MagicDamageMin, MagicDamageMax
end

-- Character Magic Damage - 
function LightWizardMagicDamageCalc(Energy)
	local MagicDamageMin = 0
	local MagicDamageMax = 0
	
	MagicDamageMin = Energy / 5 -- Minimum Magic Damage
	MagicDamageMax = Energy / 3 -- Maximum Magic Damage
	
	return MagicDamageMin, MagicDamageMax
end

-- Character Magic Damage - (Dark Wizard, Soul Master, Grand Master)
function LemuriaMageMagicDamageCalc(Energy)
	local MagicDamageMin = 0
	local MagicDamageMax = 0
	
	MagicDamageMin = Energy / 5 -- Minimum Magic Damage
	MagicDamageMax = Energy / 3 -- Maximum Magic Damage
	
	return MagicDamageMin, MagicDamageMax
end

-- Character Magic Damage - (Grow Lancer, Mirage Lancer)
function IllusionKnightMagicDamageCalc(Energy)
	local MagicDamageMin = 0
	local MagicDamageMax = 0
	
	MagicDamageMin = Energy / 9 -- Minimum Magic Damage
	MagicDamageMax = Energy / 4 -- Maximum Magic Damage
	
	return MagicDamageMin, MagicDamageMax
end

-- Character Magic Damage - (Alchemist, Alchemic Magician, Alchemic Master, Alchemic Force, Creator)
function AlchemistMagicDamageCalc(Energy)
	local MagicDamageMin = 0
	local MagicDamageMax = 0
	
	MagicDamageMin = Energy / 4 -- Minimum Magic Damage
	MagicDamageMax = Energy / 3 -- Maximum Magic Damage
	
	return MagicDamageMin, MagicDamageMax
end

-- Character Attack Speed - for Anti-Hack purpose only, does not take effect in Game for versions lower than w Season 8 Episode 3
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
		AttackSpeed = Dexterity / 15
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
			MagicDamageMin = Energy / 13
			MagicDamageMax = Energy / 13
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

-- Character Attack Success Rate - PvM 
function CalcAttackSuccessRate_PvM(Class, Strength, Dexterity, Vitality, Energy, Command, NormalLevel, MasterLevel)
	local AttackSuccessRate = 0
	local TotalLevel = NormalLevel + MasterLevel
	
	if(Class == CLASS_WIZARD) then
		AttackSuccessRate = TotalLevel * 5 + Dexterity * 1.5 + Strength / 4
	elseif(Class == CLASS_KNIGHT) then
		AttackSuccessRate = TotalLevel * 5 + Dexterity * 1.5 + Strength / 4
	elseif(Class == CLASS_ELF) then
		AttackSuccessRate = TotalLevel * 5 + Dexterity * 1.5 + Strength / 4
	elseif(Class == CLASS_GLADIATOR) then
		AttackSuccessRate = TotalLevel * 5 + Dexterity * 1.5 + Strength / 4
	elseif(Class == CLASS_DARKLORD) then
		AttackSuccessRate = TotalLevel * 5 + (Dexterity * 2) / 3 + Strength / 4 + Command / 15
	elseif(Class == CLASS_SUMMONER) then
		AttackSuccessRate = TotalLevel * 5 + Dexterity * 1.5 + Strength / 4
	elseif(Class == CLASS_RAGEFIGHTER) then
		AttackSuccessRate = TotalLevel * 3 + Dexterity * 1.25 + Strength / 6
	elseif(Class == CLASS_GROWLANCER) then
		AttackSuccessRate = TotalLevel * 5 + Dexterity * 1.25 + Strength / 4
	elseif(Class == CLASS_RUNEWIZARD) then
		AttackSuccessRate = TotalLevel * 5 + Dexterity * 1.5 + Strength / 4
	elseif(Class == CLASS_SLAYER) then
		AttackSuccessRate = TotalLevel * 5 + Dexterity * 1.5 + Strength / 4
	elseif(Class == CLASS_GUNCRUSHER) then
		AttackSuccessRate = TotalLevel * 5 + Dexterity * 1.5 + Strength / 4
	elseif(Class == CLASS_LIGHTWIZARD) then
		AttackSuccessRate = TotalLevel * 5 + Dexterity * 1.5 + Strength / 4
	elseif(Class == CLASS_LEMURIAMAGE) then
		AttackSuccessRate = TotalLevel * 5 + Dexterity * 1.5 + Strength / 2
	elseif(Class == CLASS_ILLUSIONKNIGHT) then
		AttackSuccessRate = TotalLevel * 5 + Dexterity * 1.5 + Strength / 4
	elseif(Class == CLASS_ALCHEMIST) then
		AttackSuccessRate = TotalLevel * 5 + Dexterity * 1.5 + Strength / 4
	end
	
	return AttackSuccessRate
end	

-- Character Defense Success Rate - PvM
function CalcDefenseSuccessRate_PvM(Class, Strength, Dexterity, Vitality, Energy, NormalLevel, MasterLevel)
	local DefenseSuccessRate = 0
	local TotalLevel = NormalLevel + MasterLevel
	
	if(Class == CLASS_WIZARD) then
		DefenseSuccessRate = Dexterity / 3
	elseif(Class == CLASS_KNIGHT) then
		DefenseSuccessRate = Dexterity / 3
	elseif(Class == CLASS_ELF) then
		DefenseSuccessRate = Dexterity / 4
	elseif(Class == CLASS_GLADIATOR) then
		DefenseSuccessRate = Dexterity / 3
	elseif(Class == CLASS_DARKLORD) then
		DefenseSuccessRate = Dexterity / 7
	elseif(Class == CLASS_SUMMONER) then
		DefenseSuccessRate = Dexterity / 4
	elseif(Class == CLASS_RAGEFIGHTER) then
		DefenseSuccessRate = Dexterity / 10
	elseif(Class == CLASS_GROWLANCER) then
		DefenseSuccessRate = Dexterity / 4
	elseif(Class == CLASS_RUNEWIZARD) then
		DefenseSuccessRate = Dexterity / 3
	elseif(Class == CLASS_SLAYER) then
		DefenseSuccessRate = Dexterity / 3
	elseif(Class == CLASS_GUNCRUSHER) then
		DefenseSuccessRate = Dexterity / 4
	elseif(Class == CLASS_LIGHTWIZARD) then
		DefenseSuccessRate = Dexterity / 3
	elseif(Class == CLASS_LEMURIAMAGE) then
		DefenseSuccessRate = Dexterity / 3
	elseif(Class == CLASS_ILLUSIONKNIGHT) then
		DefenseSuccessRate = Dexterity / 3
	elseif(Class == CLASS_ALCHEMIST) then
		DefenseSuccessRate = Dexterity / 3
	end
	
	return DefenseSuccessRate
end

-- Character Defense - General
function CalcDefense(Class, Strength, Dexterity, IsSpecialBuff)
	local Defense = 0
	
	if(Class == CLASS_WIZARD) then
		Defense = Dexterity / 4
	elseif(Class == CLASS_KNIGHT) then
		if (IsSpecialBuff == 1) then -- Strong Belief
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
		if (IsSpecialBuff == 1) then -- Fixed Fire
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
	elseif(Class == CLASS_ALCHEMIST) then
		Defense = Dexterity / 2
	end
	
	return Defense
end

-- Character Attack Success Rate - PvP
function CalcAttackSuccessRate_PvP(Class, Strength, Dexterity, Vitality, Energy, Command, NormalLevel, MasterLevel)
	local AttackRate = 0
	local TotalLevel = NormalLevel + MasterLevel
	
	if(Class == CLASS_WIZARD) then
		AttackRate = Dexterity * 4 + 3 * TotalLevel
	elseif(Class == CLASS_KNIGHT) then
		AttackRate = Dexterity * 4.5 + 3 * TotalLevel
	elseif(Class == CLASS_ELF) then
		AttackRate = Dexterity * 0.6 + 3 * TotalLevel
	elseif(Class == CLASS_GLADIATOR) then
		AttackRate = Dexterity * 3.5 + 3 * TotalLevel
	elseif(Class == CLASS_DARKLORD) then
		AttackRate = Dexterity * 4 + 3 * TotalLevel
	elseif(Class == CLASS_SUMMONER) then
		AttackRate = Dexterity * 3.5 + 3 * TotalLevel
	elseif(Class == CLASS_RAGEFIGHTER) then
		AttackRate = Dexterity * 3.6 + 2.6 * TotalLevel
	elseif(Class == CLASS_GROWLANCER) then
		AttackRate = Dexterity * 2.5 + 3 * TotalLevel
	elseif(Class == CLASS_RUNEWIZARD) then
		AttackRate = Dexterity * 4 + 3 * TotalLevel
	elseif(Class == CLASS_SLAYER) then
		AttackRate = Dexterity * 2.5 + 3 * TotalLevel
	elseif(Class == CLASS_GUNCRUSHER) then
		AttackRate = Dexterity * 3.0 + 3 * TotalLevel
	elseif(Class == CLASS_LIGHTWIZARD) then
		AttackRate = Dexterity * 4 + 3 * TotalLevel
	elseif(Class == CLASS_LEMURIAMAGE) then
		AttackRate = Dexterity * 4 + 3 * TotalLevel
	elseif(Class == CLASS_ILLUSIONKNIGHT) then
		AttackRate = Dexterity * 2.5 + 3 * TotalLevel
	elseif(Class == CLASS_ALCHEMIST) then
		AttackRate = Dexterity * 4 + 3 * TotalLevel
	end
	
	return AttackRate
end

-- Character Defense Success Rate - PvP
function CalcDefenseSuccessRate_PvP(Class, Strength, Dexterity, Vitality, Energy, NormalLevel, MasterLevel)
	local DefenseRate = 0
	local TotalLevel = NormalLevel + MasterLevel
	
	if(Class == CLASS_WIZARD) then
		DefenseRate = Dexterity / 4 + 2 * TotalLevel
	elseif(Class == CLASS_KNIGHT) then
		DefenseRate = Dexterity / 2 + 2 * TotalLevel
	elseif(Class == CLASS_ELF) then
		DefenseRate = Dexterity / 10 + 2 * TotalLevel
	elseif(Class == CLASS_GLADIATOR) then
		DefenseRate = Dexterity / 4 + 2 * TotalLevel
	elseif(Class == CLASS_DARKLORD) then
		DefenseRate = Dexterity / 2 + 2 * TotalLevel
	elseif(Class == CLASS_SUMMONER) then
		DefenseRate = Dexterity / 2 + 2 * TotalLevel
	elseif(Class == CLASS_RAGEFIGHTER) then
		DefenseRate = Dexterity / 5 + 1.5 * TotalLevel
	elseif(Class == CLASS_GROWLANCER) then
		DefenseRate = Dexterity / 5 + 2 * TotalLevel
	elseif(Class == CLASS_RUNEWIZARD) then
		DefenseRate = Dexterity / 3 + 2 * TotalLevel
	elseif(Class == CLASS_SLAYER) then
		DefenseRate = Dexterity / 3 + 2 * TotalLevel
	elseif(Class == CLASS_GUNCRUSHER) then
		DefenseRate = Dexterity / 3 + 2 * TotalLevel
	elseif(Class == CLASS_LIGHTWIZARD) then
		DefenseRate = Dexterity / 4 + 2 * TotalLevel
	elseif(Class == CLASS_LEMURIAMAGE) then
		DefenseRate = Dexterity / 4 + 2 * TotalLevel
	elseif(Class == CLASS_ILLUSIONKNIGHT) then
		DefenseRate = Dexterity / 4 + 2 * TotalLevel
	elseif(Class == CLASS_ALCHEMIST) then
		DefenseRate = Dexterity / 3 + 2 * TotalLevel
	end
	
	return DefenseRate
end

-- Character Elemental Attack - General
function ElementalDamageCalc(Class, Strength, Dexterity, Vitality, Energy, Command, ItemMinDamage, ItemMaxDamage)
	local MinDamage = 0
	local MaxDamage = 0
	
	if(Class == CLASS_WIZARD) then
		MinDamage = ItemMinDamage + (Energy / 8)
		MaxDamage = ItemMaxDamage + (Energy / 5)
	elseif(Class == CLASS_KNIGHT) then
		MinDamage = ItemMinDamage + (Strength / 6)
		MaxDamage = ItemMaxDamage + (Strength / 4)
	elseif(Class == CLASS_ELF) then
		MinDamage = ItemMinDamage + (Dexterity / 10) + (Strength / 14) 
		MaxDamage = ItemMaxDamage + (Dexterity / 7) + (Strength / 8)
	elseif(Class == CLASS_GLADIATOR) then
		MinDamage = ItemMinDamage + (Dexterity / 10) + (Strength / 14)
		MaxDamage = ItemMaxDamage + (Dexterity / 6) + (Strength / 8)
	elseif(Class == CLASS_DARKLORD) then
		MinDamage = ItemMinDamage + (Dexterity / 10) + (Strength / 14)
		MaxDamage = ItemMaxDamage + (Dexterity / 6) + (Strength / 10)
	elseif(Class == CLASS_SUMMONER) then
		MinDamage = ItemMinDamage + (Energy / 10)
		MaxDamage = ItemMaxDamage + (Energy / 6)
	elseif(Class == CLASS_RAGEFIGHTER) then
		MinDamage = ItemMinDamage + (Dexterity / 12) + (Vitality / 14)
		MaxDamage = ItemMaxDamage + (Dexterity / 6) + (Strength / 10)
	elseif(Class == CLASS_GROWLANCER) then
		MinDamage = ItemMinDamage + (Dexterity / 5)
		MaxDamage = ItemMaxDamage + (Dexterity / 3)
	elseif(Class == CLASS_RUNEWIZARD) then
		MinDamage = ItemMinDamage + (Energy / 8)
		MaxDamage = ItemMaxDamage + (Energy / 5)
	elseif(Class == CLASS_SLAYER) then
		MinDamage = ItemMinDamage + (Dexterity / 15) + (Strength / 10)
		MaxDamage = ItemMaxDamage + (Dexterity / 10) + (Strength / 6)
	elseif(Class == CLASS_GUNCRUSHER) then
		MinDamage = ItemMinDamage + (Energy / 5)
		MaxDamage = ItemMaxDamage + (Energy / 4)
	elseif(Class == CLASS_LIGHTWIZARD) then
		MinDamage = ItemMinDamage + (Energy / 5)
		MaxDamage = ItemMaxDamage + (Energy / 3)
	elseif(Class == CLASS_LEMURIAMAGE) then
		MinDamage = ItemMinDamage + (Dexterity / 8)
		MaxDamage = ItemMaxDamage + (Dexterity / 5)
	elseif(Class == CLASS_ILLUSIONKNIGHT) then
		MinDamage = ItemMinDamage + (Dexterity / 10)
		MaxDamage = ItemMaxDamage + (Dexterity / 7)
	elseif(Class == CLASS_ALCHEMIST) then
		MinDamage = ItemMinDamage + (Energy / 6)
		MaxDamage = ItemMaxDamage + (Energy / 4)
	end
	
	return MinDamage, MaxDamage
end

-- Character Elemental Attack Rate MvP
function ElementalAttackRateCalc_MvP(Class, Strength, Dexterity, Vitality, Energy, Command,NormalLevel, MasterLevel)
	local AttackSuccessRate = 0
	local TotalLevel = NormalLevel + MasterLevel
	
	if(Class == CLASS_WIZARD) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_KNIGHT) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_ELF) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_GLADIATOR) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_DARKLORD) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_SUMMONER) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_RAGEFIGHTER) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_GROWLANCER) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_RUNEWIZARD) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_SLAYER) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_GUNCRUSHER) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_LIGHTWIZARD) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_LEMURIAMAGE) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_ILLUSIONKNIGHT) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_ALCHEMIST) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	end
	
	return AttackSuccessRate
end

-- Character Elemental Attack Rate PvP
function ElementalAttackRateCalc_PvP(Class, NormalLevel, MasterLevel, Strength, Dexterity, Vitality, Energy, Command)
	local AttackSuccessRate = 0
	local TotalLevel = NormalLevel + MasterLevel
	
	if(Class == CLASS_WIZARD) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_KNIGHT) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_ELF) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_GLADIATOR) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_DARKLORD) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_SUMMONER) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_RAGEFIGHTER) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_GROWLANCER) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_RUNEWIZARD) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_SLAYER) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_GUNCRUSHER) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_LIGHTWIZARD) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_LEMURIAMAGE) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_ILLUSIONKNIGHT) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	elseif(Class == CLASS_ALCHEMIST) then
		AttackSuccessRate = (3 * Dexterity / 2) + (5 * TotalLevel) + (Strength / 4)
	end
	
	return AttackSuccessRate
end

-- Character Elemental Defense - General
function ElementalDefenseCalc(Class, Strength, Dexterity, Vitality, Energy, IsSpecialBuff)
	local Defense = 0
	
	if(Class == CLASS_WIZARD) then
		Defense = (Energy / 10) + (Dexterity / 6)
	elseif(Class == CLASS_KNIGHT) then
		if (IsSpecialBuff == 1) then -- Strong Belief
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
	elseif(Class == CLASS_ALCHEMIST) then
		Defense = (Energy / 5) + (Dexterity / 8)
	end
	
	return Defense
end

-- Character Elemental Defense Success Rate - General
function ElementalDefenseRateCalc(Class, Strength, Dexterity, Energy, Vitality, Command)
	local DefenseRate = 0
	
	if(Class == CLASS_WIZARD) then
		DefenseRate = Dexterity / 3
	elseif(Class == CLASS_KNIGHT) then
		DefenseRate = Dexterity / 3
	elseif(Class == CLASS_ELF) then
		DefenseRate = Dexterity / 4
	elseif(Class == CLASS_GLADIATOR) then
		DefenseRate = Dexterity / 3
	elseif(Class == CLASS_DARKLORD) then
		DefenseRate = Dexterity / 7
	elseif(Class == CLASS_SUMMONER) then
		DefenseRate = Dexterity / 4
	elseif(Class == CLASS_RAGEFIGHTER) then
		DefenseRate = Dexterity / 10
	elseif(Class == CLASS_GROWLANCER) then
		DefenseRate = Dexterity / 3
	elseif(Class == CLASS_RUNEWIZARD) then
		DefenseRate = Dexterity / 3
	elseif(Class == CLASS_SLAYER) then
		DefenseRate = Dexterity / 3
	elseif(Class == CLASS_GUNCRUSHER) then
		DefenseRate = Dexterity / 3
	elseif(Class == CLASS_LIGHTWIZARD) then
		DefenseRate = Dexterity / 3
	elseif(Class == CLASS_LEMURIAMAGE) then
		DefenseRate = Dexterity / 3
	elseif(Class == CLASS_ILLUSIONKNIGHT) then
		DefenseRate = Dexterity / 3
	elseif(Class == CLASS_ALCHEMIST) then
		DefenseRate = Dexterity / 3
	end
	
	return DefenseRate
end

-- Only for Dark Knight, Magic Gladiator, Slayer
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

-- Only for Dark Knight, Magic Gladiator, Slayer and Dark Lord
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

-- Only for Rage Fighter
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

-- Dark Horse Defense Bonus
function CalcDarkHorseDefenseBonus(Dexterity, PetLevel)
 local AddDefense = Dexterity / 20 + 5 + PetLevel * 2

 return AddDefense
end

-- Penalty Damage calculation from user, Damage Correction of Monster is configured from MonsterList.xml
function CalcPenaltyDamageFromUser(UserLevel, UserMasterLevel, UserDamageCorrection, MonsterLevel, PenaltyMonsterAddLevel, MonsterDamageCorrection, InDamage)
    local SumUserLevel = UserLevel + UserMasterLevel
    local SumMonLevel = MonsterLevel + PenaltyMonsterAddLevel
    local LevelDiff = SumMonLevel - SumUserLevel
    local DamageCorrectionDiff = MonsterDamageCorrection - UserDamageCorrection
    local OutDamage = InDamage

    if LevelDiff <= 0 then
        return OutDamage
    end

    if (LevelDiff > 7) then
        LevelDiff = 7
    end

    if DamageCorrectionDiff < 0 then
        DamageCorrectionDiff = 0
    end

    OutDamage = OutDamage - (OutDamage * ((LevelDiff * 10) + DamageCorrectionDiff) / 100)
    return OutDamage
end

-- Penalty Damage calculation from monster, Damage Correction of Monster is configured from MonsterList.xml
function CalcPenaltyDamageFromMonster(UserLevel, UserMasterLevel, UserDamageCorrection, MonsterLevel, PenaltyMonsterAddLevel, MonsterDamageCorrection, InDamage)
    local SumUserLevel = UserLevel + UserMasterLevel
    local SumMonLevel = MonsterLevel + PenaltyMonsterAddLevel
    local LevelDiff = SumMonLevel - SumUserLevel
    local DamageCorrectionDiff = MonsterDamageCorrection - UserDamageCorrection
    local OutDamage = InDamage

    if LevelDiff <= 0 then
        return OutDamage
    end

    if LevelDiff > 7 then
        LevelDiff = 7
    end

    if DamageCorrectionDiff < 0 then
        DamageCorrectionDiff = 0
    end

    OutDamage = OutDamage + (OutDamage * ((LevelDiff * 10) + DamageCorrectionDiff) / 100)
    return OutDamage
end

-- Only for MG when equip 2 one hand Staffs for MagicPowe (must 2 one hand staff,magic sword don't use this calcu)
function CalcMgTwoStaffsBonus(MagicPowerLeft, MagicPowerRight)
	local OutMagicPowerLeft = 0
	local OutMagicPowerRight = 0
	
	OutMagicPowerLeft = MagicPowerLeft * 65 / 100
	OutMagicPowerRight = MagicPowerRight * 65 / 100
	
	return OutMagicPowerLeft, OutMagicPowerRight
end

-- Only for GC when equip 2 magic gun for MagicPowe
function CalcGCTwoGunsBonus(MagicPowerLeft, MagicPowerRight)
	local OutMagicPowerLeft = 0
	local OutMagicPowerRight = 0
	
	OutMagicPowerLeft = MagicPowerLeft * 75 / 100
	OutMagicPowerRight = MagicPowerRight * 75 / 100
	
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

function FenrirDamageCalc(Class,Strength, Dexterity, Vitality, Energy, Command)
	local FenrirDamage = 0
	
	if(Class == CLASS_WIZARD) then
		FenrirDamage = Strength / 3 + Dexterity / 5 + Vitality / 5 + Energy / 7
	elseif(Class == CLASS_KNIGHT) then
		FenrirDamage = Strength / 5 + Dexterity / 5 + Vitality / 7 + Energy / 3
	elseif(Class == CLASS_ELF) then
		FenrirDamage = Strength / 5 + Dexterity / 3 + Vitality / 7 + Energy / 5
	elseif(Class == CLASS_GLADIATOR) then
		FenrirDamage = Strength / 3 + Dexterity / 5 + Vitality / 5 + Energy / 7
	elseif(Class == CLASS_DARKLORD) then
		FenrirDamage = Strength / 5 + Dexterity / 5 + Vitality / 7 + Energy / 3 + Command / 3
	elseif(Class == CLASS_SUMMONER) then
		FenrirDamage = Strength / 5 + Dexterity / 5 + Vitality / 7 + Energy / 3
	elseif(Class == CLASS_RAGEFIGHTER) then
		FenrirDamage = Strength / 3 + Dexterity / 5 + Vitality / 5 + Energy / 7
	elseif(Class == CLASS_GROWLANCER) then
		FenrirDamage = Strength / 3 + Dexterity / 5 + Vitality / 5 + Energy / 7
	elseif(Class == CLASS_RUNEWIZARD) then
		FenrirDamage = Strength / 3 + Dexterity / 5 + Vitality / 5 + Energy / 7
	elseif(Class == CLASS_SLAYER) then
		FenrirDamage = Strength / 5 + Dexterity / 5 + Vitality / 7 + Energy / 3
	elseif(Class == CLASS_GUNCRUSHER) then
		FenrirDamage = Strength / 3 + Dexterity / 5 + Vitality / 5 + Energy / 7
	elseif(Class == CLASS_LIGHTWIZARD) then
		FenrirDamage = Strength / 3 + Dexterity / 5 + Vitality / 5 + Energy / 7
	elseif(Class == CLASS_LEMURIAMAGE) then
		FenrirDamage = Strength / 3 + Dexterity / 5 + Vitality / 5 + Energy / 7
	elseif(Class == CLASS_ILLUSIONKNIGHT) then
		FenrirDamage = Strength / 5 + Dexterity / 5 + Vitality / 7 + Energy / 3
	elseif(Class == CLASS_ALCHEMIST) then
		FenrirDamage = Strength / 3 + Dexterity / 5 + Vitality / 5 + Energy / 7
	end
	
	return FenrirDamage
end



function ComboDamageCalc(Class,Strength, Dexterity, Vitality, Energy, Command)
	local ComboDamage = 0
	
	if(Class == CLASS_WIZARD) then
		ComboDamage = Strength / 3 + Dexterity / 5 + Vitality / 5 + Energy / 7
	elseif(Class == CLASS_KNIGHT) then
		ComboDamage = Strength / 5 + Dexterity / 5 + Vitality / 7 + Energy / 3
	elseif(Class == CLASS_ELF) then
		ComboDamage = Strength / 5 + Dexterity / 3 + Vitality / 7 + Energy / 5
	elseif(Class == CLASS_GLADIATOR) then
		ComboDamage = Strength / 3 + Dexterity / 5 + Vitality / 5 + Energy / 7
	elseif(Class == CLASS_DARKLORD) then
		ComboDamage = Strength / 5 + Dexterity / 5 + Vitality / 7 + Energy / 3 + Command / 3
	elseif(Class == CLASS_SUMMONER) then
		ComboDamage = Strength / 5 + Dexterity / 5 + Vitality / 7 + Energy / 3
	elseif(Class == CLASS_RAGEFIGHTER) then
		ComboDamage = Strength / 3 + Dexterity / 5 + Vitality / 5 + Energy / 7
	elseif(Class == CLASS_GROWLANCER) then
		ComboDamage = Strength / 3 + Dexterity / 5 + Vitality / 5 + Energy / 7
	elseif(Class == CLASS_RUNEWIZARD) then
		ComboDamage = Strength / 3 + Dexterity / 5 + Vitality / 5 + Energy / 7
	elseif(Class == CLASS_SLAYER) then
		ComboDamage = Strength / 5 + Dexterity / 5 + Vitality / 7 + Energy / 3
	elseif(Class == CLASS_GUNCRUSHER) then
		ComboDamage = Strength / 3 + Dexterity / 5 + Vitality / 5 + Energy / 7
	elseif(Class == CLASS_LIGHTWIZARD) then
		ComboDamage = Strength / 3 + Dexterity / 5 + Vitality / 5 + Energy / 7
	elseif(Class == CLASS_LEMURIAMAGE) then
		ComboDamage = Strength / 3 + Dexterity / 5 + Vitality / 5 + Energy / 7
	elseif(Class == CLASS_ILLUSIONKNIGHT) then
		ComboDamage = Strength / 5 + Dexterity / 5 + Vitality / 7 + Energy / 3
	elseif(Class == CLASS_ALCHEMIST) then
		ComboDamage = Strength / 3 + Dexterity / 5 + Vitality / 5 + Energy / 7
	end
	
	return ComboDamage
end