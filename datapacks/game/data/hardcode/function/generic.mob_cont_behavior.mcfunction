tag @e[tag=mob] remove obstructed
execute as @e[tag=cont] at @s if score @s game.data.cont.damage_cd matches 1.. run scoreboard players remove @s game.data.cont.damage_cd 1

#contraptions
    #Cactus - obstructs and damages mobs
        execute as @e[tag=cont,tag=cactus] at @s run tag @e[tag=mob,distance=..0.5] add obstructed
        execute as @e[tag=cont,tag=cactus] at @s if score @s game.data.cont.damage_cd matches ..0 if entity @e[tag=mob,distance=..0.5] run scoreboard players remove @n[tag=mob] game.data.health 10
        execute as @e[tag=cont,tag=cactus] at @s if score @s game.data.cont.damage_cd matches ..0 if entity @e[tag=mob,distance=..0.5] run scoreboard players remove @s game.data.health 10
        
        #the /damage command is for visual effects only. the actual health is stored in the scoreboard
        execute as @e[tag=cont,tag=cactus] at @s if score @s game.data.cont.damage_cd matches ..0 if entity @e[tag=mob,distance=..0.5] if score @n[tag=mob] game.data.health matches 1.. run damage @n[tag=mob] 1 out_of_world

        execute as @e[tag=cont,tag=cactus] at @s if score @s game.data.cont.damage_cd matches ..0 if entity @e[tag=mob,distance=..0.5] run scoreboard players set @s game.data.cont.damage_cd 10

    #Egg Dispenser - fires eggs in all 4 directions
        #summons eggs in all 4 directions
            execute as @e[tag=cont,tag=egg_disp] at @s if score @s game.mechanism.disp_cont.fire_cd >= @s game.data.disp_cont.fire_rate run summon minecraft:item_display ~0.500001 ~-0.53125 ~ {Tags:["newbie","projectile","+x"],item:{id:"egg",count:1},billboard:"center",transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]}}
            execute as @e[tag=cont,tag=egg_disp] at @s if score @s game.mechanism.disp_cont.fire_cd >= @s game.data.disp_cont.fire_rate run summon minecraft:item_display ~-0.500001 ~-0.53125 ~ {Tags:["newbie","projectile","-x"],item:{id:"egg",count:1},billboard:"center",transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]}}
            execute as @e[tag=cont,tag=egg_disp] at @s if score @s game.mechanism.disp_cont.fire_cd >= @s game.data.disp_cont.fire_rate run summon minecraft:item_display ~ ~-0.53125 ~0.500001 {Tags:["newbie","projectile","+z"],item:{id:"egg",count:1},billboard:"center",transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]}}
            execute as @e[tag=cont,tag=egg_disp] at @s if score @s game.mechanism.disp_cont.fire_cd >= @s game.data.disp_cont.fire_rate run summon minecraft:item_display ~ ~-0.53125 ~-0.500001 {Tags:["newbie","projectile","-z"],item:{id:"egg",count:1},billboard:"center",transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]}}
        #sound effect
            execute as @e[tag=cont,tag=egg_disp] at @s if score @s game.mechanism.disp_cont.fire_cd >= @s game.data.disp_cont.fire_rate run playsound entity.egg.throw block @a ~ ~-0.53125 ~
        #transfers damage & range info to the projectile
            execute as @e[tag=cont,tag=egg_disp] at @s if score @s game.mechanism.disp_cont.fire_cd >= @s game.data.disp_cont.fire_rate store result score @e[tag=projectile,tag=newbie,sort=nearest,limit=4] game.data.disp_cont.damage run scoreboard players get @s game.data.disp_cont.damage
            execute as @e[tag=cont,tag=egg_disp] at @s if score @s game.mechanism.disp_cont.fire_cd >= @s game.data.disp_cont.fire_rate store result score @e[tag=projectile,tag=newbie,sort=nearest,limit=4] game.data.disp_cont.range run scoreboard players get @s game.data.disp_cont.range
        #calculates initial sum of x and z coords
            scoreboard objectives add _ dummy
            execute as @e[tag=projectile,tag=newbie] at @s store result score @s game.mechanism.projectile.init_xz run data get entity @s Pos[0] 1
            execute as @e[tag=projectile,tag=newbie] at @s store result score @s _ run data get entity @s Pos[2] 1
            execute as @e[tag=projectile,tag=newbie] at @s run scoreboard players operation @s game.mechanism.projectile.init_xz += @s _
        tag @e[tag=projectile,tag=newbie] remove newbie
        
        execute as @e[tag=cont,tag=egg_disp] at @s if score @s game.mechanism.disp_cont.fire_cd >= @s game.data.disp_cont.fire_rate run scoreboard players set @s game.mechanism.disp_cont.fire_cd 0
        execute as @e[tag=cont,tag=egg_disp] at @s run scoreboard players add @s game.mechanism.disp_cont.fire_cd 1
    
    #Arrow Dispenser - fires arrows in all 4 directions
        #summons arrows in all 4 directions
            execute as @e[tag=cont,tag=arrow_disp] at @s if score @s game.mechanism.disp_cont.fire_cd >= @s game.data.disp_cont.fire_rate run summon minecraft:item_display ~0.500001 ~-0.53125 ~ {Tags:["newbie","projectile","+x"],item:{id:"arrow",count:1},billboard:"fixed",transformation:{left_rotation:[0.2705981f,0.6532815f,-0.6532815f,0.2705981f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]}}
            execute as @e[tag=cont,tag=arrow_disp] at @s if score @s game.mechanism.disp_cont.fire_cd >= @s game.data.disp_cont.fire_rate run summon minecraft:item_display ~-0.500001 ~-0.53125 ~ {Tags:["newbie","projectile","-x"],item:{id:"arrow",count:1},billboard:"fixed",transformation:{left_rotation:[-0.6532815f,0.2705981f,-0.2705981f,-0.6532815f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]}}
            execute as @e[tag=cont,tag=arrow_disp] at @s if score @s game.mechanism.disp_cont.fire_cd >= @s game.data.disp_cont.fire_rate run summon minecraft:item_display ~ ~-0.53125 ~0.500001 {Tags:["newbie","projectile","+z"],item:{id:"arrow",count:1},billboard:"fixed",transformation:{left_rotation:[0.6532815f, 0.2705981f, -0.2705981f, 0.6532815f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]}}
            execute as @e[tag=cont,tag=arrow_disp] at @s if score @s game.mechanism.disp_cont.fire_cd >= @s game.data.disp_cont.fire_rate run summon minecraft:item_display ~ ~-0.53125 ~-0.500001 {Tags:["newbie","projectile","-z"],item:{id:"arrow",count:1},billboard:"fixed",transformation:{left_rotation:[-0.2705981f,0.6532815f,-0.6532815f,-0.2705981f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]}}
        #sound effect
            execute as @e[tag=cont,tag=arrow_disp] at @s if score @s game.mechanism.disp_cont.fire_cd >= @s game.data.disp_cont.fire_rate run playsound entity.arrow.shoot block @a ~ ~-0.53125 ~
        #transfers damage & range info to the projectile
            execute as @e[tag=cont,tag=arrow_disp] at @s if score @s game.mechanism.disp_cont.fire_cd >= @s game.data.disp_cont.fire_rate store result score @e[tag=projectile,tag=newbie,sort=nearest,limit=4] game.data.disp_cont.damage run scoreboard players get @s game.data.disp_cont.damage
            execute as @e[tag=cont,tag=arrow_disp] at @s if score @s game.mechanism.disp_cont.fire_cd >= @s game.data.disp_cont.fire_rate store result score @e[tag=projectile,tag=newbie,sort=nearest,limit=4] game.data.disp_cont.range run scoreboard players get @s game.data.disp_cont.range
        #calculates initial sum of x and z coords
            scoreboard objectives add _ dummy
            execute as @e[tag=projectile,tag=newbie] at @s store result score @s game.mechanism.projectile.init_xz run data get entity @s Pos[0] 1
            execute as @e[tag=projectile,tag=newbie] at @s store result score @s _ run data get entity @s Pos[2] 1
            execute as @e[tag=projectile,tag=newbie] at @s run scoreboard players operation @s game.mechanism.projectile.init_xz += @s _
        tag @e[tag=projectile,tag=newbie] remove newbie
        
        execute as @e[tag=cont,tag=arrow_disp] at @s if score @s game.mechanism.disp_cont.fire_cd >= @s game.data.disp_cont.fire_rate run scoreboard players set @s game.mechanism.disp_cont.fire_cd 0
        execute as @e[tag=cont,tag=arrow_disp] at @s run scoreboard players add @s game.mechanism.disp_cont.fire_cd 1
    
    #Slime Dispenser - fires slime balls in all 4 directions
        #summons slime balls in all 4 directions
            execute as @e[tag=cont,tag=slime_disp] at @s if score @s game.mechanism.disp_cont.fire_cd >= @s game.data.disp_cont.fire_rate run summon minecraft:item_display ~0.500001 ~-0.53125 ~ {Tags:["newbie","projectile","no_damage","slowdown","+x"],item:{id:"slime_ball",count:1},billboard:"center",transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]}}
            execute as @e[tag=cont,tag=slime_disp] at @s if score @s game.mechanism.disp_cont.fire_cd >= @s game.data.disp_cont.fire_rate run summon minecraft:item_display ~-0.500001 ~-0.53125 ~ {Tags:["newbie","projectile","no_damage","slowdown","-x"],item:{id:"slime_ball",count:1},billboard:"center",transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]}}
            execute as @e[tag=cont,tag=slime_disp] at @s if score @s game.mechanism.disp_cont.fire_cd >= @s game.data.disp_cont.fire_rate run summon minecraft:item_display ~ ~-0.53125 ~0.500001 {Tags:["newbie","projectile","no_damage","slowdown","+z"],item:{id:"slime_ball",count:1},billboard:"center",transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]}}
            execute as @e[tag=cont,tag=slime_disp] at @s if score @s game.mechanism.disp_cont.fire_cd >= @s game.data.disp_cont.fire_rate run summon minecraft:item_display ~ ~-0.53125 ~-0.500001 {Tags:["newbie","projectile","no_damage","slowdown","-z"],item:{id:"slime_ball",count:1},billboard:"center",transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]}}
        #sound effect
            execute as @e[tag=cont,tag=slime_disp] at @s if score @s game.mechanism.disp_cont.fire_cd >= @s game.data.disp_cont.fire_rate run playsound entity.egg.throw block @a ~ ~-0.53125 ~
        #transfers duration & range info to the projectile
            execute as @e[tag=cont,tag=slime_disp] at @s if score @s game.mechanism.disp_cont.fire_cd >= @s game.data.disp_cont.fire_rate store result score @e[tag=projectile,tag=newbie,sort=nearest,limit=4] game.data.disp_cont.duration run scoreboard players get @s game.data.disp_cont.duration
            execute as @e[tag=cont,tag=slime_disp] at @s if score @s game.mechanism.disp_cont.fire_cd >= @s game.data.disp_cont.fire_rate store result score @e[tag=projectile,tag=newbie,sort=nearest,limit=4] game.data.disp_cont.range run scoreboard players get @s game.data.disp_cont.range
        #calculates initial sum of x and z coords
            scoreboard objectives add _ dummy
            execute as @e[tag=projectile,tag=newbie] at @s store result score @s game.mechanism.projectile.init_xz run data get entity @s Pos[0] 1
            execute as @e[tag=projectile,tag=newbie] at @s store result score @s _ run data get entity @s Pos[2] 1
            execute as @e[tag=projectile,tag=newbie] at @s run scoreboard players operation @s game.mechanism.projectile.init_xz += @s _
        tag @e[tag=projectile,tag=newbie] remove newbie
        
        execute as @e[tag=cont,tag=slime_disp] at @s if score @s game.mechanism.disp_cont.fire_cd >= @s game.data.disp_cont.fire_rate run scoreboard players set @s game.mechanism.disp_cont.fire_cd 0
        execute as @e[tag=cont,tag=slime_disp] at @s run scoreboard players add @s game.mechanism.disp_cont.fire_cd 1
    

    #Trapdoors - traps and kills mobs with ticks_per_block>5 if the number of mobs trapped<capacity upon contact
        execute as @e[tag=mob,tag=!trapdoor_immune] at @s if score @s game.data.mob.ticks_per_block matches 6.. if entity @e[tag=cont,tag=trapdoor,distance=..0.1] run tag @s add trapped
        
        execute as @e[tag=mob,tag=!trapdoor_immune,tag=trapped] at @s if score @n[tag=cont,tag=trapdoor] game.data.cont.mobs_trapped >= @n[tag=cont,tag=trapdoor] game.data.cont.capacity run tag @s remove trapped

        execute as @e[tag=mob,tag=!trapdoor_immune,tag=trapped] at @s run tp @s ~ ~-0.5 ~
        execute as @e[tag=mob,tag=!trapdoor_immune,tag=trapped] at @s run scoreboard players set @s game.data.health 0
        execute as @e[tag=mob,tag=!trapdoor_immune,tag=trapped] at @s run effect clear @s glowing
        execute as @e[tag=mob,tag=!trapdoor_immune,tag=trapped] at @s run scoreboard players add @n[tag=cont,tag=trapdoor] game.data.cont.mobs_trapped 1

    #Iron Bars - obstructs mobs
        execute as @e[tag=cont,tag=iron_bars] at @s run tag @e[tag=mob,distance=..0.5] add obstructed
        execute as @e[tag=mob] at @s as @n[tag=cont,tag=iron_bars,distance=..0.5] at @s run scoreboard players remove @s game.data.health 1


