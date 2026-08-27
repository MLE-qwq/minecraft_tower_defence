#Cactus
    execute unless score #global game.saves.cont_unlocked.cactus matches 1 run tellraw @a[scores={game.trigger.purchase=1},limit=1] "\u00a7cYou have not yet unlocked the contraption \u00a72Cactus\u00a7c."
    execute unless score #global game.saves.cont_unlocked.cactus matches 1 as @a[scores={game.trigger.purchase=1},limit=1] at @s run playsound block.anvil.land master @s ~ ~ ~

    execute if score #global game.saves.cont_unlocked.cactus matches 1 as @a[scores={game.trigger.purchase=1},limit=1] at @s run scoreboard players remove #global game.data.currency_new 15

    execute if score #global game.saves.cont_unlocked.cactus matches 1 as @a[scores={game.trigger.purchase=1},limit=1] at @s unless score #global game.data.currency matches 15.. run tellraw @s ["\u00a7cYou do not have enough currency to purchase\u00a72 Cactus\u00a7c.\u00a7a $15 \u00a7cis required, but there's only \u00a7a$",{"score":{"name":"#global","objective":"game.data.currency"},"color":"green"}," \u00a7cremaining."]
    execute if score #global game.saves.cont_unlocked.cactus matches 1 as @a[scores={game.trigger.purchase=1},limit=1] at @s unless score #global game.data.currency matches 15.. run playsound block.anvil.land master @a ~ ~ ~ 1 0.5

    execute if score #global game.saves.cont_unlocked.cactus matches 1 as @a[scores={game.trigger.purchase=1},limit=1] at @s if score #global game.data.currency matches 15.. run give @s minecraft:cactus[lore=["","\u00a7bFunction: Gives \u00a7c10 Damage\u00a7b to mobs upon contact,","\u00a7b while losing \u00a7c10 Durability\u00a7b. Initially has \u00a7c15 Durability\u00a7b.","\u00a7eTrigger: Drop the item onto a path block. Cannot be put on bridges."],custom_data={id:"cont_cactus",is_cont:true,item_recovery:true}] 1
    execute if score #global game.saves.cont_unlocked.cactus matches 1 as @a[scores={game.trigger.purchase=1},limit=1] at @s if score #global game.data.currency matches 15.. run playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~
    execute if score #global game.saves.cont_unlocked.cactus matches 1 as @a[scores={game.trigger.purchase=1},limit=1] at @s if score #global game.data.currency matches 15.. run tellraw @a [{"selector":"@s"},"\u00a7b has purchased\u00a72 Cactus \u00a7bfor\u00a7a $15\u00a7b, with \u00a7a$",{"score":{"name":"#global","objective":"game.data.currency_new"},"color":"green"},"\u00a7b remaining."]
    execute if score #global game.saves.cont_unlocked.cactus matches 1 as @a[scores={game.trigger.purchase=1},limit=1] at @s if score #global game.data.currency matches 15.. run scoreboard players remove #global game.data.currency 15

