//
//  NSString+EmailValidation.m
//  MegaShopping
//
//  Created by Megatex on 11/28/16.
//  Copyright © 2016 Gor Hakobyan. All rights reserved.
//

#import "NSString+EmailValidation.h"

@implementation NSString (EmailValidation)

- (BOOL) isValidEmail {
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

@end