#projectiles
    execute as @e[tag=projectile,tag=+x] at @s run tp @s ~0.35 ~ ~
    execute as @e[tag=projectile,tag=-x] at @s run tp @s ~-0.35 ~ ~
    execute as @e[tag=projectile,tag=+z] at @s run tp @s ~ ~ ~0.35
    execute as @e[tag=projectile,tag=-z] at @s run tp @s ~ ~ ~-0.35
    #calculates sum of current x and z coords
        scoreboard objectives add game.mechanism.projectile.current_xz dummy
        scoreboard objectives add _ dummy
        execute as @e[tag=projectile] at @s store result score @s game.mechanism.projectile.current_xz run data get entity @s Pos[0] 1
        execute as @e[tag=projectile] at @s store result score @s _ run data get entity @s Pos[2] 1
        execute as @e[tag=projectile] at @s run scoreboard players operation @s game.mechanism.projectile.current_xz += @s _
    #calculates the difference between the initial sum and current sum
        execute as @e[tag=projectile] at @s run scoreboard players operation @s _ = @s game.mechanism.projectile.init_xz
        execute as @e[tag=projectile] at @s run scoreboard players operation @s _ -= @s game.mechanism.projectile.current_xz
        scoreboard objectives add game.mechanism.projectile.diff_xz dummy
        execute as @e[tag=projectile] at @s run scoreboard players set @s game.mechanism.projectile.diff_xz 0
        execute as @e[tag=projectile] at @s if score @s _ matches ..0 run scoreboard players operation @s game.mechanism.projectile.diff_xz -= @s _
        execute as @e[tag=projectile] at @s if score @s _ matches 0.. run scoreboard players operation @s game.mechanism.projectile.diff_xz += @s _
    #if difference exceeds range (boundary inclusive) then remove projectile
        execute as @e[tag=projectile] at @s if score @s game.mechanism.projectile.diff_xz >= @s game.data.disp_cont.range run kill @s
    #if exceeds the end of path then remove projectile
        execute as @e[tag=projectile] at @s positioned ~ ~-1.5 ~ unless entity @e[tag=path_block,distance=..0.5] run kill @s

    #if projectile hits mob then damage the mob and remove projectile
        #tags the projectile
            execute as @e[tag=projectile] at @s positioned ~ ~-0.5 ~ if entity @e[tag=mob,tag=!riding,distance=..0.75] run tag @s add hit
        #calculates mob new health
            #execute as @e[tag=projectile,tag=hit] at @s run tellraw @a ["Before: ",{"score":{"name":"@n[tag=mob]","objective":"game.data.health"}}, "dmg: ",{"score":{"name":"@s","objective":"game.data.disp_cont.damage"}}]
            execute as @e[tag=projectile,tag=hit] at @s run scoreboard players operation @n[tag=mob,tag=!riding] game.data.health -= @s game.data.disp_cont.damage
            
            #execute as @e[tag=projectile,tag=hit] at @s run tellraw @a ["After: ",{"score":{"name":"@n[tag=mob]","objective":"game.data.health"}}]
        #adds slowness duration if applicable
            execute as @e[tag=mob,tag=!riding] at @s unless score @s game.data.mob.slowness_remaining_duration matches -2147483648..2147483647 run scoreboard players set @s game.data.mob.slowness_remaining_duration 0
            execute as @e[tag=projectile,tag=hit] at @s if score @s game.data.disp_cont.duration > @n[tag=mob,tag=!riding] game.data.mob.slowness_remaining_duration run scoreboard players operation @n[tag=mob,tag=!riding] game.data.mob.slowness_remaining_duration = @s game.data.disp_cont.duration
        
        #visual effects
            scoreboard objectives add game.mechanism.display_damage_on_display_entity dummy
            execute as @e[tag=projectile,tag=hit] at @s if score @n[tag=mob,tag=!riding] game.data.health matches 1.. run damage @n[tag=mob,tag=!riding] 1 out_of_world
            execute as @e[tag=projectile,tag=hit] at @s run scoreboard players set @n[tag=mob,tag=!riding] game.mechanism.display_damage_on_display_entity 1
        kill @e[tag=projectile,tag=hit]

