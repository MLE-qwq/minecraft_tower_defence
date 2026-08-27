#this function processes what the game would do if there are new players joining after a round has started, or a player quits within a round

execute as @a at @s unless score @s game.data.uuid matches -2147483648..2147483647 run scoreboard players set @s game.data.uuid 0

gamemode spectator @a[scores={game.data.uuid=0}]
execute if score #global game.mechanism.active_ticks matches 1.. as @a at @s if score @s game.data.uuid matches 1.. unless entity @s[nbt={playerGameType:1}] run gamemode adventure