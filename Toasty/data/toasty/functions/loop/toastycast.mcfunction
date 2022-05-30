execute positioned ^ ^ ^0.25 as @e[dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[tag=toasty] run tag @s add frozen
execute positioned ^ ^ ^0.25 as @e[dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[tag=toasty] run particle enchanted_hit ~0.99 ~0.99 ~0.99 1 1 1 0 2
execute positioned ^ ^ ^0.25 as @e[dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[tag=toasty] run particle enchant ~0.99 ~0.99 ~0.99 0.2 0.2 0.2 0 5 normal @a
execute positioned ^ ^ ^0.25 as @e[dx=0] positioned ~-0.99 ~-0.99 ~-0.99 unless entity @s[tag=toasty] run tag @e[tag=toasty] remove frozen
execute positioned ^ ^ ^0.25 if entity @s[distance=0..64] if block ~ ~ ~ air run function toasty:loop/toastycast