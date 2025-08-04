-- Character Classes
CLASS_WIZARD                                          = 0    -- Dark Wizard, Soul Master, Grand Master
CLASS_KNIGHT                                          = 1    -- Dark Knight, Blade Knight, Blade Master
CLASS_ELF                                             = 2    -- Fairy Elf, Muse Elf, High Elf
CLASS_GLADIATOR                                       = 3    -- Magic Gladiator, Duel Master
CLASS_DARKLORD                                        = 4    -- Dark Lord, Lord Emperor
CLASS_SUMMONER                                        = 5    -- Summoner, Bloody Summoner, Dimension Master
CLASS_RAGEFIGHTER                                     = 6    -- Rage Fighter, Fist Master
CLASS_GROWLANCER									  = 7    -- Grow Lancer, Mirage Lancer
CLASS_RUNEWIZARD									  = 8    -- Rune Wizard, Rune Spell Master, Grand Rune Master
CLASS_SLAYER									  	  = 9    -- Slayer, Royal Slayer, Master Slayer, Slaughterer
CLASS_GUNCRUSHER									  = 10   -- Gun Crusher, Gun Breaker, Master Gun Breaker, Heist Gun Crusher
CLASS_LIGHTWIZARD									  = 11   -- Light Wizard, Shining Wizard, Luminous Wizard
CLASS_LEMURIAMAGE									  = 12   -- Lemuria Mage, Warmage, Archmage, Mystic Mage
CLASS_ILLUSIONKNIGHT								  = 13   -- Illusion Knight, Mirage Knight, Illusion Master, Mystic Knight	
ClASS_ALCHEMIST										  = 14   -- Alchemist, ALCHEMIC MAGICIAN, ALCHEMIC MASTER, ALCHEMIC FORCE,CREATOR

-- SkillID: 2037, Meteor Storm of Gale
function MeteorStorm_5thEnchant_Wizard(InDamage, Energy, BarrageCount)--2hit
	local OutDamage = 0
	if (BarrageCount == 1) then
		OutDamage = InDamage
	elseif (BarrageCount == 2) then
		OutDamage = InDamage
	elseif (BarrageCount == 3) then---4th tree hit
		OutDamage = InDamage
	end
	--LogColor(1,BarrageCount)--Meteor Storm of Gale
	return OutDamage
end

-- SkillID: 2040, Sword Blow of Saturation
function SwordBlow_5thEnchant_Knight(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--3hit
	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 1.0) * (Energy / 10 + 200) / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * (Energy / 10 + 200) / 100
	elseif (BarrageCount == 3) then
		OutDamage = (InDamage * 1.0) * (Energy / 10 + 200) / 100
	elseif (BarrageCount == 4) then----4th tree hit
		OutDamage = (InDamage * 1.0) * (Energy / 10 + 200) / 100
	end
	--LogColor(1,BarrageCount)--Sword Blow of Saturation
	return OutDamage
end

-- SkillID: 2043, Destruction of Gale
function StrikeOfDestruction_5thEnchant_Knight(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)
	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = (InDamage * 0.8) * (Energy / 10 + 200) / 100
	elseif (BarrageCount == 2) then----3th tree hit，skill 807 tree value
		OutDamage = (InDamage * 1.0) * (Energy / 10 + 200) / 100
	elseif (BarrageCount == 3) then----4th tree hit
		OutDamage = (InDamage * 1.2) * (Energy / 10 + 200) / 100
	elseif (BarrageCount == 4) then----4th tree hit
		OutDamage = (InDamage * 1.4) * (Energy / 10 + 200) / 100
	end
	--LogColor(1,BarrageCount)

	return OutDamage
end

