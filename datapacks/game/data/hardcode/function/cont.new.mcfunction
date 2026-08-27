execute as @e[type=item,nbt={Age:0s}] at @s run tag @s add forbidden

#Cactus
    execute as @e[type=item,tag=!forbidden] at @s if items entity @s contents *[custom_data~{id:"cont_cactus"}] unless entity @e[tag=cont,distance=..0.5] positioned ~ ~-1 ~ if entity @e[tag=path_block,distance=..0.5,tag=!bridged] run tag @s add placed
    
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_cactus"}] run particle poof ~ ~ ~ 0 0 0 0.1 50
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_cactus"}] run playsound minecraft:block.wool.place block @a ~ ~ ~
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_cactus"}] at @s as @n[tag=path_block,tag=!bridged] at @s run summon minecraft:falling_block ~ ~1 ~ {NoGravity:1b,BlockState:{id:"cactus",Name:"cactus"},Invulnerable:1b,Time:-2147483648,Tags:["cactus","cont"]}

    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=cactus] at @s run scoreboard players set @s game.data.health 15
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=cactus] at @s run scoreboard players set @s game.data.max_health 15
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=cactus] at @s run scoreboard players set @s game.data.cont.damage_cd 0

    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_cactus"}] run kill @s

#Egg Dispenser
    #checks if at least one of the adjacent 4 blocks are path blocks and if so then legitimate
        execute as @e[type=item,tag=!forbidden] at @s if items entity @s contents *[custom_data~{id:"cont_egg_disp"}] unless block ~ ~-1 ~ air positioned ~1 ~-1 ~ if entity @e[tag=path_block,distance=..0.5] run tag @s add placed
        execute as @e[type=item,tag=!forbidden] at @s if items entity @s contents *[custom_data~{id:"cont_egg_disp"}] unless block ~ ~-1 ~ air positioned ~-1 ~-1 ~ if entity @e[tag=path_block,distance=..0.5] run tag @s add placed
        execute as @e[type=item,tag=!forbidden] at @s if items entity @s contents *[custom_data~{id:"cont_egg_disp"}] unless block ~ ~-1 ~ air positioned ~ ~-1 ~1 if entity @e[tag=path_block,distance=..0.5] run tag @s add placed
        execute as @e[type=item,tag=!forbidden] at @s if items entity @s contents *[custom_data~{id:"cont_egg_disp"}] unless block ~ ~-1 ~ air positioned ~ ~-1 ~-1 if entity @e[tag=path_block,distance=..0.5] run tag @s add placed
    #and if the current block is a path block then take the legitimate judgement back
        execute as @e[type=item,tag=!forbidden] at @s if items entity @s contents *[custom_data~{id:"cont_egg_disp"}] positioned ~ ~-1 ~ if entity @e[tag=path_block,distance=..0.5] run tag @s remove placed
    
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_egg_disp"}] run particle poof ~ ~ ~ 0 0 0 0.1 50
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_egg_disp"}] run playsound minecraft:block.stone.place block @a ~ ~ ~
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_egg_disp"}] at @s run setblock ~ ~ ~ dispenser
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_egg_disp"}] at @s run summon minecraft:glow_item_frame ~ ~1 ~ {Fixed:1b, Item:{count:1, id:"minecraft:egg"},Invisible:1b,Facing:1b,Invulnerable:1b,Tags:["egg_disp","disp","cont"]}

    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=egg_disp] at @s run scoreboard players set @s game.data.health 150
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=egg_disp] at @s run scoreboard players set @s game.data.max_health 150
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=egg_disp] at @s run scoreboard players set @s game.data.cont.damage_cd 0

    
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=egg_disp] at @s run scoreboard players set @s game.data.disp_cont.damage 3
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=egg_disp] at @s run scoreboard players set @s game.data.disp_cont.range 1
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=egg_disp] at @s run scoreboard players set @s game.data.disp_cont.fire_rate 40

    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_egg_disp"}] run kill @s

