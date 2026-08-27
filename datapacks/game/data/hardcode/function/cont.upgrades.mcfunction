#Egg Dispensers
    #Damage (5): 3->5->8->11->14->17, cost: 10->20->40->65->90
    #Range (4): 1->2->3->4->5, cost: 15->30->50->80
    #Fire Rate (12): 40->35->30->25->20->18->16->14->12->10->9->8->7, cost: 10->20->30->40->55->70->85->100->115->130->150->180
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.damage matches 3 run scoreboard players set @s game.data.disp_cont.damage_next 5
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.damage matches 3 run scoreboard players set @s game.data.disp_cont.damage_cost 10
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.damage matches 5 run scoreboard players set @s game.data.disp_cont.damage_next 8
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.damage matches 5 run scoreboard players set @s game.data.disp_cont.damage_cost 20
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.damage matches 8 run scoreboard players set @s game.data.disp_cont.damage_next 11
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.damage matches 8 run scoreboard players set @s game.data.disp_cont.damage_cost 40
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.damage matches 11 run scoreboard players set @s game.data.disp_cont.damage_next 14
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.damage matches 11 run scoreboard players set @s game.data.disp_cont.damage_cost 65
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.damage matches 14 run scoreboard players set @s game.data.disp_cont.damage_next 17
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.damage matches 14 run scoreboard players set @s game.data.disp_cont.damage_cost 90
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.damage matches 17 run scoreboard players set @s game.data.disp_cont.damage_next -1
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.damage matches 17 run scoreboard players set @s game.data.disp_cont.damage_cost 0

    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.range matches 1 run scoreboard players set @s game.data.disp_cont.range_next 2
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.range matches 1 run scoreboard players set @s game.data.disp_cont.range_cost 10
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.range matches 2 run scoreboard players set @s game.data.disp_cont.range_next 3
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.range matches 2 run scoreboard players set @s game.data.disp_cont.range_cost 30
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.range matches 3 run scoreboard players set @s game.data.disp_cont.range_next 4
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.range matches 3 run scoreboard players set @s game.data.disp_cont.range_cost 50
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.range matches 4 run scoreboard players set @s game.data.disp_cont.range_next 5
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.range matches 4 run scoreboard players set @s game.data.disp_cont.range_cost 80
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.range matches 5 run scoreboard players set @s game.data.disp_cont.range_next -1
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.range matches 5 run scoreboard players set @s game.data.disp_cont.range_cost 0

    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.fire_rate matches 40 run scoreboard players set @s game.data.disp_cont.fire_rate_next 35
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.fire_rate matches 40 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 10
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.fire_rate matches 35 run scoreboard players set @s game.data.disp_cont.fire_rate_next 30
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.fire_rate matches 35 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 20
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.fire_rate matches 30 run scoreboard players set @s game.data.disp_cont.fire_rate_next 25
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.fire_rate matches 30 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 30
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.fire_rate matches 25 run scoreboard players set @s game.data.disp_cont.fire_rate_next 20
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.fire_rate matches 25 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 40
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.fire_rate matches 20 run scoreboard players set @s game.data.disp_cont.fire_rate_next 18
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.fire_rate matches 20 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 55
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.fire_rate matches 18 run scoreboard players set @s game.data.disp_cont.fire_rate_next 16
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.fire_rate matches 18 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 70
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.fire_rate matches 16 run scoreboard players set @s game.data.disp_cont.fire_rate_next 14
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.fire_rate matches 16 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 85
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.fire_rate matches 14 run scoreboard players set @s game.data.disp_cont.fire_rate_next 12
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.fire_rate matches 14 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 100
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.fire_rate matches 12 run scoreboard players set @s game.data.disp_cont.fire_rate_next 10
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.fire_rate matches 12 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 115
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.fire_rate matches 10 run scoreboard players set @s game.data.disp_cont.fire_rate_next 9
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.fire_rate matches 10 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 130
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.fire_rate matches 9 run scoreboard players set @s game.data.disp_cont.fire_rate_next 8
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.fire_rate matches 9 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 150
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.fire_rate matches 8 run scoreboard players set @s game.data.disp_cont.fire_rate_next 7
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.fire_rate matches 8 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 180
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.fire_rate matches 7 run scoreboard players set @s game.data.disp_cont.fire_rate_next -1
    execute as @e[tag=egg_disp] at @s if score @s game.data.disp_cont.fire_rate matches 7 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 0

