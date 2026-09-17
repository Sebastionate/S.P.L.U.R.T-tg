//basically an altered ability of the ice demon teleport

/datum/action/cooldown/mob_cooldown/spriggan_teleport
	name = "Bluespace Teleport"
	desc = "Teleport towards a destination target!"
	button_icon = 'icons/obj/ore.dmi'
	button_icon_state = "bluespace_crystal"
	cooldown_time = 15 SECONDS
	///time delay before teleport
	var/time_delay = 3 SECONDS

/datum/action/cooldown/mob_cooldown/spriggan_teleport/Activate(atom/target_atom)
	if(isclosedturf(get_turf(target_atom)))
		owner.balloon_alert(owner, "blocked!")
		return FALSE
	animate(owner, transform = matrix().Scale(0.8), time = time_delay, easing = SINE_EASING)
	addtimer(CALLBACK(src, PROC_REF(teleport_to_turf), target_atom), time_delay)
	StartCooldown()
	return TRUE

/datum/action/cooldown/mob_cooldown/spriggan_teleport/proc/teleport_to_turf(atom/target)
	animate(owner, transform = matrix(), time = 3 SECONDS, easing = SINE_EASING)
	do_teleport(teleatom = owner, destination = target, channel = TELEPORT_CHANNEL_BLUESPACE, forced = TRUE)

#define SPRIGAN_TELEPORT_ABILITY "spriggan_teleport"
