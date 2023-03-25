#Horse Types
tag @e[type=horse,tag=!horse] add horse
tag @e[type=skeleton_horse,tag=!horse] add horse
tag @e[type=donkey,tag=!horse] add horse
tag @e[type=mule,tag=!horse] add horse
tag @e[type=zombie_horse,tag=!horse] add horse
#Horse Observer
tag @a[nbt={SelectedItem:{id:"minecraft:writable_book",Count:1b}}] add observe_horse
tag @a[nbt={SelectedItem:{id:"minecraft:paper"}}] add observe_horse
execute anchored eyes as @a[tag=observe_horse] at @s positioned ^ ^ ^2 if entity @e[tag=horse,distance=..1.5] run effect give @e[tag=horse,limit=1,sort=nearest] minecraft:glowing 1 0 true
execute anchored eyes as @a[tag=observe_horse,scores={hLove=..33},advancements={rider_quest:knight=true,rider_quest:horse_master=true}] at @s positioned ^ ^ ^2 if entity @e[tag=horse,distance=..1.5] run scoreboard players add @s hLove 1
execute anchored eyes as @a[tag=observe_horse,scores={hLove=..66},advancements={rider_quest:horse_observer=true,rider_quest:horse_tamer=true}] at @s positioned ^ ^ ^2 if entity @e[tag=horse,distance=..1.5] run scoreboard players add @s hLove 1
execute anchored eyes as @a[tag=observe_horse] at @s positioned ^ ^ ^2 if entity @e[tag=horse,distance=..1.5] run scoreboard players add @s hLove 1
bossbar set rider_quest:initiate players @a[tag=observe_horse,scores={hLove=1..100}]
execute store result bossbar rider_quest:initiate value run scoreboard players get @p[scores={hLove=1..100}] hLove
execute anchored eyes as @a[tag=observe_horse,scores={hLove=100..}] at @s positioned ^ ^ ^2 run tag @e[tag=horse,limit=1,sort=nearest] add calc

execute as @e[tag=horse,tag=calc] at @s run function rider_quest:stat_calc

scoreboard players add @e[tag=horse,scores={horse_travel=..0}] horse_travel 1
tag @e[tag=horse,tag=calc] remove calc
scoreboard players set @a[tag=!observe_horse] hLove 0
tag @a remove observe_horse

#Root
advancement grant @a[scores={horse_travel=100..},advancements={rider_quest:root=false}] only rider_quest:root
#Lad Driver
advancement grant @a[scores={horse_travel=20000..},advancements={rider_quest:lad_driver=false}] only rider_quest:lad_driver
advancement grant @a[scores={horse_travel=3000000..},advancements={rider_quest:horse_master={travel_far=false}}] only rider_quest:horse_master travel_far
#Squire
scoreboard players remove @a[scores={hJump=1..}] hJump 1
#Saddler
advancement grant @a[scores={horse_travel=21000..},nbt={RootVehicle:{Entity:{ArmorItem:{id:"minecraft:iron_horse_armor"},SaddleItem:{id:"minecraft:saddle"}}}},advancements={rider_quest:saddler=false}] only rider_quest:saddler
advancement grant @a[scores={horse_travel=21000..},nbt={RootVehicle:{Entity:{ArmorItem:{id:"minecraft:golden_horse_armor"},SaddleItem:{id:"minecraft:saddle"}}}},advancements={rider_quest:saddler=false}] only rider_quest:saddler
advancement grant @a[scores={horse_travel=21000..},nbt={RootVehicle:{Entity:{ArmorItem:{id:"minecraft:diamond_horse_armor"},SaddleItem:{id:"minecraft:saddle"}}}},advancements={rider_quest:saddler=false}] only rider_quest:saddler
advancement grant @a[scores={horse_travel=21000..},nbt={RootVehicle:{Entity:{ArmorItem:{id:"minecraft:diamond_horse_armor"},SaddleItem:{id:"minecraft:saddle"}}}},advancements={rider_quest:horse_master={diamond_armor=false}}] only rider_quest:horse_master diamond_armor
advancement grant @a[scores={horse_travel=30000..},nbt={RootVehicle:{Entity:{ChestedHorse:1b,SaddleItem:{id:"minecraft:saddle"}}}},advancements={rider_quest:saddler=false}] only rider_quest:saddler
#Tamer
tag @e[tag=horse,nbt={Tame:0b},tag=!untamed] add untamed
execute at @e[tag=horse,tag=untamed,nbt={Tame:1b}] run scoreboard players add @p hHealth 1
execute as @e[tag=horse,tag=untamed,nbt={Tame:1b}] store result score @s hLove run data get entity @s Temper
execute as @e[tag=horse,tag=untamed,nbt={Tame:1b},scores={hLove=65..}] run advancement grant @p[advancements={rider_quest:horse_tamer=true}] only rider_quest:true_love
execute as @e[tag=horse,tag=untamed,nbt={Tame:1b},scores={hLove=75..}] run attribute @s minecraft:horse.jump_strength modifier add 7945264-4846-4820-4176-0486123416999 jumpLoveBoost 0.05 add
execute as @e[tag=horse,tag=untamed,nbt={Tame:1b},scores={hLove=85..}] run attribute @s minecraft:generic.max_health modifier add 6994264-4848-4863-4366-0486123456789 healthLoveBoost 6 add
execute as @e[tag=horse,tag=untamed,nbt={Tame:1b},scores={hLove=65..}] run attribute @s minecraft:generic.movement_speed modifier add 7903264-4846-4630-4816-0481654296789 speedLoveBoost 0.015 add
tag @e[tag=untamed,nbt={Tame:1b}] remove untamed
advancement grant @a[scores={hHealth=1},advancements={rider_quest:horse_tamer={1=false}}] only rider_quest:horse_tamer 1
advancement grant @a[scores={hHealth=2},advancements={rider_quest:horse_tamer={2=false}}] only rider_quest:horse_tamer 2
advancement grant @a[scores={hHealth=3},advancements={rider_quest:horse_tamer={3=false}}] only rider_quest:horse_tamer 3
advancement grant @a[scores={hHealth=4},advancements={rider_quest:horse_tamer={4=false}}] only rider_quest:horse_tamer 4
tellraw @a[scores={hHealth=5..},advancements={rider_quest:horse_tamer=false}] {"text":"Rider Quest: You can now record horses' statistics!","color":"gold"}
tellraw @a[scores={hHealth=5..},advancements={rider_quest:horse_tamer=false}] {"text":"Take a piece of paper or a book and quill in your hand, then look at a horse.","color":"dark_gray"}
advancement grant @a[scores={hHealth=5..},advancements={rider_quest:horse_tamer=false}] only rider_quest:horse_tamer
advancement grant @a[scores={hHealth=10..},advancements={rider_quest:horse_master={tame_10=false}}] only rider_quest:horse_master tame_10