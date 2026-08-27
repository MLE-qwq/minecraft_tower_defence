#init
    scoreboard objectives add game.data.currency_new dummy
    scoreboard players operation #global game.data.currency_new = #global game.data.currency

execute as @a at @s if score @s game.trigger.purchase matches 1.. run tag @s add show_purchase_menu

function hardcode:cont.purchase.main


#finishing up
    scoreboard players set @a game.trigger.purchase 0
    scoreboard players set * game.trigger.purchase 0

#display purchase menu
    execute as @a[tag=show_purchase_menu] at @s run dialog show @s game:purchase_menu

#process unlocked new contraptions
    function hardcode:cont.purchase.unlocking

tag @a remove show_purchase_menu