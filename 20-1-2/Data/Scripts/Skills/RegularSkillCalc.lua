-- Character Classes
CLASS_WIZARD                                          = 0	-- Dark Wizard, Soul Master, Grand Master
CLASS_KNIGHT                                          = 1	-- Dark Knight, Blade Knight, Blade Master
CLASS_ELF                                             = 2	-- Fairy Elf, Muse Elf, High Elf
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
CLASS_ILLUSIONKNIGHT								  = 13	-- Illusion Knight, Mirage Knight, Illusion Master, Mystic Knight
ClASS_ALCHEMIST										  = 14  -- Alchemist, ALCHEMIC MAGICIAN, ALCHEMIC MASTER, ALCHEMIC FORCE,CREATOR

function ShadowPhantomUsedLimit(Class, NormalLevel, MasterLevel, MajesticLevel)
	local TotalLevel = NormalLevel + MasterLevel + MajesticLevel

	if TotalLevel < 350 then

	return 1

	end

return 0

end

function ShadowPhantomBuffCalc(Class, NormalLevel, MasterLevel, MajesticLevel)

	local IncDamage = 0
	local IncDefense = 0
	local TotalLevel = NormalLevel + MasterLevel + MajesticLevel
	local BuffTime = (TotalLevel / 6 + 30) * 60

	if (TotalLevel <= 180) then
		IncDamage = TotalLevel / 3 + 45
		IncDefense = TotalLevel / 5 + 50
	else
		IncDamage = 105
		IncDefense = 86
	end
	
	return IncDamage, IncDefense, BuffTime
end

-- SkillID: 9, Evil Spirit
function EvilSpiritCalc(Class, InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)---add
 local OutDamage = 0
 
 	if (Class == CLASS_WIZARD) then
		OutDamage = InDamage
	elseif (Class == CLASS_GLADIATOR) then
		OutDamage = InDamage
	elseif (Class == CLASS_RUNEWIZARD) then
		OutDamage = InDamage
	end


 return OutDamage
end

-- SkillID: 16, Soul Barrier+
function WizardMagicDefense(Index, TargetIndex, TargetClass, Dexterity, Energy)
	local SkillEffect = Dexterity / 50 + Energy / 200 + 10
	local SkillTime = Energy / 40 + 60
	
	if(Index == TargetIndex and SkillEffect > 50) then -- casting spell on yourself
		SkillEffect = 50
	elseif (Index ~= TargetIndex and SkillEffect > 50)  then -- casting spell on others
		SkillEffect = 50
	end
	
	return SkillEffect, SkillTime
end

-- SkillID: 40, Nova+
function Wizard_NovaSkillCalc(InDamage, Energy)
 local OutDamage = InDamage
 
 return OutDamage
end

-- SkillID: 42, Anger Blow+
function AngerBlow_Calc(Class, InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--add 42
 local OutDamage = 0
 
 	if (Class == CLASS_KNIGHT) then
		OutDamage = InDamage * (Energy / 10 + 200) / 100
	elseif (Class == CLASS_SLAYER) then
		OutDamage = InDamage * (Energy / 10 + 200) / 100
	end


 return OutDamage
end

-- SkillID: 724, Meteor Strike+
function WizardMeteorStrikeCalcDamage(InDamage, Energy, BarrageCount)---3 hits
	local OutDamage = 0
		if (BarrageCount == 1) then
		OutDamage = InDamage
	elseif (BarrageCount == 2) then
		OutDamage = InDamage
	elseif (BarrageCount == 3) then
		OutDamage = InDamage
	end


	return OutDamage
end

-- SkillID: 725, Meteor Storm+
function WizardMeteorStormCalcDamage(InDamage, Energy, BarrageCount)---2 hits
	local OutDamage = 0
	if (BarrageCount == 1) then
		OutDamage = InDamage
	elseif (BarrageCount == 2) then
		OutDamage = InDamage
	end
	
	return OutDamage
end

-- SkillID: 726, Soul Seeker+
function WizardSoulSeekerCalcDamage(InDamage, Energy)--1 hit every soul,send 3 souls use skill once
 local OutDamage = InDamage
 
 return OutDamage
end

-- SkillID: 19, 20, 21, 22, 23, 41, 43, 44, 49, 57, Falling Slash, Lunge, Uppercut,
-- Cyclone, Slash, Twisting Slash, Death Stab, Crescent Moon Slash, Fire Breath,
-- Spiral Slash+
function Knight_Gladiator_CalcSkillBonus(SkillID, Class, InDamage, Strength, Energy, BarrageCount)	--add 43
	local OutDamage = 0
	
	if (Class == CLASS_GLADIATOR or Class == CLASS_DARKLORD) then
		OutDamage = InDamage * 2
	else
		OutDamage = (InDamage * ( 200 + ( Energy / 10 ) ) ) / 100;
	end


	return OutDamage
end

-- SkillID: 48, Swell Life+
function KnightSkillAddLife(Index, TargetIndex, TargetClass, Vitality, Energy, PartyBonus)


	local SkillEffect = Vitality / 100 + 12 + Energy / 20 + PartyBonus
	local SkillTime = Energy / 10 + 60


	return SkillEffect, SkillTime
end

-- SkillID: 232, Strike of Destruction+
function StrikeOfDestructionCalc(InDamage, Energy, BarrageCount)--add
	local OutDamage = InDamage * (Energy /10 + 200) / 100;
	
	return OutDamage
end

-- SkillID: 723, Fireblow - (Blade Knight)+
function KnightFireBlowCalcDamage(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)---3 hits

	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * ( 200 + ( Energy / 10 ) ) ) / 100;
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * ( 200 + ( Energy / 10 ) ) ) / 100;
	elseif (BarrageCount == 3) then
		OutDamage = (InDamage * ( 200 + ( Energy / 10 ) ) ) / 100;
	end


	return OutDamage
end

-- SkillID: X, Combo Skill //gasaketebelia
function ComboSkillDamage(Strength, Dexterity, Vitality, Energy, InDamage, BarrageCount)--2hit need fix
 local Damage = (Strength * 1.5) + Dexterity + Energy
 local OutDamage = InDamage
 return Damage, OutDamage
end

-- SkillID: 731, Ice Blood+
function GladiatorIceBloodCalcDamageAndDot(InDamage, Strength, Energy, BarrageCount)---3 hits
	local OutDamage = 0
	local SuccessRate = 6
	local DebuffTime = 10

	if (BarrageCount == 1) then
		OutDamage = InDamage * 2
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * 2
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * 2
	end

	return OutDamage, SuccessRate, DebuffTime
end

-- SkillID: 732, Fire Blood+
function GladiatorFireBloodCalcDamageAndDot(InDamage, Strength, Energy, BarrageCount)---3 hits
	local OutDamage = 0
	local SuccessRate = 6
	local DebuffDamage = Strength / 10
	local DebuffTime = 10

	if (BarrageCount == 1) then
		OutDamage = InDamage * 2
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * 2
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * 2
	end


	return OutDamage, SuccessRate, DebuffDamage, DebuffTime
end

-- SkillID: 733, Dark Blast+
function GladiatorDarkBlastCalcDamage(InDamage, Strength, Energy)
	local OutDamage = InDamage
	
	return OutDamage
end

-- SkillID: 46, 51, 52, Starfall, Ice Arrow, Penetration+
function Elf_CalcSkillBonus(SkillID, InDamage, Dexterity, Energy)
	local OutDamage = InDamage * 2
	
	return OutDamage
end

-- SkillID: 24, Triple-Shot+
function Elf_CalcTripleShot(InDamage, Strength, Dexterity, Energy, BarrageCount)--add
 local OutDamage = InDamage
 
 return OutDamage
end