#Egg Dispenser
    execute unless score #global game.saves.cont_unlocked.egg_disp matches 1 run tellraw @a[scores={game.trigger.purchase=2},limit=1] "\u00a7cYou have not yet unlocked the contraption \u00a7eEgg Dispenser\u00a7c."
    execute unless score #global game.saves.cont_unlocked.egg_disp matches 1 as @a[scores={game.trigger.purchase=2},limit=1] at @s run playsound block.anvil.land master @s ~ ~ ~

    execute if score #global game.saves.cont_unlocked.egg_disp matches 1 as @a[scores={game.trigger.purchase=2},limit=1] at @s run scoreboard players remove #global game.data.currency_new 50

    execute if score #global game.saves.cont_unlocked.egg_disp matches 1 as @a[scores={game.trigger.purchase=2},limit=1] at @s unless score #global game.data.currency matches 50.. run tellraw @s ["\u00a7cYou do not have enough currency to purchase\u00a7e Egg Dispenser\u00a7c.\u00a7a $50 \u00a7cis required, but there's only \u00a7a$",{"score":{"name":"#global","objective":"game.data.currency"},"color":"green"}," \u00a7cremaining."]
    execute if score #global game.saves.cont_unlocked.egg_disp matches 1 as @a[scores={game.trigger.purchase=2},limit=1] at @s unless score #global game.data.currency matches 50.. run playsound block.anvil.land master @a ~ ~ ~ 1 0.5

    execute if score #global game.saves.cont_unlocked.egg_disp matches 1 as @a[scores={game.trigger.purchase=2},limit=1] at @s if score #global game.data.currency matches 50.. run give @s minecraft:egg[custom_name="Egg Dispenser",lore=["","\u00a7bFunction: Projects eggs in all 4 directions. Has \u00a7c150 Durability\u00a7b.","\u00a7eTrigger: Drop the item onto a block \u00a7aadjacent \u00a7eto a path block.","\u00a7eCannot be put on any path blocks."],custom_data={id:"cont_egg_disp",is_cont:true,item_recovery:true}] 1
    execute if score #global game.saves.cont_unlocked.egg_disp matches 1 as @a[scores={game.trigger.purchase=2},limit=1] at @s if score #global game.data.currency matches 50.. run playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~
    execute if score #global game.saves.cont_unlocked.egg_disp matches 1 as @a[scores={game.trigger.purchase=2},limit=1] at @s if score #global game.data.currency matches 50.. run tellraw @a [{"selector":"@s"},"\u00a7b has purchased\u00a7e Egg Dispenser \u00a7bfor\u00a7a $50\u00a7b, with \u00a7a$",{"score":{"name":"#global","objective":"game.data.currency_new"},"color":"green"},"\u00a7b remaining."]
    execute if score #global game.saves.cont_unlocked.egg_disp matches 1 as @a[scores={game.trigger.purchase=2},limit=1] at @s if score #global game.data.currency matches 50.. run scoreboard players remove #global game.data.currency 50

#Water
    execute unless score #global game.saves.cont_unlocked.water matches 1 run tellraw @a[scores={game.trigger.purchase=3},limit=1] "\u00a7cYou have not yet unlocked the contraption \u00a71Water\u00a7c."
    execute unless score #global game.saves.cont_unlocked.water matches 1 as @a[scores={game.trigger.purchase=3},limit=1] at @s run playsound block.anvil.land master @s ~ ~ ~

    execute if score #global game.saves.cont_unlocked.water matches 1 as @a[scores={game.trigger.purchase=3},limit=1] at @s run scoreboard players remove #global game.data.currency_new 50

    execute if score #global game.saves.cont_unlocked.water matches 1 as @a[scores={game.trigger.purchase=3},limit=1] at @s unless score #global game.data.currency matches 50.. run tellraw @s ["\u00a7cYou do not have enough currency to purchase\u00a71 Water\u00a7c.\u00a7a $50 \u00a7cis required, but there's only \u00a7a$",{"score":{"name":"#global","objective":"game.data.currency"},"color":"green"}," \u00a7cremaining."]
    execute if score #global game.saves.cont_unlocked.water matches 1 as @a[scores={game.trigger.purchase=3},limit=1] at @s unless score #global game.data.currency matches 50.. run playsound block.anvil.land master @a ~ ~ ~ 1 0.5

    execute if score #global game.saves.cont_unlocked.water matches 1 as @a[scores={game.trigger.purchase=3},limit=1] at @s if score #global game.data.currency matches 50.. run give @s minecraft:water_bucket[custom_name="Water",lore=["","\u00a7bFunction: Slows mobs down upon contact. ","\u00a7eTrigger: Drop the item onto a path block. Cannot be put on bridges."],custom_data={id:"cont_water",is_cont:true,item_recovery:true}] 1

    execute if score #global game.saves.cont_unlocked.water matches 1 as @a[scores={game.trigger.purchase=3},limit=1] at @s if score #global game.data.currency matches 50.. run playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~
    execute if score #global game.saves.cont_unlocked.water matches 1 as @a[scores={game.trigger.purchase=3},limit=1] at @s if score #global game.data.currency matches 50.. run tellraw @a [{"selector":"@s"},"\u00a7b has purchased\u00a71 Water \u00a7bfor\u00a7a $50\u00a7b, with \u00a7a$",{"score":{"name":"#global","objective":"game.data.currency_new"},"color":"green"},"\u00a7b remaining."]
    execute if score #global game.saves.cont_unlocked.water matches 1 as @a[scores={game.trigger.purchase=3},limit=1] at @s if score #global game.data.currency matches 50.. run scoreboard players remove #global game.data.currency 50

