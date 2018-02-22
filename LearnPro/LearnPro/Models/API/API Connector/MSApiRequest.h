//
//  MSApiRequest.h
//  MegaShopping
//
//  Created by Megatex on 11/4/16.
//  Copyright © 2016 Gor Hakobyan. All rights reserved.
//

#import "MSBaseRequest.h"

extern NSString *const kBRApiErrorDomain;

@protocol MSApiRequestContextProvider;

@interface MSApiRequest : MSBaseRequest

@property (nonatomic, weak) id<MSApiRequestContextProvider> contextProvider;
    
- (NSDictionary *)additionalHeaders;
- (NSString *)objectType;
- (NSString *)action;
- (NSDictionary *)parameters;
- (id)bodyObject;
    
@end


@protocol MSApiRequestContextProvider <NSObject>
    
@required
- (NSURL *)baseUrl;
- (NSUInteger)authUserId;
- (NSString *)authToken;
    
@end
