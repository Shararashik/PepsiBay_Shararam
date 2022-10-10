/obj/structure/body1
	name = "rotting body"
	desc = "Rotting and festering. Seems like it was here for a while."
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "dead1"
	layer = ABOVE_HUMAN_LAYER
	density = 0
	anchored = 1
	w_class = ITEM_SIZE_NORMAL

/obj/structure/body1/New()
	..()

/obj/structure/body1/attackby(obj/item/I, mob/user)
	to_chat(user, "<span class='warning'>\The [src] doesn't seem to be very alive!</span>")
	return

/obj/structure/body2
	name = "rotting body"
	desc = "Rotting and festering. Seems like it was here for a while."
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "dead2"
	layer = ABOVE_HUMAN_LAYER
	density = 0
	anchored = 1
	w_class = ITEM_SIZE_NORMAL

/obj/structure/body2/New()
	..()

/obj/structure/body2/attackby(obj/item/I, mob/user)
	to_chat(user, "<span class='warning'>\The [src] doesn't seem to be very alive!</span>")
	return

/obj/structure/body3
	name = "rotting body on a spike"
	desc = "Rotting and festering. Seems like it was here for a while. Is impaled on a spike."
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "dead3"
	layer = ABOVE_HUMAN_LAYER
	density = 0
	anchored = 1
	w_class = ITEM_SIZE_NORMAL

/obj/structure/body3/New()
	..()

/obj/structure/body3/attackby(obj/item/I, mob/user)
	to_chat(user, "<span class='warning'>\The [src] doesn't seem to be very alive!</span>")
	return

/obj/structure/microscope
	name = "microscope"
	desc = "A microscope. It's broken."
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "microscope1"
	layer = ABOVE_WINDOW_LAYER
	density = 0

/obj/structure/minimap
	name = "minimap"
	desc = "Minimap. Doesn't do anything."
	icon = 'icons/obj/computer.dmi'
	icon_state = "maptable"
	layer = ABOVE_WINDOW_LAYER
	density = 0
	anchored = 1

/obj/structure/serverrack
	name = "server rack"
	desc = "A rack full of hard drives, micro-computers, and ethernet cables. Doesn't do anything."
	icon = 'icons/obj/computer.dmi'
	icon_state = "rackframe"
	layer = ABOVE_WINDOW_LAYER
	density = 1
	anchored = 1

/obj/structure/orbitcontroller
	name = "orbit controller"
	desc = "Stable ship orbit. Doesn't do anything."
	icon = 'icons/obj/computer.dmi'
	icon_state = "orbit_control"
	layer = ABOVE_WINDOW_LAYER
	density = 1
	anchored = 1

/obj/structure/datalogs
	name = "data logs"
	desc = "Data machine. Doesn't do anything."
	icon = 'icons/obj/computer.dmi'
	icon_state = "data_logs"
	layer = ABOVE_WINDOW_LAYER
	density = 1
	anchored = 1

/obj/structure/datamonitor
	name = "data monitor"
	desc = "Data machine. Doesn't do anything."
	icon = 'icons/obj/computer.dmi'
	icon_state = "data_monitor"
	layer = ABOVE_WINDOW_LAYER
	density = 1
	anchored = 1

/obj/structure/datatraffic
	name = "data traffic"
	desc = "Data machine. Doesn't do anything."
	icon = 'icons/obj/computer.dmi'
	icon_state = "data_traffic"
	layer = ABOVE_WINDOW_LAYER
	density = 1
	anchored = 1

/obj/structure/blackbox
	name = "black box"
	desc = "Store data."
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "blackbox"
	layer = ABOVE_WINDOW_LAYER
	density = 1
	anchored = 1

/obj/structure/aiint
	name = "ai interface"
	desc = "AI interface."
	icon = 'icons/obj/ai.dmi'
	icon_state = "hydra"
	layer = ABOVE_WINDOW_LAYER
	density = 0
	anchored = 1

/obj/structure/serverai
	name = "ai server"
	desc = "AI server."
	icon = 'icons/obj/computer.dmi'
	icon_state = "server"
	layer = ABOVE_WINDOW_LAYER
	density = 1
	anchored = 1

/obj/structure/fulepump
	name = "fuel pump"
	desc = "Fuel pump."
	icon = 'icons/obj/fulepump.dmi'
	icon_state = "fuelpump"
	layer = ABOVE_WINDOW_LAYER
	density = 1
	anchored = 1

/obj/structure/fault
	name = "some broken device"
	desc = "A weird device. Doesn't do anything."
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "fault"
	layer = ABOVE_WINDOW_LAYER
	density = 0
	anchored = 1

/obj/structure/fault2
	name = "some working device"
	desc = "A weird device. Doesn't do anything."
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "secimp"
	layer = ABOVE_WINDOW_LAYER
	density = 1
	anchored = 1

/obj/structure/hospitaltech1
	name = "some hospital device"
	desc = "A weird hospital device. Doesn't do anything."
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "a3"
	layer = ABOVE_WINDOW_LAYER
	density = 1
	anchored = 1