#Trapdoor
    execute unless score #global game.saves.cont_unlocked.trapdoor matches 1 run tellraw @a[scores={game.trigger.purchase=4},limit=1] "\u00a7cYou have not yet unlocked the contraption \u00a76Trapdoor\u00a7c."
    execute unless score #global game.saves.cont_unlocked.trapdoor matches 1 as @a[scores={game.trigger.purchase=4},limit=1] at @s run playsound block.anvil.land master @s ~ ~ ~

    execute if score #global game.saves.cont_unlocked.trapdoor matches 1 as @a[scores={game.trigger.purchase=4},limit=1] at @s run scoreboard players remove #global game.data.currency_new 150

    execute if score #global game.saves.cont_unlocked.trapdoor matches 1 as @a[scores={game.trigger.purchase=4},limit=1] at @s unless score #global game.data.currency matches 150.. run tellraw @s ["\u00a7cYou do not have enough currency to purchase \u00a76Trapdoor\u00a7c.\u00a7a $150 \u00a7cis required, but there's only \u00a7a$",{"score":{"name":"#global","objective":"game.data.currency"},"color":"green"}," \u00a7cremaining."]
    execute if score #global game.saves.cont_unlocked.trapdoor matches 1 as @a[scores={game.trigger.purchase=4},limit=1] at @s unless score #global game.data.currency matches 150.. run playsound block.anvil.land master @a ~ ~ ~ 1 0.5

    execute if score #global game.saves.cont_unlocked.trapdoor matches 1 as @a[scores={game.trigger.purchase=4},limit=1] at @s if score #global game.data.currency matches 150.. run give @s minecraft:oak_trapdoor[custom_name="Trapdoor",lore=["","\u00a7bFunction: Traps and kills mobs moving slower than 4 blocks per second upon contact.","\u00a7eTrigger: Drop the item onto a path block. Has infinite capacity if put on bridges."],custom_data={id:"cont_trapdoor",is_cont:true,item_recovery:true}] 1

    execute if score #global game.saves.cont_unlocked.trapdoor matches 1 as @a[scores={game.trigger.purchase=4},limit=1] at @s if score #global game.data.currency matches 150.. run playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~
    execute if score #global game.saves.cont_unlocked.trapdoor matches 1 as @a[scores={game.trigger.purchase=4},limit=1] at @s if score #global game.data.currency matches 150.. run tellraw @a [{"selector":"@s"},"\u00a7b has purchased \u00a76Trapdoor \u00a7bfor\u00a7a $150\u00a7b, with \u00a7a$",{"score":{"name":"#global","objective":"game.data.currency_new"},"color":"green"},"\u00a7b remaining."]
    execute if score #global game.saves.cont_unlocked.trapdoor matches 1 as @a[scores={game.trigger.purchase=4},limit=1] at @s if score #global game.data.currency matches 150.. run scoreboard players remove #global game.data.currency 150

