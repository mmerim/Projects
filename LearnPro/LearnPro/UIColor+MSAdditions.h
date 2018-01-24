//
//  UIColor+MSAdditions.h
//  MegaShopping
//
//  Created by Gor Hakobyan on 10/2/16.
//  Copyright © 2016 Gor Hakobyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (MSAdditions)

+ (UIColor *)ms_colorFromHexString:(NSString *)hexString alpha:(CGFloat)alpha;
+ (UIColor *)ms_yellowColor;
+ (UIColor *)ms_greenColor;
+ (UIColor *)ms_backgroundColor;
+ (UIColor *)ms_orangeColor;
+ (UIColor *)ms_qaqColor;

@end
