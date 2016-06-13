

require ("config")
require ("libs.detectmod") --Detect supported Mods, currently DyTechWar and Bob's Enemies and others
require ("libs.item-functions") -- From Bob's Libary 
require ("libs.recipe-functions") -- From Bob's Libary 
require ("libs.technology-functions") -- From Bob's Libary 
require ("prototypes.Vanilla_Changes.Settings")


--- Got tierd of reaching limits...
if NE_Enemies_Config.LongReach then
	if data.raw.player.player.build_distance < 24 then
		data.raw.player.player.build_distance = 24
		data.raw.player.player.reach_distance = 20
		data.raw.player.player.reach_resource_distance = 20
		data.raw.player.player.drop_item_distance = 20
	end	
end 

--- Difficulty settings	
	if NE_Difficulty == nil then
      NE_Difficulty = 1
	end

	if NE_Enemies_Config.Set_Difficulty == 1 then
		NE_Difficulty = 1 -- Normal difficulty
		else NE_Difficulty  = 2 -- Hard difficulty
	end

----- Update the Alien Atrifact Graphic
data.raw.item["alien-artifact"].icon = "__Natural_Evolution_Enemies__/graphics/icons/alien-artifact.png"


--- Bob's Enemies - Update the Small Artifact Recipe.
if NE_Enemies_Config.mod.BobEnemies and NE_Enemies_Config.ExtraLoot then

	bobmods.lib.remove_recipe_item ("alien-artifact-from-small", "small-alien-artifact")
	bobmods.lib.add_new_recipe_item ("alien-artifact-from-small", {type="item", name="small-alien-artifact", amount=100})

end


  --- SupremeWarfare_1.0.5 - Update the Small Artifact Recipe.
if NE_Enemies_Config.mod.SupremeWarfare and NE_Enemies_Config.ExtraLoot then

	bobmods.lib.remove_recipe_item ("alien-artifact", "small-alien-artifact")
	bobmods.lib.add_new_recipe_item ("alien-artifact", {type="item", name="small-alien-artifact", amount=100})

end




if NE_Enemies_Config.Spawners then
	--Add resistances to entities.
	-- Poison
	NE_Functions.Add_Damage_Resists("poison",data.raw["wall"],(25/NE_Difficulty))
	NE_Functions.Add_Damage_Resists("poison",data.raw["gate"],(25/NE_Difficulty))
	NE_Functions.Add_Damage_Resists("poison",data.raw["car"],(25/NE_Difficulty))
	NE_Functions.Add_Damage_Resists("poison",data.raw["electric-pole"],100)
	NE_Functions.Add_Damage_Resists("poison",data.raw["turret"],(25/NE_Difficulty))	
	NE_Functions.Add_Damage_Resists("poison",data.raw["ammo-turret"],(25/NE_Difficulty))	
	NE_Functions.Add_Damage_Resists("poison",data.raw["electric-turret"],(25/NE_Difficulty))	
	NE_Functions.Add_Damage_Resists("poison",data.raw["transport-belt"],(25/NE_Difficulty))
	
	-- Acid
	NE_Functions.Add_Damage_Resists("acid",data.raw["wall"],(25/NE_Difficulty))
	NE_Functions.Add_Damage_Resists("acid",data.raw["gate"],(25/NE_Difficulty))
	NE_Functions.Add_Damage_Resists("acid",data.raw["car"],(25/NE_Difficulty))
	NE_Functions.Add_Damage_Resists("acid",data.raw["electric-pole"],100)
	NE_Functions.Add_Damage_Resists("acid",data.raw["turret"],(25/NE_Difficulty))	
	NE_Functions.Add_Damage_Resists("acid",data.raw["ammo-turret"],(25/NE_Difficulty))	
	NE_Functions.Add_Damage_Resists("acid",data.raw["electric-turret"],(25/NE_Difficulty))	
	NE_Functions.Add_Damage_Resists("acid",data.raw["transport-belt"],(25/NE_Difficulty))	
	
	--- Make Rail immune to damage
	NE_Functions.Add_Damage_Resists("poison",data.raw["straight-rail"],100)	
	NE_Functions.Add_Damage_Resists("poison",data.raw["curved-rail"],100)	
	NE_Functions.Add_Damage_Resists("acid",data.raw["straight-rail"],100)	
	NE_Functions.Add_Damage_Resists("acid",data.raw["curved-rail"],100)	
	NE_Functions.Add_Damage_Resists("physical",data.raw["straight-rail"],100)	
	NE_Functions.Add_Damage_Resists("physical",data.raw["curved-rail"],100)		
	NE_Functions.Add_Damage_Resists("explosion",data.raw["straight-rail"],100)	
	NE_Functions.Add_Damage_Resists("explosion",data.raw["curved-rail"],100)		
	NE_Functions.Add_Damage_Resists("laser",data.raw["straight-rail"],100)	
	NE_Functions.Add_Damage_Resists("laser",data.raw["curved-rail"],100)		
	NE_Functions.Add_Damage_Resists("impact",data.raw["straight-rail"],100)	
	NE_Functions.Add_Damage_Resists("impact",data.raw["curved-rail"],100)		
	NE_Functions.Add_Damage_Resists("fire",data.raw["straight-rail"],100)	
	NE_Functions.Add_Damage_Resists("fire",data.raw["curved-rail"],100)		
	NE_Functions.Add_Damage_Resists("electric",data.raw["straight-rail"],100)	
	NE_Functions.Add_Damage_Resists("electric",data.raw["curved-rail"],100)		
	NE_Functions.Add_Damage_Resists("bob-pierce",data.raw["straight-rail"],100)	
	NE_Functions.Add_Damage_Resists("bob-pierce",data.raw["curved-rail"],100)	
	NE_Functions.Add_Damage_Resists("Biological",data.raw["straight-rail"],100)	
	NE_Functions.Add_Damage_Resists("Biological",data.raw["curved-rail"],100)	
	
