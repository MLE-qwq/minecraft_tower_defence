function game:load_level_generic.before

#set biome
    fillbiome -24 -8 -24 24 24 24 plains

#displaying instructions in chat
    tellraw @a "\u00a7bLevel 5: Mineshaft 1"

    tellraw @a "\u00a7aCredits:"
    tellraw @a "\u00a7a- Terrain: \u00a7fMLE_qwq"
    tellraw @a "\u00a7a- Code: \u00a7fMLE_qwq"

#specifying path blocks and pre-built path blocks
    setblock 15 -2 -15 sand
    setblock 15 -2 -14 minecraft:sand
#specifying dedicated original block
    setblock 15 -2 -13 stone

#marking
    summon minecraft:marker -48 -64 -48 {Tags:["terrain_origin"],CustomName:"Terrain Origin"}
    summon minecraft:marker -5 7 6 {Tags:["path_start","mob_spawnpoint"],CustomName:"Path Start"}
    summon minecraft:marker -1 7 2 {Tags:["path_ending"],CustomName:"Path Ending"}

#additional mob spawnpoints
    summon minecraft:marker -11 7 -3 {Tags:["additional","mob_spawnpoint","newbie"],CustomName:"Additional Mob Spawnpoint"}
    scoreboard players set @e[tag=mob_spawnpoint,tag=newbie] game.data.spawnpoint.mob_spawnpoint 1
    tag @e[tag=mob_spawnpoint,tag=newbie] remove newbie

#initial currency
    scoreboard players set #global game.data.currency 0

#summoning markers that lets path tracker & tester identify as air blocks
    summon marker -5 7 -4 {Tags:["auto_replace"],CustomName:"Auto Replace"}
    summon marker -1 7 -13 {Tags:["auto_replace"],CustomName:"Auto Replace"}
    summon marker -1 7 13 {Tags:["auto_replace"],CustomName:"Auto Replace"}

#summoning path forbidden markers
    summon marker -4 7 3 {Tags:["path_forbidden"],CustomName:"Path Forbidden"}
    summon marker -6 7 3 {Tags:["path_forbidden"],CustomName:"Path Forbidden"}
    summon marker -6 7 -6 {Tags:["path_forbidden"],CustomName:"Path Forbidden"}
    summon marker -4 7 -6 {Tags:["path_forbidden"],CustomName:"Path Forbidden"}
    summon marker -3 7 -14 {Tags:["path_forbidden"],CustomName:"Path Forbidden"}
    summon marker -3 7 -12 {Tags:["path_forbidden"],CustomName:"Path Forbidden"}
    summon marker 4 7 -10 {Tags:["path_forbidden"],CustomName:"Path Forbidden"}
    summon marker 2 7 -10 {Tags:["path_forbidden"],CustomName:"Path Forbidden"}
    summon marker 11 7 -12 {Tags:["path_forbidden"],CustomName:"Path Forbidden"}
    summon marker 11 7 -14 {Tags:["path_forbidden"],CustomName:"Path Forbidden"}
    summon marker 12 7 -9 {Tags:["path_forbidden"],CustomName:"Path Forbidden"}
    summon marker 13 7 -9 {Tags:["path_forbidden"],CustomName:"Path Forbidden"}
    summon marker 14 7 -9 {Tags:["path_forbidden"],CustomName:"Path Forbidden"}
    summon marker 4 7 1 {Tags:["path_forbidden"],CustomName:"Path Forbidden"}
    summon marker 2 7 1 {Tags:["path_forbidden"],CustomName:"Path Forbidden"}
    summon marker 4 7 10 {Tags:["path_forbidden"],CustomName:"Path Forbidden"}
    summon marker 2 7 10 {Tags:["path_forbidden"],CustomName:"Path Forbidden"}
    summon marker 5 7 8 {Tags:["path_forbidden"],CustomName:"Path Forbidden"}
    summon marker 5 7 9 {Tags:["path_forbidden"],CustomName:"Path Forbidden"}
    summon marker -2 7 13 {Tags:["path_forbidden"],CustomName:"Path Forbidden"}
    summon marker -1 7 14 {Tags:["path_forbidden"],CustomName:"Path Forbidden"}
    summon marker -2 7 7 {Tags:["path_forbidden"],CustomName:"Path Forbidden"}
    summon marker 0 7 1 {Tags:["path_forbidden"],CustomName:"Path Forbidden"}
    summon marker -1 7 1 {Tags:["path_forbidden"],CustomName:"Path Forbidden"}
    summon marker -2 7 1 {Tags:["path_forbidden"],CustomName:"Path Forbidden"}

#bonus chests
    summon marker -5 7 -4 {Tags:["bonus_chest","newbie"],CustomName:"Bonus Chest"}
    scoreboard players set @e[tag=bonus_chest,tag=newbie] game.data.bonus_chest.currany 150
    tag @e[tag=bonus_chest,tag=newbie] remove newbie

    summon marker -1 7 -13 {Tags:["bonus_chest","newbie"],CustomName:"Bonus Chest"}
    scoreboard players set @e[tag=bonus_chest,tag=newbie] game.data.bonus_chest.currany 150
    tag @e[tag=bonus_chest,tag=newbie] remove newbie

    summon marker -1 7 13 {Tags:["bonus_chest","newbie"],CustomName:"Bonus Chest"}
    scoreboard players set @e[tag=bonus_chest,tag=newbie] game.data.bonus_chest.currany 150
    tag @e[tag=bonus_chest,tag=newbie] remove newbie

#stores wave data
    scoreboard players set #global game.state.total_waves 5

    #wave 1: silverfish*20, silverfish_batch*5
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 20
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 6
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 1
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 10
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie
        
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 5
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 7
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 1
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 20
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 2: silverfish*22, silverfish_batch*7
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 22
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 6
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 2
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 20
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint -1
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie
        
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 7
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 7
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 2
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 40
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint -1
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 3: silverfish*24, silverfish_batch*9
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 24
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 6
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 3
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 40
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint -1
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie
        
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 9
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 7
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 3
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 80
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint -1
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 4: silverfish*26, silverfish_batch*11
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 26
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 6
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 4
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 75
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint -1
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie
        
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 11
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 7
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 4
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 150
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint -1
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 5: silverfish*28, silverfish_batch*13
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 28
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 6
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 5
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 100
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint -1
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie
        
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 13
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 7
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 5
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 200
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint -1
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

function game:load_level_generic.after