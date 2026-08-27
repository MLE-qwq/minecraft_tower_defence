#Cactus
    execute as @e[tag=cont,tag=kill,tag=cactus] at @s run playsound block.wool.break block @a ~ ~ ~

#water
    execute as @e[tag=cont,tag=kill,tag=water] at @s run playsound item.bucket.fill block @a ~ ~ ~
    execute as @e[tag=cont,tag=kill,tag=water] at @s run setblock ~ ~ ~ air

#trapdoor
    execute as @e[tag=cont,tag=kill,tag=trapdoor] at @s run playsound block.wood.break block @a ~ ~ ~
    execute as @e[tag=cont,tag=kill,tag=trapdoor,tag=!on_bridge] at @s run clone 15 -2 -15 15 -2 -15 ~ ~-1 ~
    execute as @e[tag=cont,tag=kill,tag=trapdoor,tag=on_bridge] at @s run setblock ~ ~-1 ~ oak_planks

#Iron Bars
    execute as @e[tag=cont,tag=kill,tag=iron_bars] at @s run playsound block.iron.break block @a ~ ~ ~
    execute as @e[tag=cont,tag=kill,tag=iron_bars] at @s run setblock ~ ~ ~ air

#Any dispensers
    execute as @e[tag=cont,tag=disp,tag=kill] at @s run setblock ~ ~-1 ~ air destroy