#Water
    execute as @e[type=item,tag=!forbidden] at @s if items entity @s contents *[custom_data~{id:"cont_water"}] unless entity @e[tag=cont,distance=..0.5] positioned ~ ~-1 ~ if entity @e[tag=path_block,distance=..0.5,tag=!bridged] run tag @s add placed
    
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_water"}] run particle poof ~ ~ ~ 0 0 0 0.1 50
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_water"}] run playsound item.bucket.empty block @a ~ ~ ~
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_water"}] at @s as @n[tag=path_block,tag=!bridged] at @s run setblock ~ ~1 ~ water

    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_water"}] at @s as @n[tag=path_block,tag=!bridged] at @s run summon minecraft:marker ~ ~1 ~ {Tags:["water","cont"],CustomName:"Water"}

    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=water] at @s run scoreboard players set @s game.data.health 80
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=water] at @s run scoreboard players set @s game.data.max_health 80
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=water] at @s run scoreboard players set @s game.data.cont.viscosity 1

    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_water"}] run kill @s

#Trapdoor
    execute as @e[type=item,tag=!forbidden] at @s if items entity @s contents *[custom_data~{id:"cont_trapdoor"}] unless entity @e[tag=cont,distance=..0.5] positioned ~ ~-1 ~ if entity @e[tag=path_block,distance=..0.5] run tag @s add placed
    
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_trapdoor"}] run particle poof ~ ~ ~ 0 0 0 0.1 50
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_trapdoor"}] run playsound block.wood.place block @a ~ ~ ~

    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_trapdoor"}] at @s as @n[tag=path_block] at @s if entity @s[y_rotation=-45..45] run summon minecraft:marker ~ ~1 ~ {Tags:["trapdoor","cont","south"],CustomName:"Trapdoor"}
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_trapdoor"}] at @s as @n[tag=path_block] at @s if entity @s[y_rotation=45..135] run summon minecraft:marker ~ ~1 ~ {Tags:["trapdoor","cont","west"],CustomName:"Trapdoor"}
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_trapdoor"}] at @s as @n[tag=path_block] at @s if entity @s[y_rotation=135..-135] run summon minecraft:marker ~ ~1 ~ {Tags:["trapdoor","cont","north"],CustomName:"Trapdoor"}
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_trapdoor"}] at @s as @n[tag=path_block] at @s if entity @s[y_rotation=-135..-45] run summon minecraft:marker ~ ~1 ~ {Tags:["trapdoor","cont","east"],CustomName:"Trapdoor"}

    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @e[tag=cont,tag=trapdoor,tag=north] at @s run setblock ~ ~-1 ~ oak_trapdoor[half=top,facing=north,open=false]
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @e[tag=cont,tag=trapdoor,tag=west] at @s run setblock ~ ~-1 ~ oak_trapdoor[half=top,facing=west,open=false]
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @e[tag=cont,tag=trapdoor,tag=east] at @s run setblock ~ ~-1 ~ oak_trapdoor[half=top,facing=east,open=false]
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @e[tag=cont,tag=trapdoor,tag=south] at @s run setblock ~ ~-1 ~ oak_trapdoor[half=top,facing=south,open=false]

    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @e[tag=cont,tag=trapdoor] at @s as @n[tag=path_block] if entity @s[tag=bridged] run tag @n[tag=cont,tag=trapdoor] add on_bridge

    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=trapdoor] at @s run scoreboard players set @s game.data.health 80
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=trapdoor] at @s run scoreboard players set @s game.data.max_health 80
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=trapdoor,tag=!on_bridge] at @s run scoreboard players set @s game.data.cont.capacity 2
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=trapdoor,tag=on_bridge] at @s run scoreboard players set @s game.data.cont.capacity 2147483647

    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=trapdoor] at @s run scoreboard players set @s game.data.cont.mobs_trapped 0

    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_trapdoor"}] run kill @s

