# Create scoreboards
scoreboard objectives add toasty dummy
scoreboard objectives add toastySettings trigger

scoreboard players add passive toasty 0
scoreboard players add passive passive 0

# Hello World
function toasty:load/hw

# Loop
schedule function toasty:loop-core 1
