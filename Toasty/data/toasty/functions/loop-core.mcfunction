# Movement
execute as @e[tag=toasty] at @s facing entity @p eyes run tp @s ^ ^ ^0.1 facing entity @p
execute as @e[tag=toasty] at @s run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air destroy
execute as @e[tag=toasty] at @s run effect give @e[distance=0..2] minecraft:instant_damage
execute as @e[tag=toasty] at @s run effect give @a[distance=0..10] minecraft:blindness 2

# Summon new toasty if none, kill one toasty if more than one
execute unless entity @e[tag=toasty] at @r run summon armor_stand ~ 0 ~ {Small:1b,Tags:["toasty"],Invisible:1b,ArmorItems: [{}, {}, {}, {id: "minecraft:player_head", tag: {SkullOwnerOrig: [I; 1151461867, 1749829631, -1365538211, 1676554665], SkullOwner: {Id: [I; 1626034305, 166018123, -1076533220, 297727506], Properties: {textures: [{Value: "ewogICJ0aW1lc3RhbXAiIDogMTY1MjQ4NjI4MDM0MSwKICAicHJvZmlsZUlkIiA6ICI0NGExZTllYjY4NGM0N2ZmYWU5YjhhNWQ2M2VlMzFhOSIsCiAgInByb2ZpbGVOYW1lIiA6ICJQaGVuVGhlRmlyZUdpcmwiLAogICJ0ZXh0dXJlcyIgOiB7CiAgICAiU0tJTiIgOiB7CiAgICAgICJ1cmwiIDogImh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYjM1NmRjOWQyYTcyNDNlYTA2ZDIwNjRmODcyM2NiZThhY2RjMDQzMGZmNzgzMWFhMDRkNDY2MjBiZDk3ZjczOCIKICAgIH0KICB9Cn0="}]}, Name: "PhenTheFireGirl"}}, Count: 1b}]}
execute store result score Number toasty run execute if entity @e[tag=toasty] 
execute at @r if score Number toasty matches 2.. run kill @e[tag=toasty,limit=1,sort=furthest]


schedule function toasty:loop-core 1