# Display death coordinates and time remaining in action bar
execute if score @s deathTime matches 1.. run function recompass:format_timer
