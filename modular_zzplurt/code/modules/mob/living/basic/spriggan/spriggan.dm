/// A random ghost role that can be spawned; can float around and heal people.
/mob/living/basic/spriggan

	name = "wandering dryad"
	desc = "A creature made up of warped vinery and petrified oak. It possesses a form comparable to that of a female humanoid, and between the openings in its wooden exterior is arcane glow of some sort."
	icon = 'icons/mob/nonhuman-player/alien.dmi'
	icon_state = "alienh"
	icon_living = "alienh"
	icon_dead = "alienh_dead"
	icon_gib = "syndicate_gib"
	gender = FEMALE
	status_flags = CANPUSH
	butcher_results = list(
		/obj/item/food/meat/slab/xeno = 4,
		/obj/item/stack/sheet/animalhide/xeno = 1,
	)

    speak_emote = list("hums an eerie tune")
    maxHealth = 200
    health = 200
    obj_damage = 35
    melee_damage_upper = 10
    melee_damage_lower = 10
    attack_vis_effect = ATTACK_EFFECT_CLAW
	melee_attack_cooldown = 1.2 SECONDS
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slashes"
	death_message = "quickly withers and crumples over, dead."
    attack_sound = 'sound/items/weapons/bladeslice.ogg'
	combat_mode = TRUE
	damage_coeff = list(BRUTE = 0.7, BURN = 0.7, TOX = 0.7, STAMINA = 0, OXY = 0)

	basic_mob_flags = FLAMMABLE_MOB
	gold_core_spawnable = NO_SPAWN

	habitable_atmos = null
	unsuitable_atmos_damage = FALSE
	unsuitable_heat_damage = 20
	ADD_TRAIT(src, TRAIT_MEDICAL_HUD, INNATE_TRAIT)

/mob/living/basic/spriggan/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/footstep, footstep_type = FOOTSTEP_MOB_CLAW)
    AddComponent(\
		/datum/component/healing_touch,\
		heal_brute = healing_amount,\
		heal_burn = healing_amount,\
		heal_tox = healing_amount,\
		heal_oxy = healing_amount,\
		heal_time = 0,\
		action_text = "",\
		complete_text = "",\
		required_modifier = RIGHT_CLICK,\
		extra_checks = CALLBACK(src, PROC_REF(is_deployed)),\
		after_healed = CALLBACK(src, PROC_REF(after_healed)),\
	)

/// Called after we heal someone, show some visuals
/mob/living/basic/spriggan/proc/after_healed(mob/living/healed)
	do_attack_animation(healed, ATTACK_EFFECT_PUNCH)
	healed.visible_message(
		message = span_notice("[src] heals [healed]!"),
		self_message = span_userdanger("[src] heals you!"),
		vision_distance = COMBAT_MESSAGE_RANGE,
		ignored_mobs = src,
	)
	to_chat(src, span_notice("You heal [healed]!"))
	playsound(healed, attack_sound, 50, TRUE, TRUE, frequency = -1)