-- SkillID: 26, Heal+
function ElfHeal(TargetClass, Index, TargetIndex, Strength, Dexterity, Vitality, Energy)
	local SkillEffect = 0
	
	-- LogAdd(string.format('TargetClass %d Index %d Target %d Ene %d', TargetClass, Index, TargetIndex, Energy))
	
	if (Index ~= TargetIndex) then
		if (TargetClass == CLASS_WIZARD) then
			SkillEffect = Energy / 5 + 5
		elseif (TargetClass == CLASS_KNIGHT) then
			SkillEffect = Energy / 5 + 5
		elseif (TargetClass == CLASS_ELF) then
			SkillEffect = Energy / 5 + 5
		elseif (TargetClass == CLASS_GLADIATOR) then
			SkillEffect = Energy / 5 + 5
		elseif (TargetClass == CLASS_DARKLORD) then
			SkillEffect = Energy / 5 + 5
		elseif (TargetClass == CLASS_SUMMONER) then
			SkillEffect = Energy / 5 + 5
		elseif (TargetClass == CLASS_RAGEFIGHTER) then
			SkillEffect = Energy / 5 + 5
		elseif (TargetClass == CLASS_GROWLANCER) then
			SkillEffect = Energy / 5 + 5
		elseif (TargetClass == CLASS_RUNEWIZARD) then
			SkillEffect = Energy / 5 + 5
		elseif (TargetClass == CLASS_SLAYER) then
			SkillEffect = Energy / 5 + 5
		elseif (TargetClass == CLASS_GUNCRUSHER) then
			SkillEffect = Energy / 5 + 5
		elseif (TargetClass == CLASS_LIGHTWIZARD) then
			SkillEffect = Energy / 5 + 5
		elseif (TargetClass == CLASS_LEMURIAMAGE) then
			SkillEffect = Energy / 5 + 5
		elseif (TargetClass == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = Energy / 5 + 5	
		end
	elseif (Index == TargetIndex) then
		SkillEffect = Energy / 5 + 5
	end
	
	return SkillEffect
end

-- SkillID: 28, Greater Damage+
function ElfAttack(Class, Index, TargetIndex, Strength, Dexterity, Vitality, Energy)
	local SkillEffect = 0
	local SkillTime = 60
	
	if (Index ~= TargetIndex) then
		if (Class == CLASS_WIZARD) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_KNIGHT) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_ELF) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_GLADIATOR) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_DARKLORD) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_SUMMONER) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_RAGEFIGHTER) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_GROWLANCER) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_RUNEWIZARD) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_SLAYER) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_GUNCRUSHER) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_LIGHTWIZARD) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_LEMURIAMAGE) then
			SkillEffect = 3 + Energy / 7
		elseif (Class == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = 3 + Energy / 7
		end
	elseif (Index == TargetIndex) then
		SkillEffect = 3 + Energy / 7
	end
	
	return SkillEffect, SkillTime
end

-- SkillID: 27, Greater Defense+
function ElfDefense(Class, Index, TargetIndex, Strength, Dexterity, Vitality, Energy)
	local SkillEffect = 0
	local SkillTime = 60
	
	if (Index ~= TargetIndex) then
		if (Class == CLASS_WIZARD) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_KNIGHT) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_ELF) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_GLADIATOR) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_DARKLORD) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_SUMMONER) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_RAGEFIGHTER) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_GROWLANCER) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_RUNEWIZARD) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_SLAYER) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_GUNCRUSHER) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_LIGHTWIZARD) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_LEMURIAMAGE) then
			SkillEffect = 2 + Energy / 8
		elseif (Class == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = 2 + Energy / 8
		end
	elseif (Index == TargetIndex) then
		SkillEffect = 2 + Energy / 8
	end
	
	return SkillEffect, SkillTime
end

-- SkillID: 234, Recovery+
function ElfShieldRecovery(Energy, PlayerLevel)
 local SkillEffect = Energy / 4 + PlayerLevel
 
 return SkillEffect
end

-- SkillID: 235, Multi-Shot+
function MultiShotCalc(InDamage, Dexterity, Energy, BarrageCount)--1 hit every Arrow --add
 local OutDamage = InDamage
 
 return OutDamage
end

-- SkillID: 727, Focus Shot+
function ElfFocusShotCalcDamage(InDamage, Strength, Dexterity, Energy, BarrageCount)--2 hits
	local OutDamage = 0
	
	if (BarrageCount == 1) then
        OutDamage = InDamage
    elseif (BarrageCount == 2) then
        OutDamage = InDamage
    end
	
	return OutDamage
end

-- SkillID: 2023, Raining Arrow+
function ElfRainingArrow(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--2 hits
	local OutDamage = 0
	
	if (BarrageCount == 1) then
        OutDamage = InDamage
    elseif (BarrageCount == 2) then
        OutDamage = InDamage
    end
	
	return OutDamage
end

-- SkillID: 2025, Holy Bolt gasascorebelia + 
function ElfHolyBolt(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--2 hit
	local OutDamage = 0
	
	if (BarrageCount == 1) then
        OutDamage = InDamage
    elseif (BarrageCount == 2) then
        OutDamage = InDamage
    end
	
	return OutDamage
end

-- SkillID: 2026, Improve Elemental Attack Power +
function ElfElementalAttack(Class, Index, TargetIndex, Strength, Dexterity, Vitality, Energy, InEffect, InTime)
	SkillEffect = InEffect -- result of formula 36 from FormulaData.xml
	SkillTime = InTime -- result of formula 37 from FormulaData.xml
	
	if (Index ~= TargetIndex) then
		if (Class == CLASS_WIZARD) then
			SkillEffect = InEffect
		elseif (Class == CLASS_KNIGHT) then
			SkillEffect = InEffect
		elseif (Class == CLASS_ELF) then
			SkillEffect = InEffect
		elseif (Class == CLASS_GLADIATOR) then
			SkillEffect = InEffect
		elseif (Class == CLASS_DARKLORD) then
			SkillEffect = InEffect
		elseif (Class == CLASS_SUMMONER) then
			SkillEffect = InEffect
		elseif (Class == CLASS_RAGEFIGHTER) then
			SkillEffect = InEffect
		elseif (Class == CLASS_GROWLANCER) then
			SkillEffect = InEffect
		elseif (Class == CLASS_RUNEWIZARD) then
			SkillEffect = InEffect
		elseif (Class == CLASS_SLAYER) then
			SkillEffect = InEffect
		elseif (Class == CLASS_GUNCRUSHER) then
			SkillEffect = InEffect
		elseif (Class == CLASS_LIGHTWIZARD) then
			SkillEffect = InEffect
		elseif (Class == CLASS_LEMURIAMAGE) then
			SkillEffect = InEffect
		elseif (Class == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = InEffect
		end
	elseif (Index == TargetIndex) then
		SkillEffect = InEffect
	end
	
	return SkillEffect, SkillTime
end

-- SkillID: 2027, Improve Elemental Defense +
function ElfElementalDefense(Class, Index, TargetIndex, Strength, Dexterity, Vitality, Energy, InEffect, InTime)
	SkillEffect = InEffect -- result of formula 38 from FormulaData.xml
	SkillTime = InTime -- result of formula 37 from FormulaData.xml
	
	if (Index ~= TargetIndex) then
		if (Class == CLASS_WIZARD) then
			SkillEffect = InEffect
		elseif (Class == CLASS_KNIGHT) then
			SkillEffect = InEffect
		elseif (Class == CLASS_ELF) then
			SkillEffect = InEffect
		elseif (Class == CLASS_GLADIATOR) then
			SkillEffect = InEffect
		elseif (Class == CLASS_DARKLORD) then
			SkillEffect = InEffect
		elseif (Class == CLASS_SUMMONER) then
			SkillEffect = InEffect
		elseif (Class == CLASS_RAGEFIGHTER) then
			SkillEffect = InEffect
		elseif (Class == CLASS_GROWLANCER) then
			SkillEffect = InEffect
		elseif (Class == CLASS_RUNEWIZARD) then
			SkillEffect = InEffect
		elseif (Class == CLASS_SLAYER) then
			SkillEffect = InEffect
		elseif (Class == CLASS_GUNCRUSHER) then
			SkillEffect = InEffect
		elseif (Class == CLASS_LIGHTWIZARD) then
			SkillEffect = InEffect
		elseif (Class == CLASS_LEMURIAMAGE) then
			SkillEffect = InEffect
		elseif (Class == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = InEffect
		end
	elseif (Index == TargetIndex) then
		SkillEffect = InEffect
	end
	
	return SkillEffect, SkillTime
end

-- SkillID: 47, Impale+---note
function ImpaleSkillCalc(Class, InDamage, Energy)
	local OutDamage = 0
	
	if (Class == CLASS_GLADIATOR or Class == CLASS_DARKLORD) then
		OutDamage = InDamage * 2
	else
		OutDamage = ( InDamage * ( Energy / 10 + 200 )  ) / 100;
	end
		
	return OutDamage
end

-- SkillID: 55, Fire Slash gasascorebelia+
function GladiatorFireSlash(InDamage, Strength, Energy, BarrageCount)--4 hits
    local OutDamage = 0
    
    --if (BarrageCount == 1) then
    --    OutDamage = (InDamage * 0.15) * ( 200 + ( Energy / 10 ) ) / 100;
    --elseif (BarrageCount == 2) then
    --    OutDamage = (InDamage * 0.18) * ( 200 + ( Energy / 10 ) ) / 100;
    --elseif (BarrageCount == 3) then
    --    OutDamage = (InDamage * 0.22) * ( 200 + ( Energy / 10 ) ) / 100;
    --elseif (BarrageCount == 4) then
    --    OutDamage = (InDamage * 0.25) * ( 200 + ( Energy / 10 ) ) / 100;
    --end
    if (BarrageCount == 1) then
        OutDamage = InDamage * 2
    elseif (BarrageCount == 2) then
        OutDamage = InDamage * 2
    elseif (BarrageCount == 3) then
        OutDamage = InDamage * 2
    elseif (BarrageCount == 4) then
        OutDamage = InDamage * 2
    elseif (BarrageCount == 0) then
        OutDamage = InDamage * 2
    elseif (BarrageCount == 5) then
        OutDamage = InDamage * 2
    end

    return OutDamage
end

-- SkillID: 56, Power Slash+
function GladiatorPowerSlash(InDamage, Energy)
	local OutDamage = InDamage * 2
	
	return OutDamage
end

-- SkillID: 236, Flame Strike+
function FlameStrikeCalc(InDamage, Energy)
	local OutDamage = InDamage * 2
	
	return OutDamage
end

-- SkillID: 237, Gigantic Storm+
function GiganticStormCalc(InDamage, Strength, Dexterity, Energy, BarrageCount)--2 hits
 local OutDamage = 0
     if (BarrageCount == 1) then
        OutDamage = InDamage
    elseif (BarrageCount == 2) then
        OutDamage = InDamage
    end

 return OutDamage
end

-- SkillID: 734, Meteor Strike+
function GladiatorMeteorStrikeCalcDamage(InDamage, Energy, BarrageCount)--3 hits
	local OutDamage = 0
    if (BarrageCount == 1) then
        OutDamage = InDamage
    elseif (BarrageCount == 2) then
        OutDamage = InDamage
    elseif (BarrageCount == 3) then
        OutDamage = InDamage
    end

	return OutDamage
end

-- SkillID: 2012, Chaos Blade gasascorebelia+
function GladiatorChaosBlade(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--2 hits
    local OutDamage = 0
    
    if (BarrageCount == 1) then
        OutDamage = InDamage * 2
    elseif (BarrageCount == 2) then
        OutDamage = InDamage * 2
    elseif (BarrageCount == 3) then
        OutDamage = InDamage * 2--4th
    end


    return OutDamage
end

-- SkillID: 2013, Havok Spear +
function GladiatorHavokSpear(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--2 hits
    local OutDamage = 0
    
    if (BarrageCount == 1) then
        OutDamage = InDamage
    elseif (BarrageCount == 2) then
        OutDamage = InDamage
    elseif (BarrageCount == 3) then
        OutDamage = InDamage--4th
    end

	return OutDamage
end

-- SkillID: 60 ,61, 62, 65, 74, 78, Force, Fire Burst, Earthshake, Electric Spike, Fire Blast, Fire Scream +
function Lord_CalcSkillBonus(SkillID, InDamage, Strength, Energy, Command, BarrageCount)---need add Command---add 61
	local OutDamage = ( InDamage *  (Energy / 20 + Command / 20 + 250) ) / 100


	return OutDamage
end

-- SkillID: 64, Increase Critical Damage+
function DarkLordCriticalDamage(Index, TargetIndex, TargetClass, Command, Energy)
	local SkillEffect = 5
	local SkillTime = Energy / 10 + 60
	
	return SkillEffect, SkillTime
end

-- SkillID: 238, Chaotic Diseier+
function ChaoticDiseierCalc(InDamage, Energy, Command, BarrageCount)--1 hit--need add Command
	local OutDamage = InDamage * (Energy / 20 + Command / 20 + 250) / 100



	return OutDamage
end

-- SkillID: 737, Wind Soul - (Lord Emperor)+
function LordWindSoulCalcDamage(InDamage, Strength, Dexterity, Vitality, Energy, Command, BarrageCount)--3 hit
	local OutDamage = InDamage * (Energy / 20 + Command / 20 + 250) / 100
	if (BarrageCount == 1) then
		OutDamage = OutDamage * 0.8
	elseif (BarrageCount == 2) then
		OutDamage = OutDamage * 1.0
	elseif (BarrageCount == 3) then
		OutDamage = OutDamage * 1.1
	end


	return OutDamage
end

-- SkillID: 214, Drain Life - PVP+
function SummonerDrainLife_PvP(Energy, Damage)
	local AddHP = Energy / 23 + (10 * Damage / 100)
	
	return AddHP
end

-- SkillID: 214, Drain Life - MvP+
function SummonerDrainLife_Monster(Energy, MonsterLevel)
	local AddHP = (Energy / 15) + (MonsterLevel / 2.5)
	
	return AddHP
end

-- SkillID: 215, Chain Lighting+
function ChainLightningCalc(InDamage, TargetNumber)----need fix,bonus by some other 
	local DamagePercent = 0
	
	if(TargetNumber == 1) then
		DamagePercent = 100
	elseif(TargetNumber == 2) then
		DamagePercent = 10
	elseif(TargetNumber == 3) then
		DamagePercent = 10
	else
		DamagePercent = 0
	end
		
	local OutDamage = InDamage / 4--InDamage * DamagePercent / 100

	return OutDamage
end

-- SkillID: 217, Damage Reflection+
function SummonerDamageReflect(Index, TargetIndex, TargetClass, Energy)
	local Reflect = 30 + (Energy / 42)
	local Time = 30 + (Energy / 25)
	
	if (Reflect > 25) then
		Reflect = 25
	end
	
	return Reflect, Time
end

-- SkillID: 218, Berserker (Damage conversion is managed trough FormulaData.xml::Character section)+
function SummonerBerserker(Energy,InEffect1,InEffect2,InEffect3,InEffect4)
	local SkillEffectUP1 = InEffect1 -- Attack magic damage,decrease curse
	local SkillEffectUP2 = InEffect2 -- Attack Speed Increase
	local SkillEffectDOWN1 = InEffect3 -- Life Decrease	
	local SkillEffectDOWN2 = InEffect4 -- defense Decrease	


	return SkillEffectUP1, SkillEffectUP2, SkillEffectDOWN1, SkillEffectDOWN2
end

-- SkillID: 288, Death Scythe +
function DeadScythe_Summoner(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--4 hit
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = InDamage * 0.8
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * 1.0
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * 1.1
	elseif (BarrageCount == 4) then
		OutDamage = InDamage * 1.2
	end


	return OutDamage
end

-- SkillID: 289, Darkness (Damage conversion is managed trough FormulaData.xml::Character section)+
function SummonerDarkness(Energy,InEffect1,InEffect2,InEffect3)
	local SkillEffectUP1 = InEffect1 -- curse damage Increase
	local SkillEffectUP2 = InEffect2 -- Defense Increase
	local SkillEffectDOWN = InEffect3 -- Life Decrease


	return SkillEffectUP1, SkillEffectUP2, SkillEffectDOWN
end

-- SkillID: 219, Sleep - MvP+
function Sleep_Monster(Energy, Curse, MonsterLevel)
	local SkillSuccessRate = Energy / 30 + Curse / 6 + 20
	local SkillTime = Energy / 100 + 5 - MonsterLevel / 20
	
	return SkillSuccessRate, SkillTime
end

-- SkillID: 219, Sleep - PvP+
function Sleep_PvP(Energy, Curse, PlayerLevel, TargetLevel)
	local SkillSuccessRate = Energy / 37 + Curse / 6 + 15
	local SkillTime = Energy / 250 + (PlayerLevel - TargetLevel) / 100 + 4
	
	return SkillSuccessRate, SkillTime
end

-- SkillID: 221, Weakness - MvP
function SummonerWeakness_Monster(Energy, Curse, MonsterLevel)
	local SkillSuccessRate = Energy / 50 + Curse / 6 + 32
	local SkillEffect = Energy / 58 + 4
	local SkillTime = Energy / 100 + 4 - MonsterLevel / 20
	
	return SkillSuccessRate, SkillEffect, SkillTime
end

-- SkillID: 221, Weakness - PvP
function SummonerWeakness_PvP(Energy, Curse, PlayerLevel, PlayerMasterLevel, TargetLevel, TargetMasterLevel)
	local PlayerTotalLevel = PlayerLevel + PlayerMasterLevel
	local TargetTotalLevel = TargetLevel + TargetMasterLevel
	local SkillSuccessRate =  Energy / 50 + Curse / 6 + 17
	local SkillEffect = Energy / 93 + 3
	local SkillTime = Energy / 300 + (PlayerTotalLevel - TargetTotalLevel) / 150 + 5
	
	return SkillSuccessRate, SkillEffect, SkillTime
end

-- SkillID: 222, Innovation - MvP
function SummonerInnovation_Monster(Energy, Curse, MonsterLevel)
	local SkillSuccessRate = Energy / 50 + Curse / 6 + 32
	local SkillEffect = Energy / 90 + 20
	local SkillTime = Energy / 100 + 4 - MonsterLevel / 20
	
	return SkillSuccessRate, SkillEffect, SkillTime
end

-- SkillID: 222, Innovation - PvP
function SummonerInnovation_PvP(Energy, Curse, PlayerLevel, PlayerMasterLevel, TargetLevel, TargetMasterLevel)
	local PlayerTotalLevel = PlayerLevel + PlayerMasterLevel
	local TargetTotalLevel = TargetLevel + TargetMasterLevel
	local SkillSuccessRate =  Energy / 50 + Curse / 6 + 17
	local SkillEffect = Energy / 110 + 12
	local SkillTime = Energy / 300 + (PlayerTotalLevel - TargetTotalLevel) / 150 + 5
	
	return SkillSuccessRate, SkillEffect, SkillTime
end

-- SkillID: 223, Explosion - Damage over time+
function ExplosionDotDamage(Damage)
	local DotDamage = Damage * 60 / 100
	local Time = 5
	
	return DotDamage, Time
end

-- SkillID: 224, Requiem - Damage over time+
function RequiemDotDamage(Damage)
	local DotDamage = Damage * 60 / 100
	local Time = 5
	
	return DotDamage, Time
end

-- SkillID: 230, Lightning Shock+
function SummonerLightningShock(InDamage, Energy, BarrageCount)--1 hit--add
	local OutDamage = InDamage


	return OutDamage
end

-- SkillID: 729, Fire Beast - (Dimension Master)+
function SummonerFireBeastCalcDamage(InDamage, Energy, BarrageCount)--3 hits miss BarrageCount need fix
	local OutDamage = 10000
	if (BarrageCount == 1) then
		OutDamage = 1
	elseif (BarrageCount == 2) then
		OutDamage = 1
	elseif (BarrageCount == 3) then
		OutDamage = 1
	elseif (BarrageCount == 4) then
		OutDamage = 1
	end

	return OutDamage
end

-- SkillID: 730, Aqua Beast - (Dimension Master)+
function SummonerAquaBeastCalcDamage(InDamage, Energy, BarrageCount)--3 hits
	local OutDamage = 0
	if (BarrageCount == 1) then
		OutDamage = InDamage
	elseif (BarrageCount == 2) then
		OutDamage = InDamage
	elseif (BarrageCount == 3) then
		OutDamage = InDamage
	end
	return OutDamage
end

-- SkillID: 260, Killing Blow+
function RageFighterKillingBlow(InDamage, Vitality, BarrageCount)--4 hits
	local OutDamage = 0
	if (BarrageCount == 1) then
		OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	elseif (BarrageCount == 4) then
		OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	end

	return OutDamage
end

-- SkillID: 261, Beast Uppercut+
function RageFighterBeastUppercut(InDamage, Vitality, BarrageCount)--4 hits
	local OutDamage = 0
	if (BarrageCount == 1) then
		OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	elseif (BarrageCount == 4) then
		OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	end

	return OutDamage
end

-- SkillID: 262, Chain Drive+
function RageFighterChainDrive(InDamage, Vitality, BarrageCount)--8 hits

	local OutDamage = 0
 	if (BarrageCount == 1) then
		OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	elseif (BarrageCount == 4) then
		OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	elseif (BarrageCount == 5) then
		OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	elseif (BarrageCount == 6) then
		OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	elseif (BarrageCount == 7) then
		OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	elseif (BarrageCount == 8) then
		OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	end

	return OutDamage
end

-- SkillID: 263, Dark Side+
function RageFighterDarkSideIncDamage(InDamage, Dexterity, Energy, BarrageCount)--2 hits
	local OutDamage = 0
 	if (BarrageCount == 1) then
		OutDamage = InDamage * (Dexterity / 8 + Energy / 10 + 101) / 100.0
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * (Dexterity / 8 + Energy / 10 + 101) / 100.0
	end


 return OutDamage
end


-- SkillID: 264, Dragon Roar+
function RageFighterDragonRoar(InDamage, Energy, BarrageCount)--- 4 hits
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = InDamage * (Energy / 10 + 50) / 100.0
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * (Energy / 10 + 50) / 100.0
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * (Energy / 10 + 50) / 100.0
	elseif (BarrageCount == 4) then
		OutDamage = InDamage * (Energy / 10 + 50) / 100.0
	end

	return OutDamage
end

-- SkillID: 265, Dragon Slasher+
function RageFighterDragonSlasher(InDamage, Energy, TargetType) --1 hit ?
	local OutDamage = 0
	
	if (TargetType == 1) then -- Player
		OutDamage = InDamage * (Energy / 10 + 50) / 100.0
	else -- Monster
		OutDamage = (InDamage * (Energy / 10 + 50) / 100.0 + 100.0) * 3.0
	end
	
	return OutDamage
end

-- SkillID: 265, 564 - Dragon Slasher - SD Reduction+
function DragonSlasher_DecreaseVictimSD(SkillID, Strength, Energy)
	local SuccessRate = 0	
	
	SuccessRate = Energy / 100 + 10	
	
	if (SuccessRate > 100) then
		SuccessRate = 100
	end
	
	return SuccessRate
end
-- SkillID: 266, Ignore Defense+
function FighterIgnoreEnemyDefCalcEffect(Energy)
	local SkillEffect = (Energy - 404) / 100 + 3.0
	local SkillTime = Energy / 5 + 60
	
	if (SkillEffect > 10) then
		SkillEffect = 10
	end
	
	return SkillEffect, SkillTime
end

-- SkillID: 267, Increase Health+
function FighterIncLifeCalcEffect(Index, TargetIndex, TargetClass, Energy)
	local SkillEffect = (Energy - 132) / 10.0 + 30.0;
	local SkillTime = Energy / 5 + 60
	
	return SkillEffect, SkillTime
end

-- SkillID: 268, Increase Block+
function FighterIncDefRateCalcEffect(Index, TargetIndex, TargetClass, Energy)
	local SkillEffect = (Energy - 80) / 10.0 + 10.0;
	local SkillTime = Energy / 5 + 60
	
	if (SkillEffect > 100) then
		SkillEffect = 100
	end
	
	return SkillEffect, SkillTime
end

-- SkillID: 269, Charge+
function RageFighterCharge(InDamage, Vitality)---1 hit ?
	local OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	
	return OutDamage
end

-- SkillID: 270, Phoenix Shot+
function RageFighterPhoenixShot(InDamage, Dexterity, Vitality)--1 hit ?
	local OutDamage = InDamage * (Vitality / 10 + 101) / 100.0
 
	return OutDamage
end

-- SkillID: 282, Spirit Hook+
function RageFighterSpiritHook(InDamage, Vitality, BarrageCount)---4 hits
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	elseif (BarrageCount == 4) then
		OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	end
	return OutDamage
end											


-- SkillID: 18, Defense - (Shields Skill)+
function ShieldSkill_DecreaseVictimDamage(InDamage)
 local OutDamage = InDamage / 2
 
 return OutDamage
end

-- SkillID: 76, Plasma Storm - (Fenrir Pets)+
function FenrirSkillCalc(InDamage, PlayerLevel, PlayerMasterLevel)
	local DamageInc = PlayerLevel - 300 + PlayerMasterLevel
	
	if (DamageInc < 0) then
		DamageInc = 0
	end
	
	DamageInc = DamageInc / 5
	
	local OutDamage = ( InDamage * ( DamageInc + 200 ) ) / 100;
	
	return OutDamage
end

-- SkillID: 271, Spin Step+
function GrowLancerSpinStep(InDamage, Dexterity, SkillTreeBonus)--SkillTreeBonus 712
	local OutDamage = (InDamage * 1.1) * (Dexterity / 10 + 97 + SkillTreeBonus) / 100.0----give center 1 target 1 hit
	local ExplosionDamage = (InDamage * 0.7) * (Dexterity / 10 + 97 + SkillTreeBonus) / 100.0----give other target hit

	return OutDamage, ExplosionDamage
end


-- SkillID: 274, Magic Pin+
function GrowLancerMagicPin(InDamage, Dexterity, SkillTreeBonus, BarrageCount)--3 hits--SkillTreeBonus 712
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = (InDamage * 0.8) * (Dexterity / 10 + 97 + SkillTreeBonus) / 100.0
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * (Dexterity / 10 + 97 + SkillTreeBonus) / 100.0
	elseif (BarrageCount == 3) then
		OutDamage = (InDamage * 1.1) * (Dexterity / 10 + 97 + SkillTreeBonus) / 100.0
	end

	return OutDamage
end

-- SkillID: 276, Harsh Strike+
function GrowLancerHarshStrike(InDamage, Strength, SkillTreeBonus, BarrageCount)--2 hits--SkillTreeBonus 711
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = (InDamage * 1.0) * (Strength / 10 + 97 + SkillTreeBonus) / 100.0
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.1) * (Strength / 10 + 97 + SkillTreeBonus) / 100.0
	end

	return OutDamage
end


-- SkillID: 277, Shining Peak+
function GrowLancerShiningPeak(InDamage, Strength, Dexterity, SkillTreeBonus_Retailation, SkillTreeBonus_Rage, BarrageCount)--3 hits--SkillTreeBonus 711 and 712
	local OutDamage = InDamage * (((Strength / 10 + 97 + SkillTreeBonus_Retailation) + (Dexterity / 10 + 97 + SkillTreeBonus_Rage)) * 0.8) / 100.0

	if (BarrageCount == 1) then
		OutDamage = OutDamage / 3
	elseif (BarrageCount == 2) then
		OutDamage = OutDamage / 3
	elseif (BarrageCount == 3) then
		OutDamage = OutDamage / 3
	end

	return OutDamage
end

-- SkillID: 279, Breche+
function GrowLancerBreche(InDamage, Strength, SkillTreeBonus, BarrageCount)--2 hits--SkillTreeBonus 711
	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage * (Strength / 10 + 97 + SkillTreeBonus) / 100.0
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * (Strength / 10 + 97 + SkillTreeBonus) / 100.0
	end

	return OutDamage
end

-- SkillID: 278, Wrath+
function GrowLancerWrath(Strength, Dexterity, Energy)
	local SkillIncDamage = (Strength + Dexterity) / 3
	local SkillDecDefense = 5
	local CombatPower = 10
	local SkillTime = 300


	return SkillIncDamage, SkillDecDefense, SkillTime,CombatPower
end

-- SkillID: 273, Obsidian+
function GrowLancerObsidian(Index, TargetIndex, TargetClass, Strength, Dexterity, Energy)
	local SkillEffect = Strength / 20
	local SkillTime = 120

	return SkillEffect, SkillTime
end

-- SkillID: X, Hemorrhage - (BuffEffectManager.xml -> Index: 239)
function BleedingBuffCalcSuccessAndTime(CharacterLevel)
	local SuccessRate = 10
	local Duration = CharacterLevel / 4 + 20

	if (SuccessRate > 100) then
		SuccessRate = 100
	end

	return SuccessRate, Duration
end

-- SkillID: X, Paralysis - (BuffEffectManager.xml -> Index: 240)
function ParalyzingBuffCalcSuccess(CharacterLevel)
	local SuccessRate = 10

	if (SuccessRate > 100) then
		SuccessRate = 100
	end	

	return SuccessRate
end

-- SkillID: X, Bondage - (BuffEffectManager.xml -> Index: 241)
function BindingBuffCalcSuccess(CharacterLevel)
	local SuccessRate = 10

	if (SuccessRate > 100) then
		SuccessRate = 100
	end	

	return SuccessRate
end

-- SkillID: X, Blindness - (BuffEffectManager.xml -> Index: 242)
function BlindingBuffCalcSuccessAndTime(CharacterLevel)
	local SuccessRate = 10
	local Duration = CharacterLevel / 4 + 20

	if (SuccessRate > 100) then
		SuccessRate = 100
	end
	
	return SuccessRate, Duration
end

-- SkillID: 739, Dark Phoenix Shot+
function FighterDarkPhoenixShotCalcDamage(InDamage, Dexterity, Vitality, BarrageCount)--3 hits

 	local OutDamage = 0
	if (BarrageCount == 1) then
		OutDamage = InDamage * (Dexterity / 10 + 50) / 100.0
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * (Dexterity / 10 + 50) / 100.0
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * (Dexterity / 10 + 50) / 100.0
	end

	return OutDamage
end


-- SkillID: 283, Magic Arrow+
function RuneWizardMagicArrowCalcDamage(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--2 hits
	local OutDamage = 0
	if (BarrageCount == 1) then
		OutDamage = InDamage
	elseif (BarrageCount == 2) then
		OutDamage = InDamage
	end
------Magic Arrow has 2 hit,but will explode when Hit monster,eplode damage will send 2 other close target extra 2 hit
	return OutDamage
end

-- SkillID: 284, Plasma Ball
function RuneWizardPlasmaBallCalcDamage(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--1 hit--add
	local OutDamage = InDamage
	
	return OutDamage
end

-- SkillID: 285, Lightning Storm+
function RuneWizardLightningStormCalcDamage(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)---4 hits
	local OutDamage = 0
	if (BarrageCount == 1) then
		OutDamage = InDamage
	elseif (BarrageCount == 2) then
		OutDamage = InDamage
	elseif (BarrageCount == 3) then
		OutDamage = InDamage
	elseif (BarrageCount == 4) then
		OutDamage = InDamage
	end

	return OutDamage
	
end

-- SkillID: 286, Burst+
function RuneWizardBurstCalc(Energy)
	local SkillEffect1 = Energy / 30
	local SkillEffect2 = Energy / 100
	local SkillTime = Energy / 20 + 30
	
	return SkillEffect1, SkillEffect2, SkillTime
end

-- SkillID: 287, Haste+
function RuneWizardHasteCalc(Index, TargetIndex, TargetClass, Energy)
	local SkillEffect1 = Energy / 100
	local SkillEffect2 = Energy / 30
	local SkillTime = Energy / 20 + 30
	
	return SkillEffect1, SkillEffect2, SkillTime
end

-- SkillID: 233: Expansion of Wizardry
function ExpansionWizardryCalc(Class, Energy)
	local SkillEffect = 0
	local SkillTime = 1800
	
	if (Class == CLASS_WIZARD) then
		SkillEffect = Energy / 9 * 0.20
	elseif (Class == CLASS_RUNEWIZARD) then
		SkillEffect = Energy / 9 * 0.20
	elseif (Class == CLASS_LEMURIAMAGE) then
		SkillEffect = Energy / 9 * 0.20
	end

	return SkillEffect, SkillTime
end


-- SkillID: 292, Sword Inertia+
function SlayerSwordInertiaCalc(InDamage, Strength, Dexterity, BarrageCount)---add
	local OutDamage = 0
	OutDamage = InDamage * ((Strength / 8) + (Dexterity / 28) + 120) / 100
	
	return OutDamage
end

-- SkillID: 293, Bat Flock - (Damage)+
function SlayerBatFlockCalc(InDamage, Strength, Dexterity, BarrageCount) --2 hits
	local OutDamage = 0
	if (BarrageCount == 1) then
		OutDamage = InDamage * ((Strength / 8) + (Dexterity / 28) + 120) / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * ((Strength / 8) + (Dexterity / 28) + 120) / 100
	end
	return OutDamage
end

-- SkillID: 293, Bat Flock - (Damage over time)+
function BatFlock_DotDamage(InDamage, Strength, Energy)
	local Damage = InDamage
	local DotDamage = InDamage / 10
	local Time = 4
	
	return Damage, DotDamage, Time
end
------------------------------------------------------------------------------------------------------------------------------------------------
-- SkillID: 294, Pierce Attack+
function SlayerPierceAttackCalc(InDamage, Strength, Dexterity, BarrageCount)--2hit
	local OutDamage = 0
	if (BarrageCount == 1) then
		OutDamage = InDamage * ((Strength / 8) + (Dexterity / 28) + 120) / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * ((Strength / 8) + (Dexterity / 28) + 120) / 100
	end
	OutDamage = InDamage * ((Strength / 8) + (Dexterity / 28) + 120) / 100

	return OutDamage
end


-- SkillID: 297, Demolish+
function SlayerDemolishCalc(Strength, Dexterity, Vitality, Energy)
	local SkillEffect1 = ((Strength / 8) + (Dexterity / 28) + 120) * 0.03---BUFF_OPTION_IGNORE_BASE_DEFENSE
	local SkillEffect2 = ((Strength / 8) + (Dexterity / 28) + 120) * 0.03---BUFF_OPTION_DEMOLISH_DAMAGE_DECREASE
	local SkillTime = 60
	
	return SkillEffect1, SkillEffect2, SkillTime
end

-- SkillID: 1501, Sword Blow+
function SwordBlow_Knight(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--3 hits
	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 1.0) * (Energy / 10 + 200) / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * (Energy / 10 + 200) / 100
	elseif (BarrageCount == 3) then
		OutDamage = (InDamage * 1.0) * (Energy / 10 + 200) / 100
	elseif (BarrageCount == 4) then----4th
		OutDamage = (InDamage * 1.0) * (Energy / 10 + 200) / 100
	end

	return OutDamage
end

-- SkillID: 1502, Strong Belief+
function KnightStrongBelief(NormalLevel, MasterLevel, Strength, Dexterity, Vitality, Energy)
	local Duration = (NormalLevel + MasterLevel) / 4 + 20
	return Duration
end

-- SkillID: 1503, Solid Protection
function KnightSolidProtection (NormalLevel, MasterLevel, MajesticLevel, Strength, Dexterity, Vitality, Energy)
	local AbsorbHP = 5
	local ConvertDamage = Energy / 250
	local IncAtkPower = (NormalLevel + MasterLevel + MajesticLevel) / 3
	local Duration = 600

	return AbsorbHP, IncAtkPower, ConvertDamage, Duration
end

-- SkillID: 2001, Dark Plasma
function GunCrusherDarkPlasmaCalc(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--1hit--add--need move
	local OutDamage = 0
	OutDamage = InDamage


	return OutDamage
end

-- SkillID: 2002, Ice Break+
function GunCrusherIceBreakCalc(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--3 hits--need move
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = InDamage
	elseif (BarrageCount == 2) then
		OutDamage = InDamage
	elseif (BarrageCount == 3) then
		OutDamage = InDamage
	end


	return OutDamage
end

-- SkillID: 2004, Death Fire+
function GunCrusherDeathFireCalc(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--1hit--need fix and add BarrageCount
	local OutDamage = 0
	
		OutDamage = InDamage

	return OutDamage
end

-- SkillID: 2003, Ice Blast+
function GunCrusherIceBlastCalc(InDamage, Strength, Dexterity, Vitality, Energy)--2 hits
	local OutDamage = 0
	if (BarrageCount == 1) then
		OutDamage = InDamage
	elseif (BarrageCount == 2) then
		OutDamage = InDamage
	end

	return OutDamage
end

-- SkillID: 2005, Bursting Flare
function GunCrusherBurstingFlareCalc(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--2 hits
	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage
	elseif (BarrageCount == 2) then -- Shockwave
		OutDamage = InDamage
	end
	
	return OutDamage
end

-- SkillID: 2006, Death Ice+
function GunCrusherDeathIceCalc(InDamage, Strength, Dexterity, Vitality, Energy)--1hit--need move skill bonus
	local OutDamage = 0
	
		OutDamage = InDamage

	return OutDamage
end

-- SkillID: 240, Magic Shot+
function LightWizardMagicShot(Class, InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--2 hits
	local OutDamage = 0
	if Class == CLASS_LIGHTWIZARD then
		if (BarrageCount == 1) then
			OutDamage = (InDamage * 1.0) * (200 + (Energy / 50)) / 100
		elseif (BarrageCount == 2) then
			OutDamage = (InDamage * 1.0) * (200 + (Energy / 50)) / 100
		end
	elseif Class == CLASS_LEMURIAMAGE then
		if (BarrageCount == 1) then
			OutDamage = (InDamage * 1.0) * (140 + (Energy / 100)) / 100
		elseif (BarrageCount == 2) then
			OutDamage = (InDamage * 1.0) * (140 + (Energy / 100)) / 100
		end
	elseif Class == ClASS_ALCHEMIST then
		if (BarrageCount == 1) then
			OutDamage = (InDamage * 1.0) * (165 + (Energy / 65)) / 100
		elseif (BarrageCount == 2) then
			OutDamage = (InDamage * 1.0) * (165 + (Energy / 65)) / 100
		end
	end


	return OutDamage
end

-- SkillID: 241, Shining Bird+
function LightWizardShiningBirdCalc(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--1hit--add
	local OutDamage = 0
	
	OutDamage = (InDamage * 1.0) * ((Energy / 50) + 200) / 100


	return OutDamage
end

-- SkillID: 242, Dragon Violent+
function LightWizardDragonViolentCalc(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--2 hits
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = (InDamage * 1.0) * ((Energy / 50) + 200) / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * ((Energy / 50) + 200) / 100
	end


return OutDamage
end

-- SkillID: 243, Spear Storm+
function LightWizardSpearStormCalc(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)---2hit
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = (InDamage * 1.0) * ((Energy / 50) + 200) / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * ((Energy / 50) + 200) / 100
	end

	return OutDamage
end

-- SkillID: 244, Reflection Barrier+
function LightWizardReflectionBarrierCalc(Level, MasterLevel, Strength, Dexterity, Vitality, Energy)
	local ReflectProbability = 50
	local ReflectShockDmgPercentage = 15
	local Duration = 60
	return ReflectProbability, ReflectShockDmgPercentage, Duration
end

-- SkillID: 245, Marvel Burst+
function LemuriaMageMarvelBurst(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--1hit--add
	local OutDamage = 0
	
	OutDamage = InDamage * (140 + (Energy / 100)) / 100

	return OutDamage
end

-- SkillID: 246, Unleash Marvel+
function LemuriaMageUnleashMarvel(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)---2 hits
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = (InDamage * 1.0) * (140 + (Energy / 100)) / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * (140 + (Energy / 100)) / 100
	end
	
	return OutDamage
end

-- SkillID: 247, Ultimate Force+
function LemuriaMageUltimateForce(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)---2hit
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = (InDamage * 1.0) * (140 + (Energy / 100)) / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * (140 + (Energy / 100)) / 100
	elseif (BarrageCount == 3) then--4th
		OutDamage = (InDamage * 1.0) * (140 + (Energy / 100)) / 100
	end


	return OutDamage
end

-- SkillID: 2007, Beginner Care+
function LemuriaMageHeal(TargetClass, Index, TargetIndex, Energy)
	local SkillEffect = 0
	
	if (Index ~= TargetIndex) then
		if (TargetClass == CLASS_WIZARD) then
			SkillEffect = Energy / 10 + 5
		elseif (TargetClass == CLASS_KNIGHT) then
			SkillEffect = Energy / 10 + 5
		elseif (TargetClass == CLASS_ELF) then
			SkillEffect = Energy / 10 + 5
		elseif (TargetClass == CLASS_GLADIATOR) then
			SkillEffect = Energy / 10 + 5
		elseif (TargetClass == CLASS_DARKLORD) then
			SkillEffect = Energy / 10 + 5
		elseif (TargetClass == CLASS_SUMMONER) then
			SkillEffect = Energy / 10 + 5
		elseif (TargetClass == CLASS_RAGEFIGHTER) then
			SkillEffect = Energy / 10 + 5
		elseif (TargetClass == CLASS_GROWLANCER) then
			SkillEffect = Energy / 10 + 5
		elseif (TargetClass == CLASS_RUNEWIZARD) then
			SkillEffect = Energy / 10 + 5
		elseif (TargetClass == CLASS_SLAYER) then
			SkillEffect = Energy / 10 + 5
		elseif (TargetClass == CLASS_GUNCRUSHER) then
			SkillEffect = Energy / 10 + 5
		elseif (TargetClass == CLASS_LIGHTWIZARD) then
			SkillEffect = Energy / 10 + 5
		elseif (TargetClass == CLASS_LEMURIAMAGE) then
			SkillEffect = Energy / 10 + 5
		elseif (TargetClass == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = Energy / 10 + 5
		end
	elseif (Index == TargetIndex) then
		SkillEffect = Energy / 10 + 5
	end

	return SkillEffect
end

-- SkillID: 2008, Beginner Shield Recovery+
function LemuriaMageShieldRecovery(Energy, PlayerLevel)
	local SkillEffect = Energy / 8 + PlayerLevel


	return SkillEffect
end

-- SkillID: 2009, Beginner Basic Defense Improvement+
function LemuriaMageDefense(Class, Index, TargetIndex, Energy)
	local SkillEffect = 0
	local SkillTime = 60
	
	if (Index ~= TargetIndex) then
		if (Class == CLASS_WIZARD) then
			SkillEffect = 2 + Energy / 16
		elseif (Class == CLASS_KNIGHT) then
			SkillEffect = 2 + Energy / 16
		elseif (Class == CLASS_ELF) then
			SkillEffect = 2 + Energy / 16
		elseif (Class == CLASS_GLADIATOR) then
			SkillEffect = 2 + Energy / 16
		elseif (Class == CLASS_DARKLORD) then
			SkillEffect = 2 + Energy / 16
		elseif (Class == CLASS_SUMMONER) then
			SkillEffect = 2 + Energy / 16
		elseif (Class == CLASS_RAGEFIGHTER) then
			SkillEffect = 2 + Energy / 16
		elseif (Class == CLASS_GROWLANCER) then
			SkillEffect = 2 + Energy / 16
		elseif (Class == CLASS_RUNEWIZARD) then
			SkillEffect = 2 + Energy / 16
		elseif (Class == CLASS_SLAYER) then
			SkillEffect = 2 + Energy / 16
		elseif (Class == CLASS_GUNCRUSHER) then
			SkillEffect = 2 + Energy / 16
		elseif (Class == CLASS_LIGHTWIZARD) then
			SkillEffect = 2 + Energy / 16
		elseif (Class == CLASS_LEMURIAMAGE) then
			SkillEffect = 2 + Energy / 16
		elseif (Class == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = 2 + Energy / 16
		end
	elseif (Index == TargetIndex) then
		SkillEffect = 2 + Energy / 16
	end
	
	return SkillEffect, SkillTime
end

-- SkillID: 2010, Beginner Attack Power Improvement+
function LemuriaMageAttack(Class, Index, TargetIndex, Energy)
	local SkillEffect = 0
	local SkillTime = 60
	
	if (Index ~= TargetIndex) then
		if (Class == CLASS_WIZARD) then
			SkillEffect = 3 + Energy / 15
		elseif (Class == CLASS_KNIGHT) then
			SkillEffect = 3 + Energy / 15
		elseif (Class == CLASS_ELF) then
			SkillEffect = 3 + Energy / 15
		elseif (Class == CLASS_GLADIATOR) then
			SkillEffect = 3 + Energy / 15
		elseif (Class == CLASS_DARKLORD) then
			SkillEffect = 3 + Energy / 15
		elseif (Class == CLASS_SUMMONER) then
			SkillEffect = 3 + Energy / 15
		elseif (Class == CLASS_RAGEFIGHTER) then
			SkillEffect = 3 + Energy / 15
		elseif (Class == CLASS_GROWLANCER) then
			SkillEffect = 3 + Energy / 15
		elseif (Class == CLASS_RUNEWIZARD) then
			SkillEffect = 3 + Energy / 15
		elseif (Class == CLASS_SLAYER) then
			SkillEffect = 3 + Energy / 15
		elseif (Class == CLASS_GUNCRUSHER) then
			SkillEffect = 3 + Energy / 15
		elseif (Class == CLASS_LIGHTWIZARD) then
			SkillEffect = 3 + Energy / 15
		elseif (Class == CLASS_LEMURIAMAGE) then
			SkillEffect = 3 + Energy / 15
		elseif (Class == CLASS_ILLUSIONKNIGHT) then
			SkillEffect = 3 + Energy / 15
		end
	elseif (Index == TargetIndex) then
		SkillEffect = 3 + Energy / 15
	end
	
	return SkillEffect, SkillTime
end

-- SkillID: 2011, Beginner Bless+
function LemuriaMageBless(Energy)
	local SkillEffect = Energy / 150
	local SkillTime = 300
	
	return SkillEffect, SkillTime
end

-- SkillID: 2022, Bond
function BondAttack_TickDmg_Monster(Level, MasterLevel, Strength, Dexterity, Vitality, Energy, MagicDamageMin, MagicDamageMax)
	local SkillEffect = MagicDamageMax / 4
	local Duration = 3
	
	return SkillEffect, Duration
end

-- SkillID: 2022, Bond - Bonus for Light Wizard and Lemuria Mage
function BondAttack_Active(InDamage, Class, Level, MasterLevel, Strength, Dexterity, Vitality, Energy)
	local OutDamage = InDamage * 130 / 100
	
	return OutDamage
end

-- SkillID: 2022, Bond - Bonus for other class party members
function BondAttack_PartyMember(InDamage, Class, Level, MasterLevel, Strength, Dexterity, Vitality, Energy)
	local OutDamage = InDamage * 115 / 100
	
	return OutDamage
end

-- SkillID: 2028, Charge Slash+
function IllusionKnightChargeSlash(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)-----2 hits
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = (InDamage * (200 + (Dexterity / 30))) / 100;
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * (200 + (Dexterity / 30))) / 100;
	end


	return OutDamage
end

-- SkillID: 2029, Wind Glaive+
function IllusionKnightWindGlaive(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)-----2 hits
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = (InDamage * (200 + (Dexterity / 30))) / 100;
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * (200 + (Dexterity / 30))) / 100;
	end

	return OutDamage
end

-- SkillID: 2030, Blade Storm+
function IllusionKnightBladeStorm(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)-----2 hits
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = (InDamage * (200 + (Dexterity / 30))) / 100;
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * (200 + (Dexterity / 30))) / 100;
	end

	return OutDamage
end

-- SkillID: 2031, Illusion Avatar, formula controls base Life and Damage before mastery improvments
function IllusionKnightAvatarCalc(InDamageMin, InDamageMax, PlayerLevel, PlayerMasterLevel, PlayeMajesticLevel, PlayerMaxLife)
	local PlayerTotalLevel = PlayerLevel + PlayerMasterLevel + PlayeMajesticLevel
	local OutDamageMin = InDamageMin * 1.5
	local OutDamageMax = InDamageMax * 2
	local OutLife = (PlayerTotalLevel / 20) * PlayerMaxLife
	
	return OutDamageMin, OutDamageMax, OutLife
end

-- SkillID: 2036, OVersting+
function GrowLancerOVersting(InDamage, Dexterity, Energy, BarrageCount, SkillTreeBonus)-----3 hits--need fix-- miss SkillTreeBonus 712
	local OutDamage = InDamage * (97 + Dexterity / 10 + SkillTreeBonus) / 100;
	if (BarrageCount == 1) then
		OutDamage = OutDamage * 1;
	elseif (BarrageCount == 2) then
		OutDamage = OutDamage * 1;
	elseif (BarrageCount == 3) then
		OutDamage = OutDamage * 1;
	elseif (BarrageCount == 4) then----4th tree hit
		OutDamage = OutDamage * 1;
	elseif (BarrageCount == 5) then----4th tree hit
		OutDamage = OutDamage * 1;
	end


	return OutDamage
end

-- SkillID: 2085, Wild Breat 
function GrowLancerWildBreath(InDamage, Strength, Dexterity, Vitality, Energy, SkillTreeBonus, BarrageCount)-----3 hits-need fix--miss SkillTreeBonus 711
	local OutDamage = InDamage * (97 + Strength / 10 + SkillTreeBonus) / 100;
	
	if (BarrageCount == 1) then
		OutDamage = OutDamage * 1;
	elseif (BarrageCount == 2) then
		OutDamage = OutDamage * 1;
	elseif (BarrageCount == 3) then
		OutDamage = OutDamage * 1;
	elseif (BarrageCount == 4) then----4th tree hit
		OutDamage = OutDamage * 1;
	end



	return OutDamage
end

-- SkillID: 2017, Chaos Blade Magic Explosion
function GladiatorChaosBladeMagicExplosion(InDamage, Strength, Dexterity, Vitality, Energy)
	local OutDamage = 10000


    return OutDamage
end

-- SkillID: 2018, Fire Blood Magic Explosion
function GladiatorFireBloodMagicExplosion(InDamage, Strength, Energy)
	local OutDamage = InDamage * 2 + 10000

	return OutDamage
end

-- SkillID: 2019, Ice Blood Magic Explosion
function GladiatorIceBloodMagicExplosion(InDamage, Strength, Energy)
	local OutDamage = InDamage * 2 + 10000

	return OutDamage
end

-- SkillID: 2020, Havok Spear Nova
function GladiatorHavokSpearNova(InDamage, Strength, Dexterity, Vitality, Energy)
    local OutDamage = InDamage * 4 --+ 10000

        return OutDamage
end

-- SkillID: 2090, Confusion Stone
function AlchemistConfusionStone(Index, TargetIndex, Energy)

	local SummonCoolDown = 30 -- ConfusionStone summon a monster every 30s
	local SkillTime = 300 -- ConfusionStone duration time and Buff 443 duration time

    return SummonCoolDown, SkillTime
end

-- SkillID: 2091, Angel Homunculus
function AlchemistAngelHomunculus(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--1hit--add
    local OutDamage = 0
	if (BarrageCount == 1) then
		OutDamage = InDamage * ( 200 + ( Energy / 50 ) ) / 100;
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * ( 200 + ( Energy / 50 ) ) / 100;
	end

    return OutDamage
end

-- SkillID: 2092, Ignition Bomber
function AlchemistIgnitionBomber(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--1hit--add
    local OutDamage = 0
		OutDamage = InDamage * ( 200 + ( Energy / 50 ) ) / 100;

   return OutDamage
end

-- SkillID: 2093, Countless Weapon
function AlchemistCountlessWeapon(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)-----2 hit
    local OutDamage = 0
	if (BarrageCount == 1) then
		OutDamage = InDamage * ( 200 + ( Energy / 50 ) ) / 100;
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * ( 200 + ( Energy / 50 ) ) / 100;
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * ( 200 + ( Energy / 50 ) ) / 100;
	end

    return OutDamage
end

-- SkillID: 2024, Dex Booster-ELF
function DexBoosterCalcEffect(Index, Energy)

	local SkillTime = 30
	
	return SkillTime
end

--This skill not in lua now 2095
function LordSpiritBlast(InDamage, Strength, Dexterity, Vitality, Energy, Command, BarrageCount)-----2 hit

	local OutDamage = 0
	if (BarrageCount == 1) then
		OutDamage = InDamage * ( 250 + ( Energy / 20 ) + ( Command / 20 ) ) / 100;
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * ( 250 + ( Energy / 20 ) + ( Command / 20 ) ) / 100;
	end

    return OutDamage

end

--SkillID: 2097
function LordCrownForc(Index, TargetIndex, TargetClass, Energy, Command)

	local SkillEffect = 0
	local SkillTime = 500

		SkillEffect = Command / 100

    return SkillEffect,SkillTime

end

--SkillID: 2098
function LordDivineForce(Index, TargetIndex, TargetClass, Energy, Command)

	local SkillEffect = 400
	local SkillTime = 30

    return SkillEffect,SkillTime

end

--SkillID: 2099
function LordDivineAura(Index, TargetIndex, TargetClass, Energy, Command)

	local SkillEffect = 300
	local SkillTime = 3

    return SkillEffect,SkillTime

end

--SkillID: 2100
function LordBattleGlory(Strength, Dexterity, Vitality, Energy, Command)

	local SkillEffect1 = (Strength + Command) / 3--Attack Power
	local SkillEffect2 = 10--Combat Power

    return SkillEffect1, SkillEffect2

end
