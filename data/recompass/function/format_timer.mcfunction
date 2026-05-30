# Convert ticks to minutes and seconds for display
# Calculate total seconds (ticks / 20)
scoreboard players operation @s deathTimeSeconds = @s deathTimeRemaining
scoreboard players set __const20 temp 20
scoreboard players operation @s deathTimeSeconds /= __const20 temp

# Calculate minutes from seconds
scoreboard players operation @s deathTimeMinutes = @s deathTimeSeconds
scoreboard players set __const60 temp 60
scoreboard players operation @s deathTimeMinutes /= __const60 temp

# Calculate remaining seconds (seconds - minutes * 60)
scoreboard players operation @s temp = @s deathTimeMinutes
scoreboard players operation @s temp *= __const60 temp
scoreboard players operation @s deathTimeSeconds -= @s temp

# Display format: >= 5 minutes shows "X minutes", < 5 minutes shows "X min, Y sec"
execute if score @s deathTimeMinutes matches 5.. run title @s actionbar {"text":"Death Location: ","color":"red","extra":[{"score":{"name":"@s","objective":"deathX"},"color":"yellow"},{"text":" "},{"score":{"name":"@s","objective":"deathY"},"color":"yellow"},{"text":" "},{"score":{"name":"@s","objective":"deathZ"},"color":"yellow"},{"text":" | ","color":"gray"},{"score":{"name":"@s","objective":"deathTimeMinutes"},"color":"gold"},{"text":" minutes","color":"gold"}]}

execute if score @s deathTimeMinutes matches ..4 run title @s actionbar {"text":"Death Location: ","color":"red","extra":[{"score":{"name":"@s","objective":"deathX"},"color":"yellow"},{"text":" "},{"score":{"name":"@s","objective":"deathY"},"color":"yellow"},{"text":" "},{"score":{"name":"@s","objective":"deathZ"},"color":"yellow"},{"text":" | ","color":"red"},{"score":{"name":"@s","objective":"deathTimeMinutes"},"color":"red"},{"text":" min, ","color":"red"},{"score":{"name":"@s","objective":"deathTimeSeconds"},"color":"red"},{"text":" sec","color":"red"}]}