#mobs
    #creepers - explodes upon being obstructed, and gives damage to all contraptions (50) and mobs (20) within a radius of 4, and itself disappears, does not happen when it has mercy
        execute as @e[tag=mob,type=creeper,tag=obstructed,scores={game.data.mob.has_mercy=0}] at @s run particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 1 1
        execute as @e[tag=mob,type=creeper,tag=obstructed,scores={game.data.mob.has_mercy=0}] at @s run playsound minecraft:entity.generic.explode hostile @a ~ ~ ~
        execute as @e[tag=mob,type=creeper,tag=obstructed,scores={game.data.mob.has_mercy=0}] at @s as @e[tag=cont,distance=..4] at @s run scoreboard players remove @s game.data.health 50
        execute as @e[tag=mob,type=creeper,tag=obstructed,scores={game.data.mob.has_mercy=0}] at @s as @e[tag=mob,distance=..4] at @s run scoreboard players remove @s game.data.health 20
        execute as @e[tag=mob,type=creeper,tag=obstructed,scores={game.data.mob.has_mercy=0}] at @s as @e[tag=mob,distance=..4] at @s run damage @s 1 out_of_world
        execute as @e[tag=mob,type=creeper,tag=obstructed,scores={game.data.mob.has_mercy=0}] at @s run scoreboard players set @s game.data.health 0
        execute as @e[tag=mob,type=creeper,tag=obstructed,scores={game.data.mob.has_mercy=0}] at @s run tp 0 -100 0
    
    #maintaining jockey in a riding position
        #spider jockey
            execute as @e[tag=mob,tag=riding] at @s run ride @s mount @n[tag=being_ridden,nbt=!{Passengers:[{}]}]
        #silverfish batch
            #execute as @e[tag=batch_sub_0] at @s run ride @s mount @n[tag=batch_main,nbt=!{Passengers:[{}]}]
            #execute as @e[tag=batch_sub_1] at @s run ride @s mount @n[tag=batch_sub_0,nbt=!{Passengers:[{}]}]
    #slimes
        #jumping around
            scoreboard objectives add game.mechanism.jumping.jumping_cd dummy
            execute as @e[tag=mob,tag=entity_anchor,tag=jumping] unless score @s game.mechanism.jumping.jumping_cd matches -2147483648..2147483647 run scoreboard players set @s game.mechanism.jumping.jumping_cd 0
            #define y_0, unit: 10^-6 m
                scoreboard objectives add game.mechanism.jumping.init_y dummy
                execute as @e[tag=mob,tag=entity_anchor,tag=jumping] at @s store result score @s game.mechanism.jumping.init_y run data get entity @s Pos[1] 1000000
            #define u, unit: (10^-6 m) (tick^-1)
                scoreboard objectives add game.mechanism.jumping.init_vertical_speed dummy
                scoreboard players set @e[tag=mob,tag=entity_anchor,tag=jumping] game.mechanism.jumping.init_vertical_speed 500000
            #define a, unit: (10^-6 m) (tick^-2)
                scoreboard objectives add game.mechanism.jumping.acceleration_of_free_fall dummy
                scoreboard players set @e[tag=mob,tag=entity_anchor,tag=jumping] game.mechanism.jumping.acceleration_of_free_fall -90000
            #define t, unit: tick
                scoreboard objectives add game.mechanism.jumping.time dummy
                execute as @e[tag=mob,tag=entity_anchor,tag=jumping] unless score @s game.mechanism.jumping.time matches -2147483648..2147483647 run scoreboard players set @s game.mechanism.jumping.time 0
            #calculate: y = y_0 + ut + 1/2 a t^2
                scoreboard objectives add game.mechanism.jumping.y dummy
                scoreboard objectives add _ dummy
                #y = u
                    execute as @e[tag=mob,tag=entity_anchor,tag=jumping] run scoreboard players operation @s game.mechanism.jumping.y = @s game.mechanism.jumping.init_vertical_speed
                #y *= t
                    execute as @e[tag=mob,tag=entity_anchor,tag=jumping] run scoreboard players operation @s game.mechanism.jumping.y *= @s game.mechanism.jumping.time
                #_ = a
                    execute as @e[tag=mob,tag=entity_anchor,tag=jumping] run scoreboard players operation @s _ = @s game.mechanism.jumping.acceleration_of_free_fall
                #_ *= t repeated twice
                    execute as @e[tag=mob,tag=entity_anchor,tag=jumping] run scoreboard players operation @s _ *= @s game.mechanism.jumping.time
                    execute as @e[tag=mob,tag=entity_anchor,tag=jumping] run scoreboard players operation @s _ *= @s game.mechanism.jumping.time
                #_ /= 2
                    execute as @e[tag=mob,tag=entity_anchor,tag=jumping] run scoreboard players operation @s _ /= #global const.2
                #y += _
                    execute as @e[tag=mob,tag=entity_anchor,tag=jumping] run scoreboard players operation @s game.mechanism.jumping.y += @s _
                #y += y_0
                    execute as @e[tag=mob,tag=entity_anchor,tag=jumping] run scoreboard players operation @s game.mechanism.jumping.y += @s game.mechanism.jumping.init_y
            #progress time if not during jumping cooldown
                execute as @e[tag=mob,tag=entity_anchor,tag=jumping] if score @s game.mechanism.jumping.jumping_cd matches ..0 run scoreboard players add @s game.mechanism.jumping.time 1
                execute as @e[tag=mob,tag=entity_anchor,tag=jumping] if score @s game.mechanism.jumping.jumping_cd matches 1.. run scoreboard players remove @s game.mechanism.jumping.jumping_cd 1

            #if y<y_0, reset t, and wait 5 ticks until the next jump
                execute as @e[tag=mob,tag=entity_anchor,tag=jumping] if score @s game.mechanism.jumping.y < @s game.mechanism.jumping.init_y run scoreboard players set @s game.mechanism.jumping.time 0
                execute as @e[tag=mob,tag=entity_anchor,tag=jumping] if score @s game.mechanism.jumping.y < @s game.mechanism.jumping.init_y run scoreboard players set @s game.mechanism.jumping.jumping_cd 5
                
                execute as @e[tag=mob,tag=entity_anchor,tag=jumping] at @s if score @s game.mechanism.jumping.y < @s game.mechanism.jumping.init_y run particle minecraft:item_slime ~ ~ ~ 0 0 0 1 15
                execute as @e[tag=mob,tag=entity_anchor,tag=jumping] at @s if score @s game.mechanism.jumping.y < @s game.mechanism.jumping.init_y run playsound minecraft:entity.slime.jump hostile @a ~ ~ ~ 1 1
                execute as @e[tag=mob,tag=entity_anchor,tag=jumping] if score @s game.mechanism.jumping.y < @s game.mechanism.jumping.init_y run scoreboard players operation @s game.mechanism.jumping.y = @s game.mechanism.jumping.init_y

    #enderman - gets damaged by water
        scoreboard objectives add game.data.mob.damage_cd dummy
        execute as @e[tag=water_damage] at @s unless score @s game.data.mob.damage_cd matches -2147483648..2147483647 run scoreboard players set @s game.data.mob.damage_cd 0

        execute as @e[tag=water_damage] at @s if score @s game.data.mob.damage_cd matches ..0 if block ~ ~ ~ water run scoreboard players remove @s game.data.health 5
        execute as @e[tag=water_damage] at @s if score @s game.data.mob.damage_cd matches ..0 if block ~ ~ ~ water run scoreboard players set @s game.mechanism.display_damage_on_display_entity 1
        
        execute as @e[tag=water_damage] at @s if score @s game.data.mob.damage_cd matches ..0 if block ~ ~ ~ water run scoreboard players set @s game.data.mob.damage_cd 10
        execute as @e[tag=water_damage] at @s if score @s game.data.mob.damage_cd matches 1.. run scoreboard players remove @s game.data.mob.damage_cd 1
        
    #syncing positions with anchor marker
        execute as @e[tag=mob,tag=entity_anchor] run function game:entity_pairing with entity @s

