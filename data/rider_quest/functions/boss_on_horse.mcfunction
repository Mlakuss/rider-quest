tag @s[nbt={RootVehicle:{Entity:{id:"minecraft:horse"}}}] add ride_horse
tag @s[nbt={RootVehicle:{Entity:{id:"minecraft:donkey"}}}] add ride_horse
tag @s[nbt={RootVehicle:{Entity:{id:"minecraft:mule"}}}] add ride_horse
tag @s[nbt={RootVehicle:{Entity:{id:"minecraft:skeleton_horse"}}}] add ride_horse
advancement grant @s[tag=ride_horse] only rider_quest:squire
advancement grant @s[tag=ride_horse] only rider_quest:knight
advancement revoke @s[advancements={rider_quest:knight=false}] only rider_quest:kill_boss
tag @s[tag=ride_horse] remove ride_horse