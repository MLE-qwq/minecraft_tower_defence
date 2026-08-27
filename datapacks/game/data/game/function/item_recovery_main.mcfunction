#this function drop the items in the slots that is preserved for functional items (e.g. the clock, the door) into item entities and will be given back to the player, otherwise they'll get replaced with those functional items immediately and get lost

#if already finished processing for everyone, return with the removal of the tag
    execute unless entity @a[tag=!item_recovery_done] run return run tag @a remove item_recovery_done

#tag a player which hasn't done the processing
    tag @a[limit=1,tag=!item_recovery_done] add item_recovery_target_player

#stores the item in those slots into storage, and summons the item with the same data in the storage onto the face of the player by starting the function item_recovery_sub
    #slot hotbar.7
        execute as @a[tag=item_recovery_target_player] at @s if items entity @s hotbar.7 *[minecraft:custom_data~{item_recovery:true}] run data modify storage game:item_recovery item set from entity @s Inventory[{Slot:7b}]
        execute as @a[tag=item_recovery_target_player] at @s if items entity @s hotbar.7 *[minecraft:custom_data~{item_recovery:true}] run function game:item_recovery_sub with storage game:item_recovery item
    #slot hotbar.8
        execute as @a[tag=item_recovery_target_player] at @s if items entity @s hotbar.8 *[minecraft:custom_data~{item_recovery:true}] run data modify storage game:item_recovery item set from entity @s Inventory[{Slot:8b}]
        execute as @a[tag=item_recovery_target_player] at @s if items entity @s hotbar.8 *[minecraft:custom_data~{item_recovery:true}] run function game:item_recovery_sub with storage game:item_recovery item

    #slot weapon.offhand
        execute as @a[tag=item_recovery_target_player] at @s if items entity @s weapon.offhand *[minecraft:custom_data~{item_recovery:true}] run data modify storage game:item_recovery item set from entity @s equipment.offhand
        execute as @a[tag=item_recovery_target_player] at @s if items entity @s weapon.offhand *[minecraft:custom_data~{item_recovery:true}] run function game:item_recovery_sub with storage game:item_recovery item
        

tag @a[tag=item_recovery_target_player] add item_recovery_done
tag @a remove item_recovery_target_player
function game:item_recovery_main