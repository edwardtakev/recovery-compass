# Edd's Recovery Compass

A Minecraft datapack that stores the coordinates of the player's last death and shows them in the action bar when holding a recovery compass.

## Features

- Stores the last death location for each player
- Shows death coordinates when holding a recovery compass
- Displays remaining recovery time in the action bar
- Default item expiration logic can be adjusted for testing

## Installation

1. Copy the entire `Edd's Recovery Compass` folder into your world's `datapacks` folder.
2. Open the world and run:

```mcfunction
/reload
```

3. Confirm the datapack is loaded with:

```mcfunction
/datapack list
```

## Usage

- Die once to save the death location.
- Hold a **recovery compass** in your main hand.
- The action bar will show:
  - `Death Location: X Y Z`
  - Remaining time until the death items expire

## Timer settings

The death timer is controlled in:

- `data/recompass/function/on_death.mcfunction`

By default, the timer is set with:

```mcfunction
scoreboard players add @s deathTime 1200
```

This value is in ticks:
- `1200` ticks = `1` minute
- `12000` ticks = `10` minutes
- `36000` ticks = `30` minutes

For testing, set a smaller value such as:

```mcfunction
scoreboard players add @s deathTime 1200
```

## Notes

- This datapack uses Minecraft functions, predicates, and scoreboards.
- Make sure your server or client supports the target Minecraft data pack version.

## Files

- `pack.mcmeta` — datapack metadata
- `data/recompass/function/load.mcfunction` — initializes scoreboards
- `data/recompass/function/tick.mcfunction` — main tick update logic
- `data/recompass/function/on_death.mcfunction` — stores death coordinates and tags death drops
- `data/recompass/function/show_coordinates.mcfunction` — shows action bar text
- `data/recompass/function/format_timer.mcfunction` — formats the timer display
- `data/recompass/predicate/holding_compass.json` — checks for a recovery compass in hand
