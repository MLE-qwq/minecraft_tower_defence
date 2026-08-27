$scoreboard players operation @a[nbt={UUID:$(UUID)}] game.data.uuid = #global game.data.uuid
summon text_display 0 0 0 {Tags:["health_display","newbie"]}
scoreboard players operation @e[tag=health_display,tag=newbie] game.data.uuid = #global game.data.uuid

tag @e[tag=health_display,tag=newbie] remove newbie

scoreboard players add #global game.data.uuid 1