end

-- Biters don't attack the rail, but it also does not appear on the mini-map or blue-prints.
if NE_Enemies_Config.SafeRail then
	NE_Functions.Biters_Dont_Attack(data.raw["curved-rail"])
	NE_Functions.Biters_Dont_Attack(data.raw["straight-rail"])
	NE_Functions.Biters_Dont_Attack(data.raw["rail-signal"])
	NE_Functions.Biters_Dont_Attack(data.raw["rail-chain-signal"])
	NE_Functions.Biters_Dont_Attack(data.raw["train-stop"])
end



if NE_Enemies_Config.mod.NEBuildings then
	----- Adds in Building Materials and Thumper to Tech Tree, since Alien Understanding Tech is in both Buildings and Enemies.
	---- Make sure that the Artifact-collector and Biological-bullet-magazine are present, since the tech is in NE Enemies and NE Buildings.
	bobmods.lib.add_technology_recipe ("AlienUnderstanding", "Building_Materials")
	bobmods.lib.add_technology_recipe ("AlienUnderstanding-2", "Thumper")

	bobmods.lib.remove_recipe_item ("Biological-bullet-magazine", "alien-artifact")
	bobmods.lib.remove_recipe_item ("Biological-bullet-magazine", "sulfuric-acid")
	bobmods.lib.add_new_recipe_item ("Biological-bullet-magazine", {type="fluid", name="NE_alien_toxin", amount=10})
		
end

if NE_Enemies_Config.Spawners then
-------- New Units
	if not NE_Enemies_Config.mod.DyTechWar then
		require "prototypes.Vanilla_Changes.New_Biter_Units"
		require "prototypes.Vanilla_Changes.Biter_Evolution"
		require "prototypes.Vanilla_Changes.New_Spitter_Units"
		require "prototypes.Vanilla_Changes.Spitter_Evolution"			
	end
end


--- Extra Loot - Small Alient Atrifacts
if NE_Enemies_Config.ExtraLoot then
	require("prototypes.Extra_Loot.item")
	require("prototypes.Extra_Loot.recipe")
	require("prototypes.Extra_Loot.extra_loot")
end