#gives effects to mobs
    effect give @e[tag=mob] resistance infinite 255 true
    #resets mob entity health (their actual health is stored in a scoreboard)
    execute as @e[tag=mob] at @s run data merge entity @s {Health:114514f}


execute as @e[tag=cont] at @s if score @s game.data.health matches ..0 run scoreboard players set @s game.data.health 0
execute as @e[tag=mob] at @s if score @s game.data.health matches ..0 run scoreboard players set @s game.data.health 0

execute as @e[tag=cont] at @s if score @s game.data.health matches ..0 run tag @s add kill
#awards corresponding currency to the player upon the death of the mob
execute as @e[tag=mob] at @s if score @s game.data.health matches ..0 run scoreboard players operation #global game.data.currency += @s game.data.mob.currency_drop
#displays "currency: <new currency> (+<currency gained>)"

execute as @e[tag=mob] at @s if score @s game.data.health matches ..0 run scoreboard players operation #global game.mechanism.new_currency_display = @s game.data.mob.currency_drop
execute as @e[tag=mob] at @s if score @s game.data.health matches ..0 run scoreboard players set #global game.mechanism.new_currency_display_cd 40
execute as @e[tag=mob] at @s if score @s game.data.health matches ..0 as @a at @s run playsound minecraft:block.amethyst_block.hit master @s ~ ~ ~

