execute unless entity @e[tag=toasty] run summon armor_stand 0 0 0 {Small:1b,NoGravity:1b,Tags:["toasty"],Invisible:1b,ArmorItems: [{}, {}, {}, {id: "minecraft:player_head", tag: {SkullOwnerOrig: [I; 1151461867, 1749829631, -1365538211, 1676554665], SkullOwner: {Id: [I; 1626034305, 166018123, -1076533220, 297727506], Properties: {textures: [{Value: "ewogICJ0aW1lc3RhbXAiIDogMTY1MjQ4NjI4MDM0MSwKICAicHJvZmlsZUlkIiA6ICI0NGExZTllYjY4NGM0N2ZmYWU5YjhhNWQ2M2VlMzFhOSIsCiAgInByb2ZpbGVOYW1lIiA6ICJQaGVuVGhlRmlyZUdpcmwiLAogICJ0ZXh0dXJlcyIgOiB7CiAgICAiU0tJTiIgOiB7CiAgICAgICJ1cmwiIDogImh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYjM1NmRjOWQyYTcyNDNlYTA2ZDIwNjRmODcyM2NiZThhY2RjMDQzMGZmNzgzMWFhMDRkNDY2MjBiZDk3ZjczOCIKICAgIH0KICB9Cn0="}]}, Name: "PhenTheFireGirl"}}, Count: 1b}]}
scoreboard objectives add toasty dummy
scoreboard objectives add toastySettings trigger
scoreboard players enable @a toastySettings

scoreboard players add passive toasty 0
scoreboard players add passive passive 0

function toasty:load/hw
schedule function toasty:loop-core 1