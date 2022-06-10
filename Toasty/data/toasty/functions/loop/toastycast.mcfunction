# Tag toasty with frozen if hit
execute positioned ^ ^ ^0.25 as @e[dx=0] if entity @s[tag=toasty] run tag @s add frozen
# Tag player freezing toasty
execute positioned ^ ^ ^0.25 if entity @e[dx=0,tag=toasty] run tag @s add freezing
# Particles
execute positioned ^ ^ ^0.25 as @e[dx=0] if entity @s[tag=toasty] run particle enchanted_hit ~ ~ ~ 1 1 1 0 2
execute positioned ^ ^ ^0.25 as @e[dx=0] if entity @s[tag=toasty] run particle enchant ~ ~ ~ 0.2 0.2 0.2 0 5 normal @a
# If player freezing toasty cannot find toasty, remove tags
execute as @a[tag=freezing] positioned ^ ^ ^0.25 unless entity @s[distance=0..64] unless block ~ ~ ~ air run tag @e[tag=toasty] remove frozen
execute as @a[tag=freezing] positioned ^ ^ ^0.25 unless entity @s[distance=0..64] unless block ~ ~ ~ air run tag @s remove freezing
# Cast
execute positioned ^ ^ ^0.25 if entity @s[distance=0..64] if block ~ ~ ~ air run function toasty:loop/toastycast
