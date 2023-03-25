execute as @s store result score @s pJump run data get entity @s Attributes[0].Base 1000
execute as @s store result score @s hHealth run data get entity @s Health
execute as @s store result score @s hSpeed run attribute @s minecraft:generic.movement_speed get 10
execute as @s store result score @s pSpeed run attribute @s minecraft:generic.movement_speed get 1000
execute as @s store result score @s hLove run data get entity @s Temper
execute as @s run scoreboard players operation @s hSpeed *= #speed horse_travel
execute as @s run scoreboard players operation @s pSpeed *= #speed horse_travel
execute as @s run scoreboard players operation @s pSpeed /= #meter horse_travel
execute as @s run scoreboard players operation @s pSpeed -= @s hSpeed
execute as @s run scoreboard players operation @s hSpeed /= #meter horse_travel
execute as @s run scoreboard players operation @s pJump *= #jump_1 horse_travel
execute as @s run scoreboard players operation @s pJump -= #jump_2 horse_travel
execute as @s run scoreboard players operation @s hJump = @s pJump
execute as @s run scoreboard players operation @s pJump /= #jump_3 horse_travel
execute as @s run scoreboard players operation @s hJump /= #jump_4 horse_travel
execute as @s run scoreboard players operation @s hJump *= #meter horse_travel
execute as @s run scoreboard players operation @s pJump -= @s hJump
execute as @s run scoreboard players operation @s hJump /= #meter horse_travel

scoreboard players set @s horse_travel -600
execute at @s run item replace entity @p[nbt={SelectedItem:{id:"minecraft:writable_book",Count:1b}},scores={hLove=100..}] weapon.mainhand with minecraft:written_book{pages:["[{\"selector\":\"@e[tag=horse,limit=1,sort=nearest,scores={horse_travel=..0}] \"},{\"text\":\"'s Statistics\\n==============\\n\\nHealth: \"},{\"color\":\"light_purple\",\"score\":{\"name\":\"@e[tag=horse,limit=1,sort=nearest,scores={horse_travel=..0}]\",\"objective\":\"hHealth\"}},{\"text\":\"\\nSpeed: \"},{\"color\":\"dark_aqua\",\"score\":{\"name\":\"@e[tag=horse,limit=1,sort=nearest,scores={horse_travel=..0}]\",\"objective\":\"hSpeed\"}},{\"color\":\"dark_aqua\",\"text\":\".\"},{\"color\":\"dark_aqua\",\"score\":{\"name\":\"@e[tag=horse,limit=1,sort=nearest,scores={horse_travel=..0}]\",\"objective\":\"pSpeed\"}},{\"text\":\" m/s\\n\",\"color\":\"black\"},{\"text\":\"Jump: \"},{\"color\":\"dark_green\",\"score\":{\"name\":\"@e[tag=horse,limit=1,sort=nearest,scores={horse_travel=..0}]\",\"objective\":\"hJump\"}},{\"color\":\"dark_green\",\"text\":\".\"},{\"color\":\"dark_green\",\"score\":{\"name\":\"@e[tag=horse,limit=1,sort=nearest,scores={horse_travel=..0}]\",\"objective\":\"pJump\"}},{\"text\":\" blocks\\nLove: \",\"color\":\"black\"},{\"color\":\"red\",\"score\":{\"name\":\"@e[tag=horse,limit=1,sort=nearest,scores={horse_travel=..0}]\",\"objective\":\"hLove\"}}]"],title:"Horse's Statistics",author:""}
execute at @s run advancement grant @p[tag=observe_horse,scores={hLove=100..},advancements={rider_quest:horse_observer=true,rider_quest:horse_master={observe=false}}] only rider_quest:horse_master observe
execute at @s run advancement grant @p[tag=observe_horse,scores={hLove=100..},advancements={rider_quest:horse_observer=false,rider_quest:horse_tamer=true}] only rider_quest:horse_observer
execute at @s run tellraw @p[nbt={SelectedItem:{id:"minecraft:paper"}},scores={hLove=100..}] [{"text":">> "},{"selector":"@e[tag=horse,limit=1,sort=nearest,scores={horse_travel=..0}]","color":"gold"},{"color":"white","text":"'s Statistics\n===============\nHealth: "},{"score":{"name":"@e[tag=horse,limit=1,sort=nearest,scores={horse_travel=..0}]","objective":"hHealth"},"color":"red"},{"color":"white","text":"\nSpeed: "},{"score":{"name":"@e[tag=horse,limit=1,sort=nearest,scores={horse_travel=..0}]","objective":"hSpeed"},"color":"aqua"},{"color":"aqua","text":"."},{"color":"aqua","score":{"name":"@e[tag=horse,limit=1,sort=nearest,scores={horse_travel=..0}]","objective":"pSpeed"}},{"color":"white","text":" m/s\nJump: "},{"color":"green","score":{"name":"@e[tag=horse,limit=1,sort=nearest,scores={horse_travel=..0}]","objective":"hJump"}},{"color":"green","text":"."},{"color":"green","score":{"name":"@e[tag=horse,limit=1,sort=nearest,scores={horse_travel=..0}]","objective":"pJump"}},{"text":" blocks\n","color":"white"}]
execute at @s run clear @p[nbt={SelectedItem:{id:"minecraft:paper"}},scores={hLove=100..}] minecraft:paper 1
execute at @s run scoreboard players set @p[scores={hLove=100..}] hLove -20