#Arrow Dispenser
    #checks if at least one of the adjacent 4 blocks are path blocks and if so then legitimate
        execute as @e[type=item,tag=!forbidden] at @s if items entity @s contents *[custom_data~{id:"cont_arrow_disp"}] unless block ~ ~-1 ~ air positioned ~1 ~-1 ~ if entity @e[tag=path_block,distance=..0.5] run tag @s add placed
        execute as @e[type=item,tag=!forbidden] at @s if items entity @s contents *[custom_data~{id:"cont_arrow_disp"}] unless block ~ ~-1 ~ air positioned ~-1 ~-1 ~ if entity @e[tag=path_block,distance=..0.5] run tag @s add placed
        execute as @e[type=item,tag=!forbidden] at @s if items entity @s contents *[custom_data~{id:"cont_arrow_disp"}] unless block ~ ~-1 ~ air positioned ~ ~-1 ~1 if entity @e[tag=path_block,distance=..0.5] run tag @s add placed
        execute as @e[type=item,tag=!forbidden] at @s if items entity @s contents *[custom_data~{id:"cont_arrow_disp"}] unless block ~ ~-1 ~ air positioned ~ ~-1 ~-1 if entity @e[tag=path_block,distance=..0.5] run tag @s add placed
    #and if the current block is a path block then take the legitimate judgement back
        execute as @e[type=item,tag=!forbidden] at @s if items entity @s contents *[custom_data~{id:"cont_arrow_disp"}] positioned ~ ~-1 ~ if entity @e[tag=path_block,distance=..0.5] run tag @s remove placed
    
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_arrow_disp"}] run particle poof ~ ~ ~ 0 0 0 0.1 50
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_arrow_disp"}] run playsound minecraft:block.stone.place block @a ~ ~ ~
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_arrow_disp"}] at @s run setblock ~ ~ ~ dispenser
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_arrow_disp"}] at @s run summon minecraft:glow_item_frame ~ ~1 ~ {Fixed:1b, Item:{count:1, id:"minecraft:arrow"},Invisible:1b,Facing:1b,Invulnerable:1b,Tags:["arrow_disp","disp","cont"]}

    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=arrow_disp] at @s run scoreboard players set @s game.data.health 150
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=arrow_disp] at @s run scoreboard players set @s game.data.max_health 150
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=arrow_disp] at @s run scoreboard players set @s game.data.cont.damage_cd 0

    
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=arrow_disp] at @s run scoreboard players set @s game.data.disp_cont.damage 5
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=arrow_disp] at @s run scoreboard players set @s game.data.disp_cont.range 3
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=arrow_disp] at @s run scoreboard players set @s game.data.disp_cont.fire_rate 40

    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_arrow_disp"}] run kill @s

#Iron Bars
    execute as @e[type=item,tag=!forbidden] at @s if items entity @s contents *[custom_data~{id:"cont_iron_bars"}] unless entity @e[tag=cont,distance=..0.5] positioned ~ ~-1 ~ if entity @e[tag=path_block,distance=..0.5] run tag @s add placed
    
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_iron_bars"}] run particle poof ~ ~ ~ 0 0 0 0.1 50
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_iron_bars"}] run playsound block.iron.place block @a ~ ~ ~

    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_iron_bars"}] at @s as @n[tag=path_block] at @s if entity @s[y_rotation=-45..45] run summon minecraft:marker ~ ~1 ~ {Tags:["iron_bars","cont","+z","z","newbie"],CustomName:"Iron Bars"}
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_iron_bars"}] at @s as @n[tag=path_block] at @s if entity @s[y_rotation=45..135] run summon minecraft:marker ~ ~1 ~ {Tags:["iron_bars","cont","-x","x","newbie"],CustomName:"Iron Bars"}
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_iron_bars"}] at @s as @n[tag=path_block] at @s if entity @s[y_rotation=135..-135] run summon minecraft:marker ~ ~1 ~ {Tags:["iron_bars","cont","-z","z","newbie"],CustomName:"Iron Bars"}
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_iron_bars"}] at @s as @n[tag=path_block] at @s if entity @s[y_rotation=-135..-45] run summon minecraft:marker ~ ~1 ~ {Tags:["iron_bars","cont","+z","x","newbie"],CustomName:"Iron Bars"}

    execute as @e[tag=cont,tag=iron_bars,tag=newbie,tag=+z] at @s positioned ~ ~-1 ~-1 unless entity @e[tag=path_block,distance=..0.5] run tag @s add reversed
    execute as @e[tag=cont,tag=iron_bars,tag=newbie,tag=-z] at @s positioned ~ ~-1 ~1 unless entity @e[tag=path_block,distance=..0.5] run tag @s add reversed
    execute as @e[tag=cont,tag=iron_bars,tag=newbie,tag=+x] at @s positioned ~-1 ~-1 ~ unless entity @e[tag=path_block,distance=..0.5] run tag @s add reversed
    execute as @e[tag=cont,tag=iron_bars,tag=newbie,tag=-x] at @s positioned ~1 ~-1 ~ unless entity @e[tag=path_block,distance=..0.5] run tag @s add reversed

    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=iron_bars] at @s run scoreboard players set @s game.data.health 300
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=iron_bars] at @s run scoreboard players set @s game.data.max_health 300

    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_iron_bars"}] run kill @s

    tag @e[tag=cont,tag=iron_bars,tag=newbie] remove newbie

