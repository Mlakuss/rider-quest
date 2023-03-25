tag @s[nbt={RootVehicle:{Entity:{id:"minecraft:horse"}}}] add ride_horse
tag @s[nbt={RootVehicle:{Entity:{id:"minecraft:donkey"}}}] add ride_horse
tag @s[nbt={RootVehicle:{Entity:{id:"minecraft:mule"}}}] add ride_horse
tag @s[nbt={RootVehicle:{Entity:{id:"minecraft:skeleton_horse"}}}] add ride_horse
scoreboard players add @s[tag=ride_horse] hJump 200
advancement grant @s[scores={hJump=400..}] only rider_quest:squire
advancement grant @a[scores={hJump=400..}] only rider_quest:horse_master squire
advancement revoke @s[advancements={rider_quest:squire=false}] only rider_quest:kill_hostile
tag @s[tag=ride_horse] remove ride_horse