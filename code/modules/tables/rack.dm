/obj/structure/table/rack
	name = "rack"
	desc = "Different from the medieval version."
	icon = 'icons/obj/objects.dmi'
	icon_state = "rack"
	can_plate = 0
	can_reinforce = 0
	flipped = -1

/obj/structure/table/rack/New()
	..()
	verbs -= /obj/structure/table/verb/do_flip
	verbs -= /obj/structure/table/proc/do_put

/obj/structure/table/rack/update_connections()
	return

/obj/structure/table/rack/update_desc()
	return

/obj/structure/table/rack/update_icon()
	return

/obj/structure/table/rack/shelf
	name = "shelf"
	desc = "For showing off your collections of dust, electronics, the heads of your enemies and tools."
	icon_state = "shelf"

/obj/structure/table/rack/dungeons
	name = "fortress table"
	desc = "A grand wooden table for adventurers of old."
	icon = 'icons/obj/structures.dmi'
	icon_state = "bigtable"

/obj/structure/table/rack/dungeonsmid1
	name = "fortress side table"
	desc = "A thin wooden table for storing equipment."
	icon = 'icons/obj/structures.dmi'
	icon_state = "thintable"

/obj/structure/table/rack/dungeonsmid2
	name = "fortress side table"
	desc = "A thin wooden table for storing equipment."
	icon = 'icons/obj/structures.dmi'
	icon_state = "thintable2"
