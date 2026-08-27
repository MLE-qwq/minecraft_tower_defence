execute if score #global game.saves.easter_egg.0 matches 2 as @a at @s run playsound ui.toast.challenge_complete master @s ~ ~ ~
execute if score #global game.saves.easter_egg.0 matches 2 run tellraw @a "\u00a7kM\u00a7d You've just found an easter egg! (\u00a7e#1\u00a7d) \u00a7r\u00a7kM"
execute if score #global game.saves.easter_egg.0 matches 2 run scoreboard players set #global game.saves.easter_egg.count 0
execute if score #global game.saves.easter_egg.0 matches 2 run scoreboard players set #global game.saves.easter_egg.0 1

execute if score #global game.saves.easter_egg.1 matches 2 as @a at @s run playsound ui.toast.challenge_complete master @s ~ ~ ~
execute if score #global game.saves.easter_egg.1 matches 2 run tellraw @a "\u00a7kM\u00a7d You've just found an easter egg! (\u00a7e#2\u00a7d) \u00a7r\u00a7kM"
execute if score #global game.saves.easter_egg.1 matches 2 run scoreboard players set #global game.saves.easter_egg.count 0
execute if score #global game.saves.easter_egg.1 matches 2 run scoreboard players set #global game.saves.easter_egg.1 1

execute unless score #global game.saves.easter_egg.count matches -1 run scoreboard players operation #global game.saves.easter_egg.count += #global game.saves.easter_egg.0
execute unless score #global game.saves.easter_egg.count matches -1 run scoreboard players operation #global game.saves.easter_egg.count += #global game.saves.easter_egg.1
execute unless score #global game.saves.easter_egg.count matches -1 run tellraw @a ["\u00a7dProgress: ",{"color":"yellow","score":{"name":"#global","objective":"game.saves.easter_egg.count"}},"\u00a7d/\u00a7e2"]
execute unless score #global game.saves.easter_egg.count matches -1 run scoreboard players set #global game.saves.easter_egg.count -1

#easter egg sign command: /give @p oak_sign[block_entity_data={id:"sign",front_text:{has_glowing_text:1b,color:"white",messages:[[{"text":"meow uwu","click_event":{"action":"run_command","command":"/execute unless score #global game.saves.easter_egg.0 matches 1 run scoreboard players set #global game.saves.easter_egg.0 2"}}],"","",""]}}] 1