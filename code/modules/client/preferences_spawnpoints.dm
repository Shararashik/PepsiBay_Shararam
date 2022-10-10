GLOBAL_VAR(spawntypes)

/proc/spawntypes()
	if(!GLOB.spawntypes)
		GLOB.spawntypes = list()
		for(var/type in typesof(/datum/spawnpoint)-/datum/spawnpoint)
			var/datum/spawnpoint/S = type
			var/display_name = initial(S.display_name)
			if((display_name in GLOB.using_map.allowed_spawns) || initial(S.always_visible))
				GLOB.spawntypes[display_name] = new S
	return GLOB.spawntypes

/datum/spawnpoint
	var/msg		  //Message to display on the arrivals computer.
	var/list/turfs   //List of turfs to spawn on.
	var/display_name //Name used in preference setup.
	var/always_visible = FALSE	// Whether this spawn point is always visible in selection, ignoring map-specific settings.
	var/list/restrict_job = null
	var/list/disallow_job = null

/datum/spawnpoint/proc/check_job_spawning(job)
	if(restrict_job && !(job in restrict_job))
		return 0

	if(disallow_job && (job in disallow_job))
		return 0

	return 1

//Called after mob is created, moved to a turf and equipped.
/datum/spawnpoint/proc/after_join(mob/victim)
	return

#ifdef UNIT_TEST
/datum/spawnpoint/Del()
	crash_with("Spawn deleted: [log_info_line(src)]")
	..()

/datum/spawnpoint/Destroy()
	crash_with("Spawn destroyed: [log_info_line(src)]")
	. = ..()
#endif

/datum/spawnpoint/arrivals
	display_name = "Arrivals Shuttle"
	msg = "has arrived on the station"

/datum/spawnpoint/arrivals/New()
	..()
	turfs = GLOB.latejoin

/datum/spawnpoint/gateway
	display_name = "Gateway"
	msg = "has completed translation from offsite gateway"

/datum/spawnpoint/gateway/New()
	..()
	turfs = GLOB.latejoin_gateway

/datum/spawnpoint/cryo
	display_name = "Cryogenic Storage"
	msg = "has completed cryogenic revival"
	disallow_job = list("Robot", "Commanding Officer")

/datum/spawnpoint/cryo/New()
	..()
	turfs = GLOB.latejoin_cryo

/datum/spawnpoint/cryo/after_join(mob/living/carbon/human/victim)
	if(!istype(victim))
		return
	var/area/A = get_area(victim)
	for(var/obj/machinery/cryopod/C in A)
		if(!C.occupant)
			C.set_occupant(victim, 1)
			victim.Sleeping(rand(1,6))
			if(!victim.isSynthetic())
				give_effect(victim)
				give_advice(victim)
			return

/datum/spawnpoint/cryo/proc/give_advice(mob/H)
	var/desc = pick(
	"<span class='notice'>Вы практически не помните, что происходило в вашей прошлой смене... Это странно! Надо подняться на мостик, там меня ждут брифинг и одежда...</span>",
	"<span class='notice'>Вязкая сонливость окутывает вас. Надо подняться на мостик, там меня ждут брифинг и одежда...</span>",
	"<span class='notice'>Хм... А мне точно не должны платить больше за то, что я делаю в этой дыре? Надо подняться на мостик, там меня ждут брифинг и одежда...</span>",
	"<span class='notice'>Вы чувствуете раздражение и лёгкую обиду. Криокапсула, теснота корабля, задержки с едой... Надо подняться на мостик, там меня ждут брифинг и одежда...</span>",
	"<span class='notice'>Вы чувствуете испуг и головокружение. Надо подняться на мостик, там меня ждут брифинг и одежда...</span>")
	to_chat(H, desc)
	return TRUE

