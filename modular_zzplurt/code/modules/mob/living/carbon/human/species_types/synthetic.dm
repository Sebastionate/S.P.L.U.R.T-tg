/datum/species/synthetic
	mutantbladder = /obj/item/organ/bladder/cybernetic

/datum/species/synthetic/New()
	. = ..()
	inherent_traits = LAZYLISTDUPLICATE(inherent_traits)
	LAZYADD(inherent_traits, TRAIT_NOTHIRST)

/obj/item/organ/brain/synth/Initialize(mapload) //speech bubble addition
	. = ..()
	AddComponent(/datum/component/bubble_icon_override, "machine", BUBBLE_ICON_PRIORITY_ORGAN)