#Water
    #Viscosity (4): 1->2->3->4->5, cost: 25->50->75->100
    execute as @e[tag=water] at @s if score @s game.data.cont.viscosity matches 1 run scoreboard players set @s game.data.cont.viscosity_next 2
    execute as @e[tag=water] at @s if score @s game.data.cont.viscosity matches 1 run scoreboard players set @s game.data.cont.viscosity_cost 25
    execute as @e[tag=water] at @s if score @s game.data.cont.viscosity matches 2 run scoreboard players set @s game.data.cont.viscosity_next 3
    execute as @e[tag=water] at @s if score @s game.data.cont.viscosity matches 2 run scoreboard players set @s game.data.cont.viscosity_cost 50
    execute as @e[tag=water] at @s if score @s game.data.cont.viscosity matches 3 run scoreboard players set @s game.data.cont.viscosity_next 4
    execute as @e[tag=water] at @s if score @s game.data.cont.viscosity matches 3 run scoreboard players set @s game.data.cont.viscosity_cost 75
    execute as @e[tag=water] at @s if score @s game.data.cont.viscosity matches 4 run scoreboard players set @s game.data.cont.viscosity_next 5
    execute as @e[tag=water] at @s if score @s game.data.cont.viscosity matches 4 run scoreboard players set @s game.data.cont.viscosity_cost 100
    execute as @e[tag=water] at @s if score @s game.data.cont.viscosity matches 5 run scoreboard players set @s game.data.cont.viscosity_next -1
    execute as @e[tag=water] at @s if score @s game.data.cont.viscosity matches 5 run scoreboard players set @s game.data.cont.viscosity_cost 0

#Trapdoor
    #Capacity (5): 2->4->6->8->10, cost: 75->150->225->300
    execute as @e[tag=trapdoor] at @s if score @s game.data.cont.capacity matches 2 run scoreboard players set @s game.data.cont.capacity_next 4
    execute as @e[tag=trapdoor] at @s if score @s game.data.cont.capacity matches 2 run scoreboard players set @s game.data.cont.capacity_cost 75
    execute as @e[tag=trapdoor] at @s if score @s game.data.cont.capacity matches 4 run scoreboard players set @s game.data.cont.capacity_next 6
    execute as @e[tag=trapdoor] at @s if score @s game.data.cont.capacity matches 4 run scoreboard players set @s game.data.cont.capacity_cost 150
    execute as @e[tag=trapdoor] at @s if score @s game.data.cont.capacity matches 6 run scoreboard players set @s game.data.cont.capacity_next 8
    execute as @e[tag=trapdoor] at @s if score @s game.data.cont.capacity matches 6 run scoreboard players set @s game.data.cont.capacity_cost 225
    execute as @e[tag=trapdoor] at @s if score @s game.data.cont.capacity matches 8 run scoreboard players set @s game.data.cont.capacity_next 10
    execute as @e[tag=trapdoor] at @s if score @s game.data.cont.capacity matches 8 run scoreboard players set @s game.data.cont.capacity_cost 300
    execute as @e[tag=trapdoor] at @s if score @s game.data.cont.capacity matches 10 run scoreboard players set @s game.data.cont.capacity_next -1
    execute as @e[tag=trapdoor] at @s if score @s game.data.cont.capacity matches 10 run scoreboard players set @s game.data.cont.capacity_cost 0