---- Spawner Modifications ----------------------------------------
if NE_Enemies_Config.Spawners then
	
	-- If you're using DyTech, I will not adjust the values of the Spawners, but use DyTech's values.
	if not NE_Enemies_Config.mod.DyTechWar then
		
	-- Biter Spawner Adjustments
		data.raw["unit-spawner"]["biter-spawner"].max_count_of_owned_units = 15 + 15 * NE_Difficulty
		data.raw["unit-spawner"]["biter-spawner"].max_friends_around_to_spawn = 25 + 15 * NE_Difficulty
		data.raw["unit-spawner"]["biter-spawner"].spawning_cooldown = {(200+100/NE_Difficulty), (100+50/NE_Difficulty)}
		data.raw["unit-spawner"]["biter-spawner"].max_health = 500 + (1000 * NE_Difficulty)
		data.raw["unit-spawner"]["biter-spawner"].resistances = Resistances.Spawner
		data.raw["unit-spawner"]["biter-spawner"].spawning_radius = 25
		data.raw["unit-spawner"]["biter-spawner"].spawning_spacing = 2
		data.raw["unit-spawner"]["biter-spawner"].pollution_absorbtion_absolute = 15
		data.raw["unit-spawner"]["biter-spawner"].pollution_absorbtion_proportional = 0.005

		-- Spitter Spawner Adjustments
		data.raw["unit-spawner"]["spitter-spawner"].max_count_of_owned_units = 10 + 10 * NE_Difficulty
		data.raw["unit-spawner"]["spitter-spawner"].max_friends_around_to_spawn = 15 + 15 * NE_Difficulty
		data.raw["unit-spawner"]["spitter-spawner"].spawning_cooldown = {(300+100/NE_Difficulty), (100+80/NE_Difficulty)}
		data.raw["unit-spawner"]["spitter-spawner"].max_health = 1000 + (1000 * NE_Difficulty)
		data.raw["unit-spawner"]["spitter-spawner"].resistances = Resistances.Spawner
		data.raw["unit-spawner"]["spitter-spawner"].spawning_radius = 20
		data.raw["unit-spawner"]["spitter-spawner"].spawning_spacing = 2
		data.raw["unit-spawner"]["spitter-spawner"].pollution_absorbtion_absolute = 15
		data.raw["unit-spawner"]["spitter-spawner"].pollution_absorbtion_proportional = 0.005

	end
	
	-- Bob's Enemies Modifications
	if NE_Enemies_Config.mod.BobEnemies and NE_Enemies_Config.mod.DyTechWar then

		-- Bob's Biter Spawner Adjustments
		data.raw["unit-spawner"]["bob-biter-spawner"].max_count_of_owned_units = data.raw["unit-spawner"]["biter-spawner"].max_count_of_owned_units
		data.raw["unit-spawner"]["bob-biter-spawner"].max_friends_around_to_spawn = data.raw["unit-spawner"]["biter-spawner"].max_friends_around_to_spawn
		data.raw["unit-spawner"]["bob-biter-spawner"].spawning_cooldown = data.raw["unit-spawner"]["biter-spawner"].spawning_cooldown
		data.raw["unit-spawner"]["bob-biter-spawner"].max_health = data.raw["unit-spawner"]["biter-spawner"].max_health
		data.raw["unit-spawner"]["bob-biter-spawner"].spawning_radius = data.raw["unit-spawner"]["biter-spawner"].spawning_radius
		data.raw["unit-spawner"]["bob-biter-spawner"].spawning_spacing = data.raw["unit-spawner"]["biter-spawner"].spawning_spacing
		data.raw["unit-spawner"]["bob-biter-spawner"].max_spawn_shift = data.raw["unit-spawner"]["biter-spawner"].max_spawn_shift
		data.raw["unit-spawner"]["bob-biter-spawner"].pollution_absorbtion_proportional = data.raw["unit-spawner"]["biter-spawner"].pollution_absorbtion_proportional
		data.raw["unit-spawner"]["bob-biter-spawner"].pollution_absorbtion_absolute = data.raw["unit-spawner"]["biter-spawner"].pollution_absorbtion_absolute


		-- Bob's Spitter Spawner Adjustments
		data.raw["unit-spawner"]["bob-spitter-spawner"].max_count_of_owned_units = data.raw["unit-spawner"]["spitter-spawner"].max_count_of_owned_units
		data.raw["unit-spawner"]["bob-spitter-spawner"].max_friends_around_to_spawn = data.raw["unit-spawner"]["spitter-spawner"].max_friends_around_to_spawn
		data.raw["unit-spawner"]["bob-spitter-spawner"].spawning_cooldown = data.raw["unit-spawner"]["spitter-spawner"].spawning_cooldown
		data.raw["unit-spawner"]["bob-spitter-spawner"].max_health = data.raw["unit-spawner"]["spitter-spawner"].max_health
		data.raw["unit-spawner"]["bob-spitter-spawner"].spawning_radius = data.raw["unit-spawner"]["spitter-spawner"].spawning_radius
		data.raw["unit-spawner"]["bob-spitter-spawner"].spawning_spacing = data.raw["unit-spawner"]["spitter-spawner"].spawning_spacing
		data.raw["unit-spawner"]["bob-spitter-spawner"].max_spawn_shift = data.raw["unit-spawner"]["spitter-spawner"].max_spawn_shift
		data.raw["unit-spawner"]["bob-spitter-spawner"].pollution_absorbtion_proportional = data.raw["unit-spawner"]["spitter-spawner"].pollution_absorbtion_proportional
		data.raw["unit-spawner"]["bob-spitter-spawner"].pollution_absorbtion_absolute = data.raw["unit-spawner"]["spitter-spawner"].pollution_absorbtion_absolute
		
	elseif NE_Enemies_Config.mod.BobEnemies and not NE_Enemies_Config.mod.DyTechWar then

		-- Bob's Biter Spawner Adjustments
		data.raw["unit-spawner"]["bob-biter-spawner"].max_count_of_owned_units = 15 + 15 * NE_Difficulty
		data.raw["unit-spawner"]["bob-biter-spawner"].max_friends_around_to_spawn = 25 + 15 * NE_Difficulty
		data.raw["unit-spawner"]["bob-biter-spawner"].spawning_cooldown = {(200+100/NE_Difficulty), (100+50/NE_Difficulty)}
		data.raw["unit-spawner"]["bob-biter-spawner"].max_health = 500 + (1000 * NE_Difficulty)
		data.raw["unit-spawner"]["bob-biter-spawner"].resistances = Resistances.Spawner
		data.raw["unit-spawner"]["bob-biter-spawner"].spawning_radius = 25
		data.raw["unit-spawner"]["bob-biter-spawner"].spawning_spacing = 2
		data.raw["unit-spawner"]["bob-biter-spawner"].pollution_absorbtion_absolute = 15
		data.raw["unit-spawner"]["bob-biter-spawner"].pollution_absorbtion_proportional = 0.005
		
		
		-- Bob's Spitter Spawner Adjustments
		data.raw["unit-spawner"]["bob-spitter-spawner"].max_count_of_owned_units = 10 + 10 * NE_Difficulty
		data.raw["unit-spawner"]["bob-spitter-spawner"].max_friends_around_to_spawn = 15 + 15 * NE_Difficulty
		data.raw["unit-spawner"]["bob-spitter-spawner"].spawning_cooldown = {(300+100/NE_Difficulty), (100+80/NE_Difficulty)}
		data.raw["unit-spawner"]["bob-spitter-spawner"].max_health = 1000 + (1000 * NE_Difficulty)
		data.raw["unit-spawner"]["bob-spitter-spawner"].resistances = Resistances.Spawner
		data.raw["unit-spawner"]["bob-spitter-spawner"].spawning_radius = 20
		data.raw["unit-spawner"]["bob-spitter-spawner"].spawning_spacing = 2
		data.raw["unit-spawner"]["bob-spitter-spawner"].pollution_absorbtion_absolute = 15
		data.raw["unit-spawner"]["bob-spitter-spawner"].pollution_absorbtion_proportional = 0.005

	end

