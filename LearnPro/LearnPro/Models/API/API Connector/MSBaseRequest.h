//
//  MSBaseRequest.h
//  MegaShopping
//
//  Created by Megatex on 11/4/16.
//  Copyright © 2016 Gor Hakobyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSRequestToken.h"
#import "MSAPIConstants.h"

typedef void(^RequestCallback)(id result, NSError *error);

@interface MSBaseRequest : NSObject
    
    - (NSURL *)url;
    - (NSString *)HTTPMethod;
    - (NSData *)HTTPBody;
    - (NSDictionary *)HTTPHeaders;
    
    - (void)executeWithCallback:(RequestCallback)callback;
    - (void)requestFinishedWithResponseStatusCode:(NSInteger)statusCode result:(id)result error:(NSError *)error;

@end