#Arrow Dispensers
    #Damage (5): 5->8->12->17->24->30, cost: 25->50->80->120->150
    #Range (5): 3->4->5->6->7->8, cost: 30->50->80->110->140
    #Fire Rate (12): 40->35->30->25->20->18->16->14->12->10->9->8->7, cost: 10->20->30->40->55->70->85->100->115->130->150->180
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.damage matches 5 run scoreboard players set @s game.data.disp_cont.damage_next 8
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.damage matches 5 run scoreboard players set @s game.data.disp_cont.damage_cost 25
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.damage matches 8 run scoreboard players set @s game.data.disp_cont.damage_next 12
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.damage matches 8 run scoreboard players set @s game.data.disp_cont.damage_cost 50
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.damage matches 12 run scoreboard players set @s game.data.disp_cont.damage_next 17
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.damage matches 12 run scoreboard players set @s game.data.disp_cont.damage_cost 80
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.damage matches 17 run scoreboard players set @s game.data.disp_cont.damage_next 24
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.damage matches 17 run scoreboard players set @s game.data.disp_cont.damage_cost 120
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.damage matches 24 run scoreboard players set @s game.data.disp_cont.damage_next 30
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.damage matches 24 run scoreboard players set @s game.data.disp_cont.damage_cost 150
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.damage matches 30 run scoreboard players set @s game.data.disp_cont.damage_next -1
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.damage matches 30 run scoreboard players set @s game.data.disp_cont.damage_cost 0

    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.range matches 3 run scoreboard players set @s game.data.disp_cont.range_next 4
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.range matches 3 run scoreboard players set @s game.data.disp_cont.range_cost 30
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.range matches 4 run scoreboard players set @s game.data.disp_cont.range_next 5
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.range matches 4 run scoreboard players set @s game.data.disp_cont.range_cost 50
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.range matches 5 run scoreboard players set @s game.data.disp_cont.range_next 6
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.range matches 5 run scoreboard players set @s game.data.disp_cont.range_cost 80
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.range matches 6 run scoreboard players set @s game.data.disp_cont.range_next 7
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.range matches 6 run scoreboard players set @s game.data.disp_cont.range_cost 110
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.range matches 7 run scoreboard players set @s game.data.disp_cont.range_next 8
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.range matches 7 run scoreboard players set @s game.data.disp_cont.range_cost 140
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.range matches 8 run scoreboard players set @s game.data.disp_cont.range_next -1
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.range matches 8 run scoreboard players set @s game.data.disp_cont.range_cost 0

    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.fire_rate matches 40 run scoreboard players set @s game.data.disp_cont.fire_rate_next 35
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.fire_rate matches 40 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 10
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.fire_rate matches 35 run scoreboard players set @s game.data.disp_cont.fire_rate_next 30
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.fire_rate matches 35 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 20
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.fire_rate matches 30 run scoreboard players set @s game.data.disp_cont.fire_rate_next 25
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.fire_rate matches 30 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 30
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.fire_rate matches 25 run scoreboard players set @s game.data.disp_cont.fire_rate_next 20
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.fire_rate matches 25 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 40
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.fire_rate matches 20 run scoreboard players set @s game.data.disp_cont.fire_rate_next 18
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.fire_rate matches 20 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 55
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.fire_rate matches 18 run scoreboard players set @s game.data.disp_cont.fire_rate_next 16
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.fire_rate matches 18 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 70
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.fire_rate matches 16 run scoreboard players set @s game.data.disp_cont.fire_rate_next 14
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.fire_rate matches 16 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 85
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.fire_rate matches 14 run scoreboard players set @s game.data.disp_cont.fire_rate_next 12
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.fire_rate matches 14 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 100
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.fire_rate matches 12 run scoreboard players set @s game.data.disp_cont.fire_rate_next 10
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.fire_rate matches 12 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 115
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.fire_rate matches 10 run scoreboard players set @s game.data.disp_cont.fire_rate_next 9
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.fire_rate matches 10 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 130
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.fire_rate matches 9 run scoreboard players set @s game.data.disp_cont.fire_rate_next 8
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.fire_rate matches 9 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 150
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.fire_rate matches 8 run scoreboard players set @s game.data.disp_cont.fire_rate_next 7
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.fire_rate matches 8 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 180
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.fire_rate matches 7 run scoreboard players set @s game.data.disp_cont.fire_rate_next -1
    execute as @e[tag=arrow_disp] at @s if score @s game.data.disp_cont.fire_rate matches 7 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 0

