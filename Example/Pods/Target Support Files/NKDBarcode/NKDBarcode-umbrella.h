#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "JapanPostBarcode.h"
#import "NKDAbstractUPCEANBarcode.h"
#import "NKDBarcode.h"
#import "NKDBarcodeFramework.h"
#import "NKDBarcodeOffscreenView.h"
#import "NKDCodabarBarcode.h"
#import "NKDCode128Barcode.h"
#import "NKDCode39Barcode.h"
#import "NKDEAN13Barcode.h"
#import "NKDEAN8Barcode.h"
#import "NKDExtendedCode39Barcode.h"
#import "NKDIndustrialTwoOfFiveBarcode.h"
#import "NKDInterleavedTwoOfFiveBarcode.h"
#import "NKDModifiedPlesseyBarcode.h"
#import "NKDModifiedPlesseyHexBarcode.h"
#import "NKDPlanetBarcode.h"
#import "NKDPostnetBarcode.h"
#import "NKDRoyalMailBarcode.h"
#import "NKDUPCABarcode.h"
#import "NKDUPCEBarcode.h"
#import "NSString-UPCEAN.h"
#import "UIImage-NKDBarcode.h"
#import "UIImage-Normalize.h"

FOUNDATION_EXPORT double NKDBarcodeVersionNumber;
FOUNDATION_EXPORT const unsigned char NKDBarcodeVersionString[];