/datum/spawnpoint/cryo/proc/give_effect(mob/living/carbon/human/H)
	var/message = ""
	if(prob(20)) //starvation
		message += "<span class='warning'>Кажется, вы забыли поесть перед тем, как уйти в сон... </span>"
		H.nutrition = rand(0,200)
		H.hydration = rand(0,200)
	if(prob(15)) //stutterting and jittering (because of cold?)
		message += "<span class='warning'>Трясет от холода. </span>"
		H.make_jittery(120)
		H.stuttering = 20
	if(prob(5)) //vomit
		message += "<span class='warning'>Тошнит... </span>"
		H.vomit()
	if(!message)
		message += "<span class='warning'>Кажется, в этот раз без осложнений... Правда, выспаться в саркофаге всё равно не удалось. </span>"
	else
		message += "<span class='warning'>Не удалось даже нормально выспаться в этом гробу... </span>"
	to_chat(H, message)
	return TRUE

/datum/spawnpoint/cryocommand
	display_name = "Command Cryogenic Storage"
	msg = "has completed cryogenic revival"
	restrict_job = list("Commanding Officer")

/datum/spawnpoint/cryocommand/New()
	..()
	turfs = GLOB.latejoin_cryo_captain

/datum/spawnpoint/cryocommand/after_join(mob/living/carbon/human/victim)
	if(!istype(victim))
		return
	var/area/A = get_area(victim)
	for(var/obj/machinery/cryopod/C in A)
		if(!C.occupant)
			C.set_occupant(victim, 1)
			victim.Sleeping(rand(1,6))
			if(!victim.isSynthetic())
				give_effect(victim)
				give_advice(victim)
			return

/datum/spawnpoint/cryocommand/proc/give_advice(mob/H)
	var/desc = pick(
	"<span class='notice'>Вы практически не помните, что происходило в вашей прошлой смене... Это странно! Надо подняться на мостик, там меня ждут брифинг и одежда...</span>",
	"<span class='notice'>Вязкая сонливость окутывает вас. Надо подняться на мостик, там меня ждут брифинг и одежда...</span>",
	"<span class='notice'>Хм... А мне точно не должны платить больше за то, что я делаю в этой дыре? Надо подняться на мостик, там меня ждут брифинг и одежда...</span>",
	"<span class='notice'>Вы чувствуете раздражение и лёгкую обиду. Криокапсула, теснота корабля, задержки с едой... Надо подняться на мостик, там меня ждут брифинг и одежда...</span>",
	"<span class='notice'>Вы чувствуете испуг и головокружение. Надо подняться на мостик, там меня ждут брифинг и одежда...</span>")
	to_chat(H, desc)
	return TRUE

/datum/spawnpoint/cryocommand/proc/give_effect(mob/living/carbon/human/H)
	var/message = ""
	if(prob(20)) //starvation
		message += "<span class='warning'>Кажется, вы забыли поесть перед тем, как уйти в сон... </span>"
		H.nutrition = rand(0,200)
		H.hydration = rand(0,200)
	if(prob(15)) //stutterting and jittering (because of cold?)
		message += "<span class='warning'>Трясет от холода. </span>"
		H.make_jittery(120)
		H.stuttering = 20
	if(prob(5)) //vomit
		message += "<span class='warning'>Тошнит... </span>"
		H.vomit()
	if(!message)
		message += "<span class='warning'>Кажется, в этот раз без осложнений... Правда, выспаться в саркофаге всё равно не удалось. </span>"
	else
		message += "<span class='warning'>Не удалось даже нормально выспаться в этом гробу... </span>"
	to_chat(H, message)
	return TRUE

/datum/spawnpoint/cyborg
	display_name = "Cyborg Storage"
	msg = "has been activated from storage"
	restrict_job = list("Robot")

/datum/spawnpoint/cyborg/New()
	..()
	turfs = GLOB.latejoin_cyborg

/datum/spawnpoint/default
	display_name = DEFAULT_SPAWNPOINT_ID
	msg = "has arrived on the station"
	always_visible = TRUE