#Slime Dispensers
    #Duration (8): 20->30->40->50->60->70->80->90->100, cost: 20->30->40->50->60->80->100->120
    #Range (4): 2->3->4->5->6, cost: 30->50->85->120
    #Fire Rate (12): 40->35->30->25->20->18->16->14->12->10->9->8->7, cost: 10->20->30->40->55->70->85->100->115->130->150->180
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.duration matches 20 run scoreboard players set @s game.data.disp_cont.duration_next 30
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.duration matches 20 run scoreboard players set @s game.data.disp_cont.duration_cost 20
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.duration matches 30 run scoreboard players set @s game.data.disp_cont.duration_next 40
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.duration matches 30 run scoreboard players set @s game.data.disp_cont.duration_cost 30
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.duration matches 40 run scoreboard players set @s game.data.disp_cont.duration_next 50
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.duration matches 40 run scoreboard players set @s game.data.disp_cont.duration_cost 40
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.duration matches 50 run scoreboard players set @s game.data.disp_cont.duration_next 60
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.duration matches 50 run scoreboard players set @s game.data.disp_cont.duration_cost 50
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.duration matches 60 run scoreboard players set @s game.data.disp_cont.duration_next 70
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.duration matches 60 run scoreboard players set @s game.data.disp_cont.duration_cost 60
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.duration matches 70 run scoreboard players set @s game.data.disp_cont.duration_next 80
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.duration matches 70 run scoreboard players set @s game.data.disp_cont.duration_cost 80
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.duration matches 80 run scoreboard players set @s game.data.disp_cont.duration_next 90
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.duration matches 80 run scoreboard players set @s game.data.disp_cont.duration_cost 100
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.duration matches 90 run scoreboard players set @s game.data.disp_cont.duration_next 100
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.duration matches 90 run scoreboard players set @s game.data.disp_cont.duration_cost 120
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.duration matches 100 run scoreboard players set @s game.data.disp_cont.duration_next -1
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.duration matches 100 run scoreboard players set @s game.data.disp_cont.duration_cost 0

    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.range matches 2 run scoreboard players set @s game.data.disp_cont.range_next 3
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.range matches 2 run scoreboard players set @s game.data.disp_cont.range_cost 30
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.range matches 3 run scoreboard players set @s game.data.disp_cont.range_next 4
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.range matches 3 run scoreboard players set @s game.data.disp_cont.range_cost 50
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.range matches 4 run scoreboard players set @s game.data.disp_cont.range_next 5
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.range matches 4 run scoreboard players set @s game.data.disp_cont.range_cost 85
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.range matches 5 run scoreboard players set @s game.data.disp_cont.range_next 6
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.range matches 5 run scoreboard players set @s game.data.disp_cont.range_cost 120
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.range matches 6 run scoreboard players set @s game.data.disp_cont.range_next -1
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.range matches 6 run scoreboard players set @s game.data.disp_cont.range_cost 0

    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.fire_rate matches 40 run scoreboard players set @s game.data.disp_cont.fire_rate_next 35
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.fire_rate matches 40 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 10
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.fire_rate matches 35 run scoreboard players set @s game.data.disp_cont.fire_rate_next 30
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.fire_rate matches 35 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 20
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.fire_rate matches 30 run scoreboard players set @s game.data.disp_cont.fire_rate_next 25
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.fire_rate matches 30 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 30
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.fire_rate matches 25 run scoreboard players set @s game.data.disp_cont.fire_rate_next 20
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.fire_rate matches 25 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 40
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.fire_rate matches 20 run scoreboard players set @s game.data.disp_cont.fire_rate_next 18
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.fire_rate matches 20 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 55
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.fire_rate matches 18 run scoreboard players set @s game.data.disp_cont.fire_rate_next 16
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.fire_rate matches 18 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 70
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.fire_rate matches 16 run scoreboard players set @s game.data.disp_cont.fire_rate_next 14
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.fire_rate matches 16 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 85
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.fire_rate matches 14 run scoreboard players set @s game.data.disp_cont.fire_rate_next 12
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.fire_rate matches 14 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 100
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.fire_rate matches 12 run scoreboard players set @s game.data.disp_cont.fire_rate_next 10
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.fire_rate matches 12 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 115
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.fire_rate matches 10 run scoreboard players set @s game.data.disp_cont.fire_rate_next 9
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.fire_rate matches 10 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 130
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.fire_rate matches 9 run scoreboard players set @s game.data.disp_cont.fire_rate_next 8
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.fire_rate matches 9 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 150
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.fire_rate matches 8 run scoreboard players set @s game.data.disp_cont.fire_rate_next 7
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.fire_rate matches 8 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 180
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.fire_rate matches 7 run scoreboard players set @s game.data.disp_cont.fire_rate_next -1
    execute as @e[tag=slime_disp] at @s if score @s game.data.disp_cont.fire_rate matches 7 run scoreboard players set @s game.data.disp_cont.fire_rate_cost 0