#Arrow Dispenser
    execute unless score #global game.saves.cont_unlocked.arrow_disp matches 1 run tellraw @a[scores={game.trigger.purchase=5},limit=1] "\u00a7cYou have not yet unlocked the contraption \u00a7eArrow Dispenser\u00a7c."
    execute unless score #global game.saves.cont_unlocked.arrow_disp matches 1 as @a[scores={game.trigger.purchase=5},limit=1] at @s run playsound block.anvil.land master @s ~ ~ ~

    execute if score #global game.saves.cont_unlocked.arrow_disp matches 1 as @a[scores={game.trigger.purchase=5},limit=1] at @s run scoreboard players remove #global game.data.currency_new 150

    execute if score #global game.saves.cont_unlocked.arrow_disp matches 1 as @a[scores={game.trigger.purchase=5},limit=1] at @s unless score #global game.data.currency matches 150.. run tellraw @s ["\u00a7cYou do not have enough currency to purchase\u00a7e Arrow Dispenser\u00a7c.\u00a7a $150 \u00a7cis required, but there's only \u00a7a$",{"score":{"name":"#global","objective":"game.data.currency"},"color":"green"}," \u00a7cremaining."]
    execute if score #global game.saves.cont_unlocked.arrow_disp matches 1 as @a[scores={game.trigger.purchase=5},limit=1] at @s unless score #global game.data.currency matches 150.. run playsound block.anvil.land master @a ~ ~ ~ 1 0.5

    execute if score #global game.saves.cont_unlocked.arrow_disp matches 1 as @a[scores={game.trigger.purchase=5},limit=1] at @s if score #global game.data.currency matches 150.. run give @s minecraft:arrow[custom_name="Arrow Dispenser",lore=["","\u00a7bFunction: Projects arrows in all 4 directions. Has \u00a7c150 Durability\u00a7b.","\u00a7eTrigger: Drop the item onto a block \u00a7aadjacent \u00a7eto a path block.","\u00a7eCannot be put on any path blocks."],custom_data={id:"cont_arrow_disp",is_cont:true,item_recovery:true}] 1
    execute if score #global game.saves.cont_unlocked.arrow_disp matches 1 as @a[scores={game.trigger.purchase=5},limit=1] at @s if score #global game.data.currency matches 150.. run playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~
    execute if score #global game.saves.cont_unlocked.arrow_disp matches 1 as @a[scores={game.trigger.purchase=5},limit=1] at @s if score #global game.data.currency matches 150.. run tellraw @a [{"selector":"@s"},"\u00a7b has purchased\u00a7e Arrow Dispenser \u00a7bfor\u00a7a $150\u00a7b, with \u00a7a$",{"score":{"name":"#global","objective":"game.data.currency_new"},"color":"green"},"\u00a7b remaining."]
    execute if score #global game.saves.cont_unlocked.arrow_disp matches 1 as @a[scores={game.trigger.purchase=5},limit=1] at @s if score #global game.data.currency matches 150.. run scoreboard players remove #global game.data.currency 150

#Iron Bars
    execute unless score #global game.saves.cont_unlocked.iron_bars matches 1 run tellraw @a[scores={game.trigger.purchase=6},limit=1] "\u00a7cYou have not yet unlocked the contraption \u00a77Iron Bars\u00a7c."
    execute unless score #global game.saves.cont_unlocked.iron_bars matches 1 as @a[scores={game.trigger.purchase=6},limit=1] at @s run playsound block.anvil.land master @s ~ ~ ~

    execute if score #global game.saves.cont_unlocked.iron_bars matches 1 as @a[scores={game.trigger.purchase=6},limit=1] at @s run scoreboard players remove #global game.data.currency_new 250

    execute if score #global game.saves.cont_unlocked.iron_bars matches 1 as @a[scores={game.trigger.purchase=6},limit=1] at @s unless score #global game.data.currency matches 250.. run tellraw @s ["\u00a7cYou do not have enough currency to purchase \u00a77Iron Bars\u00a7c.\u00a7a $250 \u00a7cis required, but there's only \u00a7a$",{"score":{"name":"#global","objective":"game.data.currency"},"color":"green"}," \u00a7cremaining."]
    execute if score #global game.saves.cont_unlocked.iron_bars matches 1 as @a[scores={game.trigger.purchase=6},limit=1] at @s unless score #global game.data.currency matches 250.. run playsound block.anvil.land master @a ~ ~ ~ 1 0.5

    execute if score #global game.saves.cont_unlocked.iron_bars matches 1 as @a[scores={game.trigger.purchase=6},limit=1] at @s if score #global game.data.currency matches 250.. run give @s minecraft:iron_bars[lore=["","\u00a7bFunction: Obstructs mobs. Loses \u00a7c20 Durability \u00a7bupon contact per mob per second. Initially has \u00a7c300 Durability\u00a7b.","\u00a7eTrigger: Drop the item onto a path block."],custom_data={id:"cont_iron_bars",is_cont:true,item_recovery:true}] 1

    execute if score #global game.saves.cont_unlocked.iron_bars matches 1 as @a[scores={game.trigger.purchase=6},limit=1] at @s if score #global game.data.currency matches 250.. run playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~
    execute if score #global game.saves.cont_unlocked.iron_bars matches 1 as @a[scores={game.trigger.purchase=6},limit=1] at @s if score #global game.data.currency matches 250.. run tellraw @a [{"selector":"@s"},"\u00a7b has purchased \u00a77Iron Bars \u00a7bfor\u00a7a $250\u00a7b, with \u00a7a$",{"score":{"name":"#global","objective":"game.data.currency_new"},"color":"green"},"\u00a7b remaining."]
    execute if score #global game.saves.cont_unlocked.iron_bars matches 1 as @a[scores={game.trigger.purchase=6},limit=1] at @s if score #global game.data.currency matches 250.. run scoreboard players remove #global game.data.currency 250