#Slime Dispenser
    #checks if at least one of the adjacent 4 blocks are path blocks and if so then legitimate
        execute as @e[type=item,tag=!forbidden] at @s if items entity @s contents *[custom_data~{id:"cont_slime_disp"}] unless block ~ ~-1 ~ air positioned ~1 ~-1 ~ if entity @e[tag=path_block,distance=..0.5] run tag @s add placed
        execute as @e[type=item,tag=!forbidden] at @s if items entity @s contents *[custom_data~{id:"cont_slime_disp"}] unless block ~ ~-1 ~ air positioned ~-1 ~-1 ~ if entity @e[tag=path_block,distance=..0.5] run tag @s add placed
        execute as @e[type=item,tag=!forbidden] at @s if items entity @s contents *[custom_data~{id:"cont_slime_disp"}] unless block ~ ~-1 ~ air positioned ~ ~-1 ~1 if entity @e[tag=path_block,distance=..0.5] run tag @s add placed
        execute as @e[type=item,tag=!forbidden] at @s if items entity @s contents *[custom_data~{id:"cont_slime_disp"}] unless block ~ ~-1 ~ air positioned ~ ~-1 ~-1 if entity @e[tag=path_block,distance=..0.5] run tag @s add placed
    #and if the current block is a path block then take the legitimate judgement back
        execute as @e[type=item,tag=!forbidden] at @s if items entity @s contents *[custom_data~{id:"cont_slime_disp"}] positioned ~ ~-1 ~ if entity @e[tag=path_block,distance=..0.5] run tag @s remove placed
    
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_slime_disp"}] run particle poof ~ ~ ~ 0 0 0 0.1 50
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_slime_disp"}] run playsound minecraft:block.stone.place block @a ~ ~ ~
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_slime_disp"}] at @s run setblock ~ ~ ~ dispenser
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_slime_disp"}] at @s run summon minecraft:glow_item_frame ~ ~1 ~ {Fixed:1b, Item:{count:1, id:"minecraft:slime_ball"},Invisible:1b,Facing:1b,Invulnerable:1b,Tags:["slime_disp","disp","cont"]}

    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=slime_disp] at @s run scoreboard players set @s game.data.health 150
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=slime_disp] at @s run scoreboard players set @s game.data.max_health 150
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=slime_disp] at @s run scoreboard players set @s game.data.cont.damage_cd 0

    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=slime_disp] at @s run scoreboard players set @s game.data.disp_cont.duration 20
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=slime_disp] at @s run scoreboard players set @s game.data.disp_cont.range 3
    execute as @e[type=item,tag=!forbidden,tag=placed] at @s as @n[tag=cont,tag=slime_disp] at @s run scoreboard players set @s game.data.disp_cont.fire_rate 40

    execute as @e[type=item,tag=!forbidden,tag=placed] at @s if items entity @s contents *[custom_data~{id:"cont_slime_disp"}] run kill @s


tag @e[tag=forbidden] remove forbidden