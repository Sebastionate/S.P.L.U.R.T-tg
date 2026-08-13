/datum/species/Destroy()
	offset_features = null
	mutant_bodyparts = null
	body_markings = null
	inherent_traits = null
	return ..()

// Radiation handling
// Currently unused
/*
/datum/species/handle_radiation(mob/living/carbon/human/target_mob)
	// Check for Rad Fiend quirk
	if(HAS_TRAIT(target_mob, TRAIT_RAD_FIEND))
		// Define radiation component
		var/datum/component/irradiated/rad_effect = target_mob.GetComponent(/datum/component/irradiated)

		// Check if time threshold is met
		if(rad_effect?.beginning_of_irradiation < RADFIEND_IMMUNITY_TIME)
			// Return without effects
			return

	// Run normally
	. = ..()
*/
