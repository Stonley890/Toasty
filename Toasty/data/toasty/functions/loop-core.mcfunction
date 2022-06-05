# Movement
execute as @e[tag=toasty] at @s unless entity @a[tag=freezing] facing entity @p eyes run tp @s ^ ^ ^0.1 facing entity @p
execute as @e[tag=toasty,tag=!passive] at @s unless entity @a[tag=freezing] run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air destroy
execute as @e[tag=toasty,tag=!passive] at @s run effect give @e[distance=0..2] minecraft:instant_damage
execute as @e[tag=toasty,tag=passive] at @s run effect give @a[distance=0..2] minecraft:instant_damage
execute as @e[tag=toasty] at @s run effect give @a[distance=0..10] minecraft:blindness 2

# Summon new toasty if none, kill one toasty if more than one
execute in overworld unless entity @e[tag=toasty] run execute in the_nether unless entity @e[tag=toasty] run execute in the_end unless entity @e[tag=toasty] run execute at @r run summon armor_stand ~ 0 ~ {Small:1b,NoGravity:1b,Tags:["toasty"],Invisible:1b,ArmorItems: [{}, {}, {}, {id: "minecraft:player_head", tag: {SkullOwnerOrig: [I; 1151461867, 1749829631, -1365538211, 1676554665], SkullOwner: {Id: [I; 1626034305, 166018123, -1076533220, 297727506], Properties: {textures: [{Value: "ewogICJ0aW1lc3RhbXAiIDogMTY1MjQ4NjI4MDM0MSwKICAicHJvZmlsZUlkIiA6ICI0NGExZTllYjY4NGM0N2ZmYWU5YjhhNWQ2M2VlMzFhOSIsCiAgInByb2ZpbGVOYW1lIiA6ICJQaGVuVGhlRmlyZUdpcmwiLAogICJ0ZXh0dXJlcyIgOiB7CiAgICAiU0tJTiIgOiB7CiAgICAgICJ1cmwiIDogImh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYjM1NmRjOWQyYTcyNDNlYTA2ZDIwNjRmODcyM2NiZThhY2RjMDQzMGZmNzgzMWFhMDRkNDY2MjBiZDk3ZjczOCIKICAgIH0KICB9Cn0="}]}, Name: "PhenTheFireGirl"}}, Count: 1b}]}
execute store result score Number toasty run execute if entity @e[tag=toasty] 
execute at @r if score Number toasty matches 2.. run kill @e[tag=toasty,limit=1,sort=furthest]

execute if score unfreezeable toasty matches 0 as @a at @s anchored eyes run function toasty:loop/toastycast

# toastySettings

execute as @a[scores={toastySettings=11}] run scoreboard players set passive toasty 1
execute as @a[scores={toastySettings=10}] run scoreboard players set passive toasty 0

execute as @a[scores={toastySettings=21}] run scoreboard players set unfreezeable toasty 1
execute as @a[scores={toastySettings=20}] run scoreboard players set unfreezeable toasty 0

execute as @a[scores={toastySettings=1..}] run tellraw @s ["\n",{"text":"- Toasty Settings -","bold":true,"color":"red"},"\n",{"text":"> Passive","color":"white"},"\n",{"text":"Prevents Toasty from breaking blocks and damaging all entities","color":"gray"}]
execute as @a[scores={toastySettings=1..}] if score passive toasty matches 1 run tellraw @s ["",{"text":"[","color":"dark_green"},{"text":"Enable","underlined":true,"color":"green","clickEvent":{"action":"run_command","value":"/trigger toastySettings set 11"}},{"text":"]","color":"dark_green"}," <> ",{"text":"[","color":"gray"},{"text":"Disable","color":"red","clickEvent":{"action":"run_command","value":"/trigger toastySettings set 10"}},{"text":"]","color":"gray"}]
execute as @a[scores={toastySettings=1..}] if score passive toasty matches 0 run tellraw @s ["",{"text":"[","color":"gray"},{"text":"Enable","color":"green","clickEvent":{"action":"run_command","value":"/trigger toastySettings set 11"}},{"text":"]","color":"gray"}," <> ",{"text":"[","color":"dark_red"},{"text":"Disable","underlined":true,"color":"red","clickEvent":{"action":"run_command","value":"/trigger toastySettings set 10"}},{"text":"]","color":"dark_red"}]
execute as @a[scores={toastySettings=1..}] run tellraw @s ["","\n",{"text":"> Unfreezeable","color":"white"},"\n",{"text":"Prevents the player from freezing Toasty when looking at it","color":"gray"}]
execute as @a[scores={toastySettings=1..}] if score unfreezeable toasty matches 1 run tellraw @s ["",{"text":"[","color":"dark_green"},{"text":"Enable","underlined":true,"color":"green","clickEvent":{"action":"run_command","value":"/trigger toastySettings set 21"}},{"text":"]","color":"dark_green"}," <> ",{"text":"[","color":"gray"},{"text":"Disable","color":"red","clickEvent":{"action":"run_command","value":"/trigger toastySettings set 20"}},{"text":"]","color":"gray"},"\n"]
execute as @a[scores={toastySettings=1..}] if score unfreezeable toasty matches 0 run tellraw @s ["",{"text":"[","color":"gray"},{"text":"Enable","color":"green","clickEvent":{"action":"run_command","value":"/trigger toastySettings set 21"}},{"text":"]","color":"gray"}," <> ",{"text":"[","color":"dark_red"},{"text":"Disable","underlined":true,"color":"red","clickEvent":{"action":"run_command","value":"/trigger toastySettings set 20"}},{"text":"]","color":"dark_red"},"\n"]

scoreboard players reset @a[scores={toastySettings=1..}] toastySettings
scoreboard players enable @a toastySettings

schedule function toasty:loop-core 1