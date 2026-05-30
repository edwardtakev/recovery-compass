# Store death coordinates at respawn location
execute store result score @s deathX run data get entity @s Pos[0] 1
execute store result score @s deathY run data get entity @s Pos[1] 1
execute store result score @s deathZ run data get entity @s Pos[2] 1

# Record death time in ticks (for testing, 12000 = 10 minute)
execute store result score @s deathTime run time query gametime
scoreboard players add @s deathTime 8400

# Tag nearby death drops at the stored death location and record expiry time
execute as @s run summon marker ~ ~ ~ {Tags:["recompass_death_marker"],Invisible:1b,NoGravity:1b,Marker:1b,PersistenceRequired:1b}
execute as @s store result entity @e[type=marker,tag=recompass_death_marker,limit=1,sort=nearest] Pos[0] double 1 run scoreboard players get @s deathX
execute as @s store result entity @e[type=marker,tag=recompass_death_marker,limit=1,sort=nearest] Pos[1] double 1 run scoreboard players get @s deathY
execute as @s store result entity @e[type=marker,tag=recompass_death_marker,limit=1,sort=nearest] Pos[2] double 1 run scoreboard players get @s deathZ
execute as @s at @e[type=marker,tag=recompass_death_marker,limit=1,sort=nearest] run tag @e[type=item,distance=..16] add recompass_death_item
execute at @s run scoreboard players operation @e[type=item,tag=recompass_death_item,distance=..16] deathItemTimer = @s deathTime
kill @e[type=marker,tag=recompass_death_marker,limit=1,sort=nearest]
