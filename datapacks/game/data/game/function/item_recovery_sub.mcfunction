#this function belongs to item_recovery_main

$execute as @a[tag=item_recovery_target_player] at @s run summon item ~ ~ ~ {Item:{id:"$(id)",count:$(count),components:$(components)}}