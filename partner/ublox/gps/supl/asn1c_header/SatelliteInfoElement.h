/*
 * Generated by asn1c-0.9.22 (http://lionet.info/asn1c)
 * From ASN.1 module "SUPL-POS-INIT"
 * 	found in "supl.asn"
 * 	`asn1c -gen-PER -fnative-types`
 */

#ifndef	_SatelliteInfoElement_H_
#define	_SatelliteInfoElement_H_


#include <asn_application.h>

/* Including external dependencies */
#include <NativeInteger.h>
#include <constr_SEQUENCE.h>

#ifdef __cplusplus
extern "C" {
#endif

/* SatelliteInfoElement */
typedef struct SatelliteInfoElement {
	long	 satId;
	long	 iODE;
	/*
	 * This type is extensible,
	 * possible extensions are below.
	 */
	
	/* Context for parsing across buffer boundaries */
	asn_struct_ctx_t _asn_ctx;
} SatelliteInfoElement_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_SatelliteInfoElement;

#ifdef __cplusplus
}
#endif

#endif	/* _SatelliteInfoElement_H_ */
#include <asn_internal.h>
