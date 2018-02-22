//
//  MSAPIConstants.h
//  MegaShopping
//
//  Created by Megatex on 11/4/16.
//  Copyright © 2016 Gor Hakobyan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MSObjectType){
    kMSObjectTypeUser,
    kMSObjectTypeShop,
    kMSObjectTypeProduct,
    kMSObjectTypeCategory,
};

typedef NS_ENUM(NSInteger,MSAdvancedSearchDataType) {
    MSAdvancedSearchDataTypeShop,
    MSAdvancedSearchDataTypeCategory,
    MSAdvancedSearchDataTypeProduct,
    
};

typedef NS_ENUM(NSInteger,MSGlobalSearchResultType) {
    MSGlobalSearchResultTypeShops,
    MSGlobalSearchResultTypeCategories,
    MSGlobalSearchResultTypeProducts,
};

extern NSString *const kMSHTTPMethodGet;
extern NSString *const kMSHTTPMethodPost;
extern NSString *const kMSHTTPMethodPut;
extern NSString *const kMSHTTPMethodDelete;

extern NSString *const kMSProductTypeNew;
extern NSString *const kMSProductTypeBestSeller;
extern NSString *const kMSProductTypeDiscount;

@interface MSAPIConstants : NSObject

+ (NSString *)objectTypeStringFromEnum:(MSObjectType)type;
+ (MSObjectType)objectEnumTypeFromStringType:(NSString *)type;
    
+ (id)objectWithType:(MSObjectType)objectType fromJson:(NSDictionary *)objectJson;
   
@end
