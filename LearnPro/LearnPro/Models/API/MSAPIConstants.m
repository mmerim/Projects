//
//  MSAPIConstants.m
//  MegaShopping
//
//  Created by Megatex on 11/4/16.
//  Copyright © 2016 Gor Hakobyan. All rights reserved.
//

#import "MSAPIConstants.h"
//#import "MSUser.h"

NSString *const kMSHTTPMethodGet = @"GET";
NSString *const kMSHTTPMethodPost = @"POST";
NSString *const kMSHTTPMethodPut = @"PUT";
NSString *const kMSHTTPMethodDelete = @"DELETE";

NSString *const kMSProductTypeNew = @"new";
NSString *const kMSProductTypeBestSeller = @"bestseller";
NSString *const kMSProductTypeDiscount = @"discount";

@implementation MSAPIConstants

+ (NSString *)objectTypeStringFromEnum:(MSObjectType)type {
    NSString *objectType = @"";
    switch (type) {
        case kMSObjectTypeUser:
        objectType = @"user";
        break;
        case kMSObjectTypeProduct:
        objectType = @"product";
        break;
        case kMSObjectTypeShop:
        objectType = @"shop";
        break;
        case kMSObjectTypeCategory:
        objectType = @"category";
        break;
        default:
        break;
    }
    return objectType;
}

+ (MSObjectType)objectEnumTypeFromStringType:(NSString *)type {
    MSObjectType objectType = NSNotFound;
    if ([@"user" isEqualToString:type]) {
        objectType = kMSObjectTypeUser;
    } else if ([@"product" isEqualToString:type]) {
        objectType = kMSObjectTypeProduct;
    } else if ([@"shop" isEqualToString:type]) {
        objectType = kMSObjectTypeShop;
    } else if ([@"category" isEqualToString:type]) {
        objectType = kMSObjectTypeCategory;
    }
    return objectType;
}
    
+ (id)objectWithType:(MSObjectType)objectType fromJson:(NSDictionary *)objectJson {
    id object = nil;
    switch (objectType) {
        case kMSObjectTypeUser:
//        object = [[MSUser alloc] initFromDictionary:objectJson];
        break;
        case kMSObjectTypeProduct:
        //object =
        break;
        case kMSObjectTypeShop:
        //object =
        break;
        case kMSObjectTypeCategory:
        //object = 
        break;
        default:
        break;
    }
    return object;
}
    
    
    
@end
