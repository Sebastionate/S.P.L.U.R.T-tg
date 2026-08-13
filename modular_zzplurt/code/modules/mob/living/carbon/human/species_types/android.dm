/datum/species/android
	mutantbladder = /obj/item/organ/bladder/cybernetic

/datum/species/android/New()
	. = ..()
	inherent_traits = LAZYLISTDUPLICATE(inherent_traits)
	LAZYADD(inherent_traits, TRAIT_NOTHIRST)
