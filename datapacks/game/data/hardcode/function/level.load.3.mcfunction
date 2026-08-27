function game:load_level_generic.before

#set biome
    fillbiome -24 -8 -24 24 24 24 plains

#displaying instructions in chat
    tellraw @a "\u00a7bLevel 3: Village"

    tellraw @a "\u00a7aCredits:"
    tellraw @a "\u00a7a- Terrain: \u00a7fMLE_qwq"
    tellraw @a "\u00a7a- Code: \u00a7fMLE_qwq"
    
#specifying path blocks and pre-built path blocks
    setblock 15 -2 -15 gravel
    setblock 15 -2 -14 minecraft:dirt_path
#specifying dedicated original block
    setblock 15 -2 -13 grass_block

#marking
    summon minecraft:marker -48 -64 16 {Tags:["terrain_origin"],CustomName:"Terrain Origin"}
    summon minecraft:marker -15 4 13 {Tags:["path_start","mob_spawnpoint"],CustomName:"Path Start"}
    summon minecraft:marker -4 4 -7 {Tags:["path_ending"],CustomName:"Path Ending"}

#summoning markers that lets path tracker & tester identify as air blocks
    summon marker -9 4 3 {Tags:["auto_replace"],CustomName:"Auto Replace"}
    summon marker -10 4 3 {Tags:["auto_replace"],CustomName:"Auto Replace"}
    summon marker -10 4 2 {Tags:["auto_replace"],CustomName:"Auto Replace"}
    summon marker -10 4 1 {Tags:["auto_replace"],CustomName:"Auto Replace"}
    summon marker -10 4 0 {Tags:["auto_replace"],CustomName:"Auto Replace"}
    summon marker -11 4 0 {Tags:["auto_replace"],CustomName:"Auto Replace"}
    summon marker -12 4 0 {Tags:["auto_replace"],CustomName:"Auto Replace"}
    summon marker -13 4 0 {Tags:["auto_replace"],CustomName:"Auto Replace"}
    summon marker -14 4 0 {Tags:["auto_replace"],CustomName:"Auto Replace"}
    summon marker -14 4 -1 {Tags:["auto_replace"],CustomName:"Auto Replace"}
    summon marker -14 4 -2 {Tags:["auto_replace"],CustomName:"Auto Replace"}

#initial currency
    scoreboard players set #global game.data.currency 0

#bonus chests
    summon marker -14 4 0 {Tags:["bonus_chest","newbie"],CustomName:"Bonus Chest"}
    scoreboard players set @e[tag=bonus_chest,tag=newbie] game.data.bonus_chest.currany 450
    tag @e[tag=bonus_chest,tag=newbie] remove newbie

#stores wave data
    scoreboard players set #global game.state.total_waves 10

    #wave 1: creeper*8
    summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 8
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 0
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 1
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 20
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_has_mercy 0
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
    tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 2: zombie*17
    summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 17
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 2
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 2
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 40
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_has_mercy 0
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
    tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 3: spider*12
    summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 12
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 4
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 3
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 60
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_has_mercy 0
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
    tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 4: zombie*20
    summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 20
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 2
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 4
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 80
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_has_mercy 0
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
    tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 5: spider jockey*2
    summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 2
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 5
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 5
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 100
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_has_mercy 0
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
    tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 6: creeper*12
    summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 12
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 0
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 6
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 120
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_has_mercy 0
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
    tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 7: zombie*24
    summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 24
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 2
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 7
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 140
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_has_mercy 0
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
    tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 8: spider*20
    summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 20
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 4
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 8
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 160
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_has_mercy 0
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
    tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 9: zombie*24
    summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 24
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 2
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 9
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 180
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_has_mercy 0
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
    tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 10: spider jockey*4
    summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 4
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 5
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 10
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 200
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_has_mercy 0
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
    tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

function game:load_level_generic.after