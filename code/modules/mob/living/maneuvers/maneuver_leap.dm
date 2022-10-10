/decl/maneuver/leap
	name = "leap"
	stamina_cost = 10
	reflexive_modifier = 1.5

/decl/maneuver/leap/perform(var/mob/living/user, var/atom/target, var/strength, var/reflexively = FALSE)
	. = ..()
	if(.)
		var/old_pass_flags = user.pass_flags
		user.pass_flags |= PASS_FLAG_TABLE
		user.visible_message(SPAN_DANGER("\The [user] takes a flying leap!"))
		strength = max(2, strength * user.get_jump_distance())
		if(reflexively)
			strength *= reflexive_modifier
		user.jump_layer_shift()
		animate(user, pixel_z = 16, time = 3, easing = SINE_EASING | EASE_IN)
		animate(pixel_z = user.default_pixel_z, time = 3, easing = SINE_EASING | EASE_OUT)
		user.throw_at(get_turf(target), strength, 1, user, FALSE, CALLBACK(src, /decl/maneuver/leap/proc/end_leap, user, target, old_pass_flags))
		playsound(user, user.gender == MALE ? 'sound/effects/jump_male.ogg' : 'sound/effects/jump_female.ogg', 25, 0, 1)
		addtimer(CALLBACK(user, /mob/living/proc/jump_layer_shift_end), 4.5)

//Jumping
/atom/proc/jump_act(atom/target, mob/living/carbon/human/user)
	//No jumping on the ground dummy && No jumping in space && No jumping in straightjacket or while being incapacitated (except handcuffs) && No jumping vhile being legcuffed or locked in closet
	if(user.incapacitated(INCAPACITATION_STUNNED|INCAPACITATION_KNOCKOUT|INCAPACITATION_BUCKLED_PARTIALLY|INCAPACITATION_BUCKLED_FULLY|INCAPACITATION_FORCELYING) || user.isinspace() \
		|| istype(user.wear_suit, /obj/item/clothing/suit/straight_jacket) || istype(user.loc, /obj/structure/closet))
		return

	for(var/limbcheck in list(BP_L_LEG,BP_R_LEG))//But we need to see if we have legs.
		var/obj/item/organ/affecting = user.get_organ(limbcheck)
		if(!affecting)//Oh shit, we don't have have any legs, we can't jump.
			return

	if(user.get_stamina() <= 25)
		to_chat(user, SPAN_WARNING("You are exhausted!"))
		return

	//Nice, we can jump, let's do that then.
	animate(user, pixel_z = 16, time = 3, easing = SINE_EASING | EASE_IN)
	animate(pixel_z = user.default_pixel_z, time = 3, easing = SINE_EASING | EASE_OUT)
	playsound(user, user.gender == MALE ? 'sound/effects/jump_male.ogg' : 'sound/effects/jump_female.ogg', 25, 0, 1)
	user.visible_message("<span class='danger'>[user.name] jumps.</span>", \
					"<span class='warning'> I jump to [loc]!</span>")
	user.throw_at(target, 3, 0.5, user, FALSE, CALLBACK(src, /decl/maneuver/leap/proc/end_leap, user, target))
	user.adjust_stamina(-35+(user.get_skill_value(SKILL_HAULING)/SKILL_MAX) * 10)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)


/decl/maneuver/leap/proc/end_leap(var/mob/living/user, var/atom/target, var/pass_flag)
	user.pass_flags = pass_flag
	user.post_maneuver()

/decl/maneuver/leap/show_initial_message(var/mob/living/user, var/atom/target)
	user.visible_message(SPAN_WARNING("\The [user] crouches, preparing for a leap!"))

/decl/maneuver/leap/can_be_used_by(var/mob/living/user, var/atom/target, var/silent = FALSE)
	. = ..()
	if(.)
		var/can_leap_distance = user.get_jump_distance() * user.get_acrobatics_multiplier()
		if (can_leap_distance <= 0)
			if (!silent)
				to_chat(user, SPAN_WARNING("You can't leap in your current state."))
			return FALSE
		if (!istype(target))
			if (!silent)
				to_chat(user, SPAN_WARNING("That is not a valid leap target."))
			return FALSE
		if (get_dist(user, target) > can_leap_distance)
			if (!silent)
				to_chat(user, SPAN_WARNING("You can't leap that far."))
			return FALSE
		return TRUE

/decl/maneuver/leap/spider
	stamina_cost = 0

/decl/maneuver/leap/spider/show_initial_message(var/mob/living/user, var/atom/target)
	user.visible_message(SPAN_WARNING("\The [user] reels back and prepares to launch itself at \the [target]!"))

/decl/maneuver/leap/grab/end_leap(var/mob/living/user, var/atom/target)
	. = ..()
	if(ishuman(user) && !user.lying && ismob(target) && user.Adjacent(target))
		var/mob/living/carbon/human/H = user
		H.species.attempt_grab(H, target)
