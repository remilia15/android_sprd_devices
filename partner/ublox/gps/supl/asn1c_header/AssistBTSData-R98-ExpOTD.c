/*
 * Generated by asn1c-0.9.22 (http://lionet.info/asn1c)
 * From ASN.1 module "RRLP-Components"
 * 	found in "rrlp-components.asn"
 * 	`asn1c -gen-PER -fnative-types`
 */

#include "AssistBTSData-R98-ExpOTD.h"

static asn_TYPE_member_t asn_MBR_AssistBTSData_R98_ExpOTD_1[] = {
	{ ATF_NOFLAGS, 0, offsetof(struct AssistBTSData_R98_ExpOTD, expectedOTD),
		(ASN_TAG_CLASS_CONTEXT | (0 << 2)),
		-1,	/* IMPLICIT tag at current level */
		&asn_DEF_ExpectedOTD,
		0,	/* Defer constraints checking to the member type */
		0,	/* No PER visible constraints */
		0,
		"expectedOTD"
		},
	{ ATF_NOFLAGS, 0, offsetof(struct AssistBTSData_R98_ExpOTD, expOTDuncertainty),
		(ASN_TAG_CLASS_CONTEXT | (1 << 2)),
		-1,	/* IMPLICIT tag at current level */
		&asn_DEF_ExpOTDUncertainty,
		0,	/* Defer constraints checking to the member type */
		0,	/* No PER visible constraints */
		0,
		"expOTDuncertainty"
		},
};
static ber_tlv_tag_t asn_DEF_AssistBTSData_R98_ExpOTD_tags_1[] = {
	(ASN_TAG_CLASS_UNIVERSAL | (16 << 2))
};
static asn_TYPE_tag2member_t asn_MAP_AssistBTSData_R98_ExpOTD_tag2el_1[] = {
    { (ASN_TAG_CLASS_CONTEXT | (0 << 2)), 0, 0, 0 }, /* expectedOTD at 775 */
    { (ASN_TAG_CLASS_CONTEXT | (1 << 2)), 1, 0, 0 } /* expOTDuncertainty at 777 */
};
static asn_SEQUENCE_specifics_t asn_SPC_AssistBTSData_R98_ExpOTD_specs_1 = {
	sizeof(struct AssistBTSData_R98_ExpOTD),
	offsetof(struct AssistBTSData_R98_ExpOTD, _asn_ctx),
	asn_MAP_AssistBTSData_R98_ExpOTD_tag2el_1,
	2,	/* Count of tags in the map */
	0, 0, 0,	/* Optional elements (not needed) */
	-1,	/* Start extensions */
	-1	/* Stop extensions */
};
asn_TYPE_descriptor_t asn_DEF_AssistBTSData_R98_ExpOTD = {
	"AssistBTSData-R98-ExpOTD",
	"AssistBTSData-R98-ExpOTD",
	SEQUENCE_free,
	SEQUENCE_print,
	SEQUENCE_constraint,
	SEQUENCE_decode_ber,
	SEQUENCE_encode_der,
	SEQUENCE_decode_xer,
	SEQUENCE_encode_xer,
	SEQUENCE_decode_uper,
	SEQUENCE_encode_uper,
	0,	/* Use generic outmost tag fetcher */
	asn_DEF_AssistBTSData_R98_ExpOTD_tags_1,
	sizeof(asn_DEF_AssistBTSData_R98_ExpOTD_tags_1)
		/sizeof(asn_DEF_AssistBTSData_R98_ExpOTD_tags_1[0]), /* 1 */
	asn_DEF_AssistBTSData_R98_ExpOTD_tags_1,	/* Same as above */
	sizeof(asn_DEF_AssistBTSData_R98_ExpOTD_tags_1)
		/sizeof(asn_DEF_AssistBTSData_R98_ExpOTD_tags_1[0]), /* 1 */
	0,	/* No PER visible constraints */
	asn_MBR_AssistBTSData_R98_ExpOTD_1,
	2,	/* Elements count */
	&asn_SPC_AssistBTSData_R98_ExpOTD_specs_1	/* Additional specs */
};

