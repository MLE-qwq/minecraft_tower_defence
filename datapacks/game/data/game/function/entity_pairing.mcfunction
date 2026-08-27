scoreboard objectives add _ dummy

$tag @e[nbt={UUID:$(UUID)},limit=1] add target_marker
scoreboard players operation #global _ = @e[tag=target_marker,limit=1] game.data.mob_uuid

execute as @e[tag=display_entity] at @s if score @s game.data.mob_uuid = #global _ if score @e[tag=target_marker,limit=1] game.mechanism.display_damage_on_display_entity matches 1 if score @e[tag=target_marker,limit=1] game.data.health matches 1.. run damage @s 1 out_of_world
scoreboard players set @e[tag=target_marker,limit=1] game.mechanism.display_damage_on_display_entity 0

#teleports display entity to anchor marker
    execute as @e[tag=display_entity] at @s if score @s game.data.mob_uuid = #global _ run tp @s @e[tag=target_marker,limit=1]
#syncs health data between display entity and anchor marker
    execute as @e[tag=display_entity] at @s if score @s game.data.mob_uuid = #global _ run scoreboard players operation @s game.data.health = @e[tag=target_marker,limit=1] game.data.health
    execute as @e[tag=display_entity] at @s if score @s game.data.mob_uuid = #global _ run scoreboard players operation @s game.data.max_health = @e[tag=target_marker,limit=1] game.data.max_health

#adjusts slime display entity size depending on anchor marker, and other attributes
    execute as @e[tag=display_entity] at @s if score @s game.data.mob_uuid = #global _ if score @e[tag=target_marker,tag=slime_behavior,limit=1] game.data.slime_size matches 2 run attribute @s scale base set 2.0
    execute as @e[tag=display_entity] at @s if score @s game.data.mob_uuid = #global _ if score @e[tag=target_marker,tag=slime_behavior,limit=1] game.data.slime_size matches 1 run attribute @s scale base set 1.5
    execute as @e[tag=display_entity] at @s if score @s game.data.mob_uuid = #global _ if score @e[tag=target_marker,tag=slime_behavior,limit=1] game.data.slime_size matches 0 run attribute @s scale base set 1.0

    execute if entity @e[tag=target_marker,tag=slime_behavior,limit=1] as @e[tag=display_entity] at @s run attribute @s max_health base set 10
    execute if entity @e[tag=target_marker,tag=slime_behavior,limit=1] as @e[tag=display_entity] at @s run data merge entity @s {Health:10.0d}

#kills entity display if health zero, even when size 0.. since a new entity display entity is summoned
    execute if entity @e[tag=target_marker,limit=1] as @e[tag=display_entity] at @s if score @s game.data.mob_uuid = #global _ if score @e[tag=target_marker,limit=1] game.data.health matches ..0 run kill @s

#kills entity display if marker reached the end
    execute as @e[tag=display_entity] at @s if score @s game.data.mob_uuid = #global _ if entity @e[tag=target_marker,tag=settlement_selected] run kill @s

#syncs y-position of display entity if the marker has the jumping tag
    execute if entity @e[tag=target_marker,tag=jumping] as @e[tag=display_entity] at @s if score @s game.data.mob_uuid = #global _ store result entity @s Pos[1] double 0.000001 run scoreboard players get @e[tag=target_marker,limit=1,tag=jumping] game.mechanism.jumping.y

tag @e remove target_marker