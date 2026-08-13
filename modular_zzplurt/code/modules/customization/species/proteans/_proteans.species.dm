/datum/species/protean/New()
	. = ..()
	inherent_traits = LAZYLISTDUPLICATE(inherent_traits)
	LAZYADD(inherent_traits, TRAIT_NOTHIRST)