#Slime Dispenser
    execute unless score #global game.saves.cont_unlocked.slime_disp matches 1 run tellraw @a[scores={game.trigger.purchase=7},limit=1] "\u00a7cYou have not yet unlocked the contraption \u00a7eSlime Dispenser\u00a7c."
    execute unless score #global game.saves.cont_unlocked.slime_disp matches 1 as @a[scores={game.trigger.purchase=7},limit=1] at @s run playsound block.anvil.land master @s ~ ~ ~

    execute if score #global game.saves.cont_unlocked.slime_disp matches 1 as @a[scores={game.trigger.purchase=7},limit=1] at @s run scoreboard players remove #global game.data.currency_new 100

    execute if score #global game.saves.cont_unlocked.slime_disp matches 1 as @a[scores={game.trigger.purchase=7},limit=1] at @s unless score #global game.data.currency matches 100.. run tellraw @s ["\u00a7cYou do not have enough currency to purchase\u00a7e Slime Dispenser\u00a7c.\u00a7a $100 \u00a7cis required, but there's only \u00a7a$",{"score":{"name":"#global","objective":"game.data.currency"},"color":"green"}," \u00a7cremaining."]
    execute if score #global game.saves.cont_unlocked.slime_disp matches 1 as @a[scores={game.trigger.purchase=7},limit=1] at @s unless score #global game.data.currency matches 100.. run playsound block.anvil.land master @a ~ ~ ~ 1 0.5

    execute if score #global game.saves.cont_unlocked.slime_disp matches 1 as @a[scores={game.trigger.purchase=7},limit=1] at @s if score #global game.data.currency matches 100.. run give @s minecraft:slime_ball[custom_name="Slime Dispenser",lore=["","\u00a7bFunction: Projects slime balls in all 4 directions which slow mobs down to half of their original speed. Has \u00a7c150 Durability\u00a7b.","\u00a7eTrigger: Drop the item onto a block \u00a7aadjacent \u00a7eto a path block.","\u00a7eCannot be put on any path blocks."],custom_data={id:"cont_slime_disp",is_cont:true,item_recovery:true}] 1
    execute if score #global game.saves.cont_unlocked.slime_disp matches 1 as @a[scores={game.trigger.purchase=7},limit=1] at @s if score #global game.data.currency matches 100.. run playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~
    execute if score #global game.saves.cont_unlocked.slime_disp matches 1 as @a[scores={game.trigger.purchase=7},limit=1] at @s if score #global game.data.currency matches 100.. run tellraw @a [{"selector":"@s"},"\u00a7b has purchased\u00a7e Slime Dispenser \u00a7bfor\u00a7a $100\u00a7b, with \u00a7a$",{"score":{"name":"#global","objective":"game.data.currency_new"},"color":"green"},"\u00a7b remaining."]
    execute if score #global game.saves.cont_unlocked.slime_disp matches 1 as @a[scores={game.trigger.purchase=7},limit=1] at @s if score #global game.data.currency matches 100.. run scoreboard players remove #global game.data.currency 100