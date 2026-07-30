/obj/item/organ/genital
	var/always_accessible = FALSE
	var/written_text = ""

/obj/item/organ/genital/is_exposed()
	if(always_accessible)
		return TRUE
	return ..()

/obj/item/organ/genital/build_from_dna(datum/dna/DNA, associated_key)
	. = ..()
	internal_fluid_maximum = internal_fluid_maximum * (DNA.features["body_size"] || 1)

// Layer offsets for genitals are defined upstream in modular_skyrat genitals.dm
