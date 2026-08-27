execute if score #global game.mechanism.active_ticks matches 10.. if score #global game.level matches 4 as @a[x=-16,y=0,z=-16,dx=32,dy=10,dz=32,nbt={OnGround:1b}] at @s run damage @s 114514 fall
execute if score #global game.mechanism.active_ticks matches 10.. if score #global game.level matches 8 as @a[x=-16,y=0,z=-16,dx=32,dy=8,dz=32,nbt={OnGround:1b}] at @s run damage @s 114514 fall
execute if score #global game.mechanism.active_ticks matches 10.. as @a at @s unless entity @s[nbt={Fire:-20s}] run damage @s 100000 lava

#gives the player(s) a green overlay on their health hearts@@
    execute if score #global game.data.poisoning matches 2 run tellraw @a "\u00a72You have been \u00a7apoisoned\u00a72! From now on, you will lose\u00a7c 1\u2665 \u00a72whenever a wave starts. Note that the poison damage is \u00a74fatal\u00a72."
    execute if score #global game.data.poisoning matches 2 run scoreboard players set #global game.data.poisoning 1
    effect clear @a poison
    execute if score #global game.data.poisoning matches 1 run effect give @a poison 1 0 true