end
---- END Spawner Modifications ----------------------------------------



---- Biter & Spitter Modifications --------------------------------
if NE_Enemies_Config.Spawners then
	
	if not NE_Enemies_Config.mod.DyTechWar then
		-- Vanilla Unit Adjustments
		data.raw["unit"]["small-biter"].resistances = Resistances.Small_Biter
		data.raw["unit"]["small-biter"].max_health = Health.Small_Biter
		data.raw["unit"]["small-biter"].ammo_type = Damage.Small_Biter

		data.raw["unit"]["medium-biter"].resistances = Resistances.Medium_Biter
		data.raw["unit"]["medium-biter"].max_health = Health.Medium_Biter
		data.raw["unit"]["medium-biter"].ammo_type = Damage.Medium_Biter
		data.raw["unit"]["medium-biter"].pollution_to_join_attack = 800

		data.raw["unit"]["big-biter"].resistances = Resistances.Big_Biter
		data.raw["unit"]["big-biter"].max_health = Health.Big_Biter
		data.raw["unit"]["big-biter"].ammo_type = Damage.Big_Biter
		data.raw["unit"]["big-biter"].pollution_to_join_attack = 1000

		data.raw["unit"]["behemoth-biter"].resistances = Resistances.Behemoth_Biter
		data.raw["unit"]["behemoth-biter"].max_health = Health.Behemoth_Biter
		data.raw["unit"]["behemoth-biter"].ammo_type = Damage.Behemoth_Biter
		data.raw["unit"]["behemoth-biter"].pollution_to_join_attack = 2500

		
		--- Vanilla Spitter Units
		data.raw["unit"]["small-spitter"].resistances = Resistances.Small_Spitter
		data.raw["unit"]["small-spitter"].max_health = Health.Small_Spitter
		
		
		data.raw["unit"]["medium-spitter"].resistances = Resistances.Medium_Spitter
		data.raw["unit"]["medium-spitter"].max_health = Health.Medium_Spitter

		data.raw["unit"]["big-spitter"].resistances = Resistances.Big_Spitter
		data.raw["unit"]["big-spitter"].max_health = Health.Big_Spitter
		data.raw["unit"]["big-spitter"].pollution_to_join_attack = 1200

		data.raw["unit"]["behemoth-spitter"].resistances = Resistances.Behemoth_Spitter
		data.raw["unit"]["behemoth-spitter"].max_health = Health.Behemoth_Spitter
		data.raw["unit"]["behemoth-spitter"].pollution_to_join_attack = 5000

		-- Worms
		--data.raw["turret"]["small-worm-turret"].attack_parameters.ammo_type.action.action_delivery.projectile = "Infected-Projectile-Worm" -- Testing
		data.raw["turret"]["small-worm-turret"].max_health = Health.Small_Worm
		data.raw["turret"]["small-worm-turret"].attack_parameters.range = 17 + NE_Difficulty
		data.raw["turret"]["small-worm-turret"].resistances = Resistances.Small_Worm

		data.raw["turret"]["medium-worm-turret"].attack_parameters.ammo_type.action.action_delivery.projectile = "Infected-Projectile-Worm"
		data.raw["turret"]["medium-worm-turret"].max_health = Health.Medium_Worm
		data.raw["turret"]["medium-worm-turret"].attack_parameters.range = 20 + NE_Difficulty
		data.raw["turret"]["medium-worm-turret"].resistances = Resistances.Medium_Worm
		
		data.raw["turret"]["big-worm-turret"].attack_parameters.ammo_type.action.action_delivery.projectile = "Mutated-Projectile-Worm"
		data.raw["turret"]["big-worm-turret"].max_health = Health.Big_Worm
		data.raw["turret"]["big-worm-turret"].attack_parameters.range = 25 + NE_Difficulty
		data.raw["turret"]["big-worm-turret"].resistances = Resistances.Big_Worm
		
	end
	
	
