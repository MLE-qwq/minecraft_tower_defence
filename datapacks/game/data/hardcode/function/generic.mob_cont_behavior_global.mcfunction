#preventing water contraption from flowing everywhere
    execute as @e[tag=water] at @s positioned ~1 ~ ~ if block ~ ~ ~ air run setblock ~ ~ ~ structure_void
    execute as @e[tag=water] at @s positioned ~-1 ~ ~ if block ~ ~ ~ air run setblock ~ ~ ~ structure_void
    execute as @e[tag=water] at @s positioned ~ ~ ~1 if block ~ ~ ~ air run setblock ~ ~ ~ structure_void
    execute as @e[tag=water] at @s positioned ~ ~ ~-1 if block ~ ~ ~ air run setblock ~ ~ ~ structure_void

    execute as @e[tag=water] at @s positioned ~1 ~ ~ if block ~ ~ ~ #replaceable unless block ~ ~ ~ water run setblock ~ ~ ~ structure_void
    execute as @e[tag=water] at @s positioned ~-1 ~ ~ if block ~ ~ ~ #replaceable unless block ~ ~ ~ water run setblock ~ ~ ~ structure_void
    execute as @e[tag=water] at @s positioned ~ ~ ~1 if block ~ ~ ~ #replaceable unless block ~ ~ ~ water run setblock ~ ~ ~ structure_void
    execute as @e[tag=water] at @s positioned ~ ~ ~-1 if block ~ ~ ~ #replaceable unless block ~ ~ ~ water run setblock ~ ~ ~ structure_void

    execute as @e[tag=water] at @s positioned ~1 ~ ~ if block ~ ~ ~ cobweb unless block ~ ~ ~ water run setblock ~ ~ ~ structure_void
    execute as @e[tag=water] at @s positioned ~-1 ~ ~ if block ~ ~ ~ cobweb unless block ~ ~ ~ water run setblock ~ ~ ~ structure_void
    execute as @e[tag=water] at @s positioned ~ ~ ~1 if block ~ ~ ~ cobweb unless block ~ ~ ~ water run setblock ~ ~ ~ structure_void
    execute as @e[tag=water] at @s positioned ~ ~ ~-1 if block ~ ~ ~ cobweb unless block ~ ~ ~ water run setblock ~ ~ ~ structure_void

#trapdoors opening and closing up depending on whether there are mobs nearby
    execute as @e[tag=cont,tag=trapdoor,tag=north] at @s unless entity @e[tag=mob,distance=..1] if block ~ ~-1 ~ oak_trapdoor[open=true] run playsound block.wooden_trapdoor.close block @a ~ ~ ~
    execute as @e[tag=cont,tag=trapdoor,tag=north] at @s unless entity @e[tag=mob,distance=..1] run setblock ~ ~-1 ~ oak_trapdoor[half=top,facing=north,open=false]
    execute as @e[tag=cont,tag=trapdoor,tag=west] at @s unless entity @e[tag=mob,distance=..1] run setblock ~ ~-1 ~ oak_trapdoor[half=top,facing=west,open=false]
    execute as @e[tag=cont,tag=trapdoor,tag=east] at @s unless entity @e[tag=mob,distance=..1] run setblock ~ ~-1 ~ oak_trapdoor[half=top,facing=east,open=false]
    execute as @e[tag=cont,tag=trapdoor,tag=south] at @s unless entity @e[tag=mob,distance=..1] run setblock ~ ~-1 ~ oak_trapdoor[half=top,facing=south,open=false]
    
    execute as @e[tag=cont,tag=trapdoor,tag=north] at @s if score @s game.data.cont.mobs_trapped >= @s game.data.cont.capacity if block ~ ~-1 ~ oak_trapdoor[open=true] run playsound block.wooden_trapdoor.close block @a ~ ~ ~
    execute as @e[tag=cont,tag=trapdoor,tag=north] at @s if score @s game.data.cont.mobs_trapped >= @s game.data.cont.capacity run setblock ~ ~-1 ~ oak_trapdoor[half=top,facing=north,open=false]
    execute as @e[tag=cont,tag=trapdoor,tag=west] at @s if score @s game.data.cont.mobs_trapped >= @s game.data.cont.capacity run setblock ~ ~-1 ~ oak_trapdoor[half=top,facing=west,open=false]
    execute as @e[tag=cont,tag=trapdoor,tag=east] at @s if score @s game.data.cont.mobs_trapped >= @s game.data.cont.capacity run setblock ~ ~-1 ~ oak_trapdoor[half=top,facing=east,open=false]
    execute as @e[tag=cont,tag=trapdoor,tag=south] at @s if score @s game.data.cont.mobs_trapped >= @s game.data.cont.capacity run setblock ~ ~-1 ~ oak_trapdoor[half=top,facing=south,open=false]

    execute as @e[tag=cont,tag=trapdoor,tag=north] at @s if score @s game.data.cont.mobs_trapped < @s game.data.cont.capacity if entity @e[tag=mob,distance=..1] if block ~ ~-1 ~ oak_trapdoor[open=false] run playsound block.wooden_trapdoor.open block @a ~ ~ ~
    execute as @e[tag=cont,tag=trapdoor,tag=north] at @s if score @s game.data.cont.mobs_trapped < @s game.data.cont.capacity if entity @e[tag=mob,distance=..1] run setblock ~ ~-1 ~ oak_trapdoor[half=top,facing=north,open=true]
    execute as @e[tag=cont,tag=trapdoor,tag=west] at @s if score @s game.data.cont.mobs_trapped < @s game.data.cont.capacity if entity @e[tag=mob,distance=..1] run setblock ~ ~-1 ~ oak_trapdoor[half=top,facing=west,open=true]
    execute as @e[tag=cont,tag=trapdoor,tag=east] at @s if score @s game.data.cont.mobs_trapped < @s game.data.cont.capacity if entity @e[tag=mob,distance=..1] run setblock ~ ~-1 ~ oak_trapdoor[half=top,facing=east,open=true]
    execute as @e[tag=cont,tag=trapdoor,tag=south] at @s if score @s game.data.cont.mobs_trapped < @s game.data.cont.capacity if entity @e[tag=mob,distance=..1] run setblock ~ ~-1 ~ oak_trapdoor[half=top,facing=south,open=true]

#iron bars
    execute as @e[tag=cont,tag=iron_bars,tag=z,tag=!reversed] at @s run setblock ~ ~ ~ iron_bars[north=false,south=false,east=true,west=true]
    execute as @e[tag=cont,tag=iron_bars,tag=x,tag=reversed] at @s run setblock ~ ~ ~ iron_bars[north=false,south=false,east=true,west=true]
    execute as @e[tag=cont,tag=iron_bars,tag=x,tag=!reversed] at @s run setblock ~ ~ ~ iron_bars[north=true,south=true,east=false,west=false]
    execute as @e[tag=cont,tag=iron_bars,tag=z,tag=reversed] at @s run setblock ~ ~ ~ iron_bars[north=true,south=true,east=false,west=false]