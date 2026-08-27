#this function belongs to path_construction, used for summoning a mannequin with the skin of the current player

$execute as @e[tag=path_ending] at @s run summon minecraft:mannequin ~ ~-1 ~ {profile:{id:$(UUID)},Tags:["npc"],Invulnerable:1b}
effect give @e[tag=npc] resistance infinite 255 true
effect give @e[tag=npc] regeneration infinite 255 true