//
//  UIColor+MSAdditions.m
//  MegaShopping
//
//  Created by Gor Hakobyan on 10/2/16.
//  Copyright © 2016 Gor Hakobyan. All rights reserved.
//

#import "UIColor+MSAdditions.h"

@implementation UIColor (MSAdditions)

+ (UIColor *)ms_colorFromHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:alpha];
}

+ (UIColor *)ms_greenColor {
    return [UIColor ms_colorFromHexString:@"#7ac101" alpha:1];
}

+ (UIColor *)ms_yellowColor {
    return [UIColor ms_colorFromHexString:@"#ffcc00" alpha:1];
}

+ (UIColor *)ms_backgroundColor {
    return [UIColor ms_colorFromHexString:@"#7f8085" alpha:1];
}


+ (UIColor *)ms_orangeColor {
    return [UIColor ms_colorFromHexString:@"#d78400" alpha:1.0];
}

+ (UIColor *)ms_qaqColor {
    return [UIColor ms_colorFromHexString:@"#8D613E" alpha:1.0];
}



@end