#when a slime dies transform it into a weaker version and reset health
    #killing the slime display entity
        execute as @e[tag=mob,tag=entity_anchor,tag=slime_behavior] at @s if score @s game.data.health matches ..0 run function game:entity_pairing with entity @s
    #halving properties
        execute as @e[tag=mob,tag=entity_anchor,tag=slime_behavior] at @s if score @s game.data.health matches ..0 run scoreboard players operation @s game.data.max_health /= #global const.2
        execute as @e[tag=mob,tag=entity_anchor,tag=slime_behavior] at @s if score @s game.data.health matches ..0 run scoreboard players operation @s game.data.mob.currency_drop /= #global const.2
    #deducting size
        execute as @e[tag=mob,tag=entity_anchor,tag=slime_behavior] at @s if score @s game.data.health matches ..0 run scoreboard players remove @s game.data.slime_size 1
    #summons new slime display entity
        execute as @e[tag=mob,tag=entity_anchor,tag=slime_behavior] at @s if score @s game.data.health matches ..0 if score @s game.data.slime_size matches 0.. run summon slime ~ ~ ~ {NoAI:1b,Size:0,Invulnerable:1b,Tags:["display_entity","newbie","health_tracking"]}

        execute as @e[tag=display_entity,tag=newbie] at @s run scoreboard players set @s game.data.mob_uuid 0
        execute as @e[tag=mob,tag=entity_anchor,tag=slime_behavior] at @s if score @s game.data.health matches ..0 if score @s game.data.slime_size matches 0.. run scoreboard players operation @n[tag=display_entity,tag=newbie,scores={game.data.mob_uuid=0}] game.data.mob_uuid = @s game.data.mob_uuid

        execute as @e[tag=mob,tag=entity_anchor,tag=slime_behavior] at @s if score @s game.data.health matches ..0 run tag @e[tag=display_entity] remove newbie

    #if size 0.. then reset health
        execute as @e[tag=mob,tag=slime_behavior] at @s if score @s game.data.health matches ..0 if score @s game.data.slime_size matches 0.. run scoreboard players operation @s game.data.health = @s game.data.max_health

        execute as @e[tag=mob,tag=slime_behavior] at @s run function game:entity_pairing with entity @s

execute as @e[tag=mob,tag=being_ridden] at @s if score @s game.data.health matches ..0 run tag @n[tag=riding] add dismount

execute as @e[tag=dismount] at @s run ride @s dismount
execute as @e[tag=dismount] at @s run tp @n[tag=path_block]
execute as @e[tag=dismount] at @s run tp @s ~ ~1 ~
execute as @e[tag=dismount] at @s run scoreboard players set @s game.data.mob.ticks_left_until_next_anchor 0
tag @e[tag=dismount] remove riding
tag @e[tag=dismount] remove dismount

execute as @e[tag=batch_main] at @s if score @s game.data.health matches ..0 run kill @e[tag=batch_sub,sort=nearest,limit=2]
execute as @e[tag=mob] at @s if score @s game.data.health matches ..0 run kill @s