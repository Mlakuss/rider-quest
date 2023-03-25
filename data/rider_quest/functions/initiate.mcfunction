scoreboard objectives add horse_travel minecraft.custom:minecraft.horse_one_cm
bossbar add rider_quest:initiate {"text":"Horse Observation...","color":"white"}
bossbar set rider_quest:initiate color blue
bossbar set rider_quest:initiate max 100
bossbar set rider_quest:initiate value 0
scoreboard objectives add hSpeed dummy
scoreboard objectives add hJump dummy
scoreboard objectives add pSpeed dummy
scoreboard objectives add pJump dummy
scoreboard objectives add hHealth dummy
scoreboard objectives add hLove dummy
scoreboard players set #meter horse_travel 100
scoreboard players set #jump_1 horse_travel 6689
scoreboard players set #jump_2 horse_travel 1743930
scoreboard players set #jump_3 horse_travel 10000
scoreboard players set #jump_4 horse_travel 1000000
scoreboard players set #speed horse_travel 400
tellraw @a [{"text":"Data pack loaded: ","color":"green"},{"text":"A Quest for A Rider (by Mlakuss)","color":"gray"}]