# Check for death using built-in deathCount
execute as @a unless score @s lastDeathCount = @s lastDeathCount run scoreboard players set @s lastDeathCount 0
execute as @a if score @s deathCount > @s lastDeathCount run function recompass:on_death
execute as @a run scoreboard players operation @s lastDeathCount = @s deathCount

# Update remaining time for death location
execute as @a store result score @s gameTime run time query gametime
execute as @a if score @s deathTime matches 1.. run scoreboard players operation @s deathTimeRemaining = @s deathTime
execute as @a if score @s deathTime matches 1.. run scoreboard players operation @s deathTimeRemaining -= @s gameTime
execute as @a if score @s deathTimeRemaining matches ..0 run scoreboard players reset @s deathTime

# Keep death drops from despawning while loaded and remove them when expired
execute as @e[type=item,tag=recompass_death_item] store result score @s gameTime run time query gametime
execute as @e[type=item,tag=recompass_death_item] if score @s gameTime < @s deathItemTimer run data merge entity @s {Age:0}
execute as @e[type=item,tag=recompass_death_item] unless score @s gameTime < @s deathItemTimer run kill @s

# Check for recovery compass in hand
execute as @a if predicate recompass:holding_compass run function recompass:show_coordinates