/obj/structure/hospitaltech2
	name = "some hospital device"
	desc = "A weird hospital device. Doesn't do anything."
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "synth2"
	layer = ABOVE_WINDOW_LAYER
	density = 1
	anchored = 1

/obj/structure/hospitaltech3
	name = "some hospital device"
	desc = "A weird hospital device. Doesn't do anything."
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "a9"
	layer = ABOVE_WINDOW_LAYER
	density = 1
	anchored = 1

/obj/structure/merzikas
	name = "merzikas"
	desc = "A lost soul."
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "merzikas"
	layer = ABOVE_WINDOW_LAYER
	density = 0
	anchored = 1

/obj/structure/merzikas2
	name = "merzikas"
	desc = "A lost soul."
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "merzikas2"
	layer = ABOVE_WINDOW_LAYER
	density = 0
	anchored = 1

/obj/structure/hellmushroom
	name = "flesh mushroom"
	desc = "A big mushroom with veins with blood running through."
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "hellmushroom"
	layer = ABOVE_WINDOW_LAYER
	density = 1
	anchored = 1

/obj/structure/hellhead
	name = "flesh head"
	desc = "A head with flesh and bone that seems to levitate."
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "hellhead"
	layer = ABOVE_WINDOW_LAYER
	density = 0
	anchored = 1

/obj/structure/hellskull
	name = "skull"
	desc = "A lost soul."
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "hellskull"
	layer = ABOVE_WINDOW_LAYER
	density = 0
	anchored = 1

/obj/structure/hellskulls
	name = "skull"
	desc = "A lost soul."
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "hellskulls"
	layer = ABOVE_WINDOW_LAYER
	density = 0
	anchored = 1

/obj/structure/bloodveins
	name = "veins"
	desc = "Looks like veins with blood running through them."
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "bloodveins"
	layer = ABOVE_WINDOW_LAYER
	density = 0
	anchored = 1

/obj/structure/bloodflower
	name = "blood flowers"
	desc = "Looks like flowers made of flesh."
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "bloodflower"
	layer = ABOVE_WINDOW_LAYER
	density = 0
	anchored = 1

/obj/structure/gore
	name = "pile of gore"
	desc = "Looks like a pile of flesh and blood."
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "gore"
	layer = ABOVE_WINDOW_LAYER
	density = 0
	anchored = 1

/obj/structure/statue
	name = "statue"
	desc = "Looks like a columm made of flesh and bone."
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "statue"
	layer = ABOVE_WINDOW_LAYER
	density = 1
	anchored = 1

/obj/structure/merzikas3
	name = "Merzikas"
	desc = "A lost soul."
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "merzikas3"
	layer = ABOVE_WINDOW_LAYER
	density = 1
	anchored = 1

/obj/structure/hellglos
	name = "flesh glos"
	desc = "A greenish light source."
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "hellglos"
	layer = ABOVE_WINDOW_LAYER
	density = 1
	anchored = 1

/obj/structure/hellplant2
	name = "flesh plant"
	desc = "A plant of sorts. Looks alive."
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "hellplant2"
	layer = ABOVE_WINDOW_LAYER
	density = 0
	anchored = 1

/obj/structure/bloodworms
	name = "blood worms"
	desc = "A bunch of worms."
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "bloodworms"
	layer = ABOVE_WINDOW_LAYER
	density = 0
	anchored = 1

/obj/structure/hellcage
	name = "flesh cage"
	desc = "A cage of sorts to torture the damned."
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "hellcage"
	layer = ABOVE_WINDOW_LAYER
	density = 1
	anchored = 1

/obj/structure/bloodsucker
	name = "blood sucker"
	desc = "What is that thing??"
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "bloodsucker"
	layer = ABOVE_WINDOW_LAYER
	density = 0
	anchored = 1

/obj/structure/hellsign
	name = "sign"
	desc = "Eternal Suffering."
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "hellsign"
	layer = ABOVE_WINDOW_LAYER
	density = 0
	anchored = 1

/obj/structure/hospitaltech4
	name = "some hospital device"
	desc = "A weird hospital device. Doesn't do anything."
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "a10"
	layer = ABOVE_WINDOW_LAYER
	density = 1
	anchored = 1

/obj/structure/hospitaltech5
	name = "some hospital device"
	desc = "A weird hospital device. Doesn't do anything."
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "a11"
	layer = ABOVE_WINDOW_LAYER
	density = 1
	anchored = 1

/obj/structure/hospitaltech6
	name = "some hospital device"
	desc = "A weird hospital device. Doesn't do anything except...work on something."
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "a13"
	layer = ABOVE_WINDOW_LAYER
	density = 1
	anchored = 1

/obj/structure/woodenclock
	name = "old wooden clock"
	desc = "An old, wooden clock. Tick tack."
	icon = 'icons/obj/miscobjs.dmi'
	icon_state = "pclock"
	layer = ABOVE_WINDOW_LAYER
	density = 1
	anchored = 1
