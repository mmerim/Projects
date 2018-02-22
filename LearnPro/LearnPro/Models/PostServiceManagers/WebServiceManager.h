//
//  WebServiceManager.h
//  MegaShopping
//
//  Created by Megatex on 11/21/16.
//  Copyright © 2016 Gor Hakobyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebServiceManager : NSObject

+ (void)login:(NSDictionary *)params withCompletion:( void (^) (id result, NSError *error))handler;
+ (void)checkEmail:(NSDictionary *)params withCompletion:( void (^) (id result, NSError *error))handler;
+ (void)forgotPassword:(NSDictionary *)params withCompletion:( void (^) (id result, NSError *error))handler;
+ (void)loginWithSocial:(NSDictionary *)params withCompletion:( void (^) (id result, NSError *error))handler;
+ (void)registerUser:(NSDictionary *)params withCompletion:( void (^) (id result, NSError *error))handler;
+ (void)updateUser:(NSDictionary *)params withCompletion:( void (^) (id result, NSError *error))handler;
+ (void)changePassword:(NSDictionary *)params withCompletion:( void (^) (id result, NSError *error))handler;
+ (void)syncWithSotial:(NSDictionary *)params withCompletion:( void (^) (id result, NSError *error))handler;
+ (void)orderRequest:(NSDictionary *)params withCompletion:( void (^) (id result, NSError *error))handler;

@end
