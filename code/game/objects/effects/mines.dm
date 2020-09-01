/obj/item/weapon/mine_old
	name = "old land mine"
	desc = "A small highly dangerous explosive that looks rusted and aged beyond use. Unlike the newer models, this one has a proximity sensor, no amount of fancy footwork will save you here."
	density = 0
	anchored = 1
	icon = 'icons/obj/machines/excelsior/objects.dmi'
	icon_state = "mine_old"
	var/triggerproc = "explode" //name of the proc thats called when the mine is triggered
	var/triggered = 0
	var/smoke_strength = 3
	layer = HIDE_LAYER
	anchored = TRUE

/obj/item/weapon/mine_old/New()
	icon_state = "mine"

/obj/item/weapon/mine_old/proc/explode(var/mob/living/M)
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread()
	triggered = 1
	s.set_up(3, 1, src)
	s.start()
	explosion(loc, 0, 3, 3, 4) //land mines are dangerous, folks.
	visible_message("\The [src.name] detonates!")
	qdel(s)
	qdel(src)

/obj/item/weapon/mine_old/attackby(obj/item/I, mob/user)
	if(QUALITY_PULSING in I.tool_qualities)
		user.visible_message(
		SPAN_DANGER("[user] starts to carefully disarm \the [src]."),
		SPAN_DANGER("You begin to carefully disarm \the [src].")
		)
	if(I.use_tool(user, src, WORKTIME_NORMAL, QUALITY_PULSING, FAILCHANCE_NORMAL,  required_stat = STAT_COG)) //disarming a mine with a multitool should be for smarties
		user.visible_message(
			SPAN_DANGER("[user] has disarmed \the [src] and it falls apart."),
			SPAN_DANGER("You have disarmed \the [src] and it falls apart!")
			)
		new /obj/item/weapon/material/shard/shrapnel/scrap(src.loc)
		new /obj/item/weapon/grenade/explosive(src.loc)
		qdel(src)
		return
	else
		user.visible_message(
			SPAN_DANGER("[user] has set off \the [src]!"))
		explode()
		return

/obj/item/weapon/mine_old/bullet_act()
	if(prob(90))
		explode()

/obj/item/weapon/mine_old/ex_act(severity)
	if(severity <= 2 || prob(90))
		explode()
	..()

/obj/item/weapon/mine_old/Crossed(AM as mob|obj)
	Bumped(AM)

/obj/item/weapon/mine_old/Bumped(mob/M as mob|obj)

	if(triggered) return

	if(ishuman(M))
		for(var/mob/O in viewers(world.view, src.loc))
			to_chat(O, "<font color='red'>[M] triggered the \icon[src] [src]</font>")
		triggered = 1
		call(src,triggerproc)(M)

