# Scoreboards
scoreboard objectives add toasty dummy
scoreboard objectives add toastySettings trigger
scoreboard players enable @a toastySettings

# Scores
scoreboard players add passive toasty 0
scoreboard players add passive passive 0

# Init
function toasty:load/hw
schedule function toasty:loop-core 1