-- SkillID: 2044, Raining Arrow of Saturation
function RainingArrow_5thEnchant_Elf(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--2hit
	local OutDamage = InDamage
	
	if (BarrageCount == 1) then
        OutDamage = InDamage
    elseif (BarrageCount == 2) then
        OutDamage = InDamage
    elseif (BarrageCount == 3) then----4th tree hit
        OutDamage = InDamage
	elseif (BarrageCount == 4) then----4th tree hit
        OutDamage = InDamage
    end
	--LogColor(1,BarrageCount)
	return OutDamage
end

-- SkillID: 2047, Holy Bolt of Gale
function HolyBolt_5thEnchant_Elf(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--2hit
	local OutDamage = InDamage
	
	if (BarrageCount == 1) then
        OutDamage = InDamage
    elseif (BarrageCount == 2) then
        OutDamage = InDamage
    elseif (BarrageCount == 3) then----4th tree hit
        OutDamage = InDamage
    end
	--LogColor(1,BarrageCount)
	return OutDamage
end

-- SkillID: 2049, Chaos Blade of Saturation
function ChaosBlade_5thEnchant_Gladiator(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--2hit
    local OutDamage = 0
    
    if (BarrageCount == 1) then
         OutDamage = InDamage * 2
    elseif (BarrageCount == 2) then
         OutDamage = InDamage * 2
    elseif (BarrageCount == 3) then----4th tree hit
         OutDamage = InDamage * 2
    end
	--LogColor(1,BarrageCount)
    return OutDamage

	--after get buff 365,366,368,369,370,371
	--it will release skill this skil 2017 onece when use this skill 3 times
end

-- SkillID: 2051, Havok Spear of Wrath
function HavokSpear_5thEnchant_Gladiator(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--2hit
    local OutDamage = 0
    
    if (BarrageCount == 1) then
        OutDamage = InDamage
    elseif (BarrageCount == 2) then
        OutDamage = InDamage
    elseif (BarrageCount == 3) then----4th tree hit
        OutDamage = InDamage
    end
	--after get buff 367,372,373
	--it will release skill this skil 2020 onece when use this skill 3 times
	--LogColor(1,BarrageCount)
    return OutDamage
end

-- SkillID: 2054, Wind Soul of Saturation
function WindSoul_5thEnchant_Lord(InDamage, Strength, Dexterity, Vitality, Energy, Command, BarrageCount)--3hit
	local OutDamage = 0
	
	if (BarrageCount == 1) then
        OutDamage = InDamage * (Energy / 20 + Command / 20 + 250) / 100
    elseif (BarrageCount == 2) then
        OutDamage = InDamage * (Energy / 20 + Command / 20 + 250) / 100
    elseif (BarrageCount == 3) then
        OutDamage = InDamage * (Energy / 20 + Command / 20 + 250) / 100
    elseif (BarrageCount == 4) then----4th tree hit
        OutDamage = InDamage * (Energy / 20 + Command / 20 + 250) / 100
	end
	--LogColor(1,BarrageCount)
	return OutDamage
end

-- SkillID: 2058, Fire Beast of Saturation
function FireBeast_5thEnchant_Summoner(InDamage, Energy, BarrageCount)--3hit
    if (BarrageCount == 1) then
        OutDamage = InDamage
    elseif (BarrageCount == 2) then
        OutDamage = InDamage
    elseif (BarrageCount == 3) then
        OutDamage = InDamage
    elseif (BarrageCount == 4) then----4th tree hit
        OutDamage = InDamage
    end
	--LogColor(1,BarrageCount)
	return OutDamage
end

-- SkillID: 2060, Death Scythe of Fury
function DeadScythe_5thEnchant_Summoner(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--4hit
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = InDamage * 0.8
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * 1.0
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * 1.1
	elseif (BarrageCount == 4) then
		OutDamage = InDamage * 1.2
	elseif (BarrageCount == 5) then----4th tree hit
		OutDamage = InDamage * 1.3
	end
	--LogColor(1,BarrageCount)

	return OutDamage
end

-- SkillID: 2061, Dark Side of Saturation
function DarkSide_5thEnchant_Fighter(InDamage, Dexterity, Energy, BarrageCount)--2hit
	local OutDamage = 0
 	if (BarrageCount == 1) then
		OutDamage = InDamage * (Dexterity / 8 + Energy / 10 + 101) / 100.0
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * (Dexterity / 8 + Energy / 10 + 101) / 100.0
	elseif (BarrageCount == 3) then----4th tree hit
		OutDamage = InDamage * (Dexterity / 8 + Energy / 10 + 101) / 100.0
	elseif (BarrageCount == 4) then----4th tree hit
		OutDamage = InDamage * (Dexterity / 8 + Energy / 10 + 101) / 100.0
	end
 	--LogColor(1,BarrageCount)

	return OutDamage
end

-- SkillID: 2063, Spirit Hook of Saturation
function SpiritHook_5thEnchant_Fighter(InDamage, Vitality, BarrageCount)--4hit
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	elseif (BarrageCount == 4) then
		OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	elseif (BarrageCount == 5) then----4th tree hit
		OutDamage = InDamage * (Vitality / 10 + 50) / 100.0
	end
 	--LogColor(1,BarrageCount)
	return OutDamage
end

-- SkillID: 2065, Oversting of Saturation
function Oversting_5thEnchant_Lancer(InDamage, Dexterity, SkillTreeBonus, BarrageCount)--3 hits--SkillTreeBonus is skill 712  tree value

	if (BarrageCount == 1) then
		OutDamage = InDamage * (97 + Dexterity / 10 + SkillTreeBonus) / 100;
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * (97 + Dexterity / 10 + SkillTreeBonus) / 100;
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * (97 + Dexterity / 10 + SkillTreeBonus) / 100;
	elseif (BarrageCount == 4) then----4th tree hit
		OutDamage = InDamage * (97 + Dexterity / 10 + SkillTreeBonus) / 100;
	elseif (BarrageCount == 5) then----4th tree hit
		OutDamage = InDamage * (97 + Dexterity / 10 + SkillTreeBonus) / 100;
	end
 	--LogColor(1,BarrageCount)

	return OutDamage
end

-- SkillID: 2068, Lightning Storm of Gale
function LightningStorm_5thEnchant_RuneWizard(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--4hit
	local OutDamage = 0
	if (BarrageCount == 1) then
		OutDamage = InDamage
	elseif (BarrageCount == 2) then
		OutDamage = InDamage
	elseif (BarrageCount == 3) then
		OutDamage = InDamage
	elseif (BarrageCount == 4) then
		OutDamage = InDamage
	elseif (BarrageCount == 5) then----4th tree hit
		OutDamage = InDamage
	end
 	--LogColor(1,BarrageCount)
	return OutDamage
end

-- SkillID: 2071, Pierce Attack of Saturation
function PierceAttack_5thEnchant_Slayer(InDamage, Strength, Dexterity, BarrageCount)--2hit
	local OutDamage = 0
	if (BarrageCount == 1) then
		OutDamage = InDamage * ((Strength / 8) + (Dexterity / 28) + 120) / 100
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * ((Strength / 8) + (Dexterity / 28) + 120) / 100
	end
	--4th tree increase skill Distance , EffectRadio,taget
 	--LogColor(1,InDamage)
	return OutDamage
end

-- SkillID: 2073, Bursting Flare of Gale
function BurstingFlare_5thEnchant_GunCrusher(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--2hit
	local OutDamage = 0

	if (BarrageCount == 1) then
		OutDamage = InDamage
	elseif (BarrageCount == 2) then -- Shockwave
		OutDamage = InDamage
	end
	--4th tree increase skill Distance , EffectRadio,skill speed
	return OutDamage
end

-- SkillID: 2076, Ultimate Storm of Saturation
function UltimateForce_5thEnchant_LemuriaMage(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--2hit
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = (InDamage * 1.0) * (140 + (Energy / 100)) / 100
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * 1.0) * (140 + (Energy / 100)) / 100
	elseif (BarrageCount == 3) then----4th tree hit
		OutDamage = (InDamage * 1.0) * (140 + (Energy / 100)) / 100
	end
	
	return OutDamage
end

-- SkillID: 2080, Spear Storm of Saturation
function SpearStorm_5thEnchant_LightWizard(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--2hit
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = ((InDamage * 1.0) * ((Energy / 50) + 200)) / 100
	elseif (BarrageCount == 2) then
		OutDamage = ((InDamage * 1.0) * ((Energy / 50) + 200)) / 100
	elseif (BarrageCount == 3) then---4th tree hit
		OutDamage = ((InDamage * 1.0) * ((Energy / 50) + 200)) / 100
	end

	return OutDamage
end

-- SkillID: 2082, Blade Storm of Saturation
function BladeStorm_5thEnchant_IllusionKnight(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--2hit
	local OutDamage = 0
	
	if (BarrageCount == 1) then
		OutDamage = (InDamage * (200 + (Dexterity / 30))) / 100;
	elseif (BarrageCount == 2) then
		OutDamage = (InDamage * (200 + (Dexterity / 30))) / 100;
	elseif (BarrageCount == 3) then---4th tree hit
		OutDamage = (InDamage * (200 + (Dexterity / 30))) / 100;
	end

	return OutDamage
end

-- SkillID: 2089, Wild Breath of Gale
function WildBreath_5thEnchant_Lancer(InDamage, Strength, SkillTreeBonus, BarrageCount)--3hit,SkillTreeBonus is 711  tree value
	local OutDamage = 0
	if (BarrageCount == 1) then
		OutDamage = InDamage * (97 + Strength / 10 + SkillTreeBonus) / 100;
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * (97 + Strength / 10 + SkillTreeBonus) / 100;
	elseif (BarrageCount == 3) then
		OutDamage = InDamage * (97 + Strength / 10 + SkillTreeBonus) / 100;
	elseif (BarrageCount == 4) then---4th tree hit
		OutDamage = InDamage * (97 + Strength / 10 + SkillTreeBonus) / 100;
	end
	--LogColor(1,BarrageCount)

	return OutDamage
end

-- SkillID: 2094, Countless Weapon of Saturation
function AlchemistCountless_Weapon_of_Saturation(InDamage, Strength, Dexterity, Vitality, Energy, BarrageCount)--2hit
    local OutDamage = 0
	if (BarrageCount == 1) then
		OutDamage = InDamage * ( 165 + ( Energy / 65 ) ) / 100;
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * ( 165 + ( Energy / 65 ) ) / 100;
	elseif (BarrageCount == 3) then---4th tree hit
		OutDamage = InDamage * ( 165 + ( Energy / 65 ) ) / 100;
	end
	--LogColor(1,InDamage)
    return OutDamage
end

-- SkillID: 2096, Spirit Blast of Fire----miss
function Lord_Spirit_Blast_of_Fire(InDamage, Strength, Dexterity, Vitality, Energy, Command, BarrageCount)--2hit
    local OutDamage = 0
	if (BarrageCount == 1) then
		OutDamage = InDamage * ( 250 + ( Energy / 20 ) + ( Command / 20 ) ) / 100;
	elseif (BarrageCount == 2) then
		OutDamage = InDamage * ( 250 + ( Energy / 20 ) + ( Command / 20 ) ) / 100;
	elseif (BarrageCount == 3) then---4th tree hit
		OutDamage = InDamage * ( 250 + ( Energy / 20 ) + ( Command / 20 ) ) / 100;
	end
	--LogColor(1,BarrageCount)
    return OutDamage
end

function ExtraDamageCalc(InDamage, ExtraDamage, ExtraDamageType)
     --InDamage:skill damage
     --ExtraDamage:ExtraDamage value for all 5th card        
         local OutDamage = 0    
         if (ExtraDamageType == 0) then
             OutDamage = InDamage *0.1 + ExtraDamage * 1.3--Nuke
         elseif (ExtraDamageType == 1) then
             OutDamage = InDamage *0.1 + ExtraDamage * 1.2--Bolt
         elseif (ExtraDamageType == 2) then
             OutDamage = InDamage *0.1 + ExtraDamage * 1.1--Aoe        
         end
         return OutDamage
 end