-- Bob's Enemies Modifications
	if NE_Enemies_Config.mod.BobEnemies then
		data.raw["unit"]["bob-big-piercing-biter"].pollution_to_join_attack = 1000
		data.raw["unit"]["bob-huge-acid-biter"].pollution_to_join_attack = 2000
		data.raw["unit"]["bob-huge-explosive-biter"].pollution_to_join_attack = 3000
		data.raw["unit"]["bob-giant-poison-biter"].pollution_to_join_attack = 4000
		data.raw["unit"]["bob-giant-fire-biter"].pollution_to_join_attack = 5000
		data.raw["unit"]["bob-titan-biter"].pollution_to_join_attack = 6000
		data.raw["unit"]["bob-behemoth-biter"].pollution_to_join_attack = 7000
		data.raw["unit"]["bob-leviathan-biter"].pollution_to_join_attack = 8000	
		
		data.raw["unit"]["bob-big-electric-spitter"].pollution_to_join_attack = 1500
		data.raw["unit"]["bob-huge-explosive-spitter"].pollution_to_join_attack = 2500
		data.raw["unit"]["bob-huge-acid-spitter"].pollution_to_join_attack = 3500
		data.raw["unit"]["bob-giant-fire-spitter"].pollution_to_join_attack = 4500
		data.raw["unit"]["bob-giant-poison-spitter"].pollution_to_join_attack = 5500
		data.raw["unit"]["bob-titan-spitter"].pollution_to_join_attack = 6500
		data.raw["unit"]["bob-behemoth-spitter"].pollution_to_join_attack = 7500
		data.raw["unit"]["bob-leviathan-spitter"].pollution_to_join_attack = 8500	

		if NE_Enemies_Config.Spawners and not NE_Enemies_Config.mod.DyTechWar then
			require "prototypes.Vanilla_Changes.Bobs_Spawners"				
		end
		
	end

end
---- END Biter & Spitter Modifications --------------------------------		

