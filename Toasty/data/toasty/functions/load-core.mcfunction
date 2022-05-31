# Create scoreboards
scoreboard objectives add toasty dummy
scoreboard objectives add toastySettings trigger

# Hello World
function toasty:load/hw

# Loop
schedule function toasty:loop-core 1
