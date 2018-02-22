//
//  MSApiRequest.m
//  MegaShopping
//
//  Created by Megatex on 11/4/16.
//  Copyright © 2016 Gor Hakobyan. All rights reserved.
//

#import "MSApiRequest.h"

NSString *const kBRApiErrorDomain = @"BRApiErrorDomain";

@interface MSApiRequest ()
    
@end

@implementation MSApiRequest

- (NSString *)objectType {
    return nil;
}
    
- (NSString *)action {
    return nil;
}
    
- (NSDictionary *)parameters {
    return nil;
}
    
- (id)bodyObject {
    return nil;
}
    
- (NSURL *)url {
    NSString *objectType = [self objectType];
    NSString *action = [self action];
    NSDictionary *parameters = [self parameters];
    NSURL *baseUrl = [self.contextProvider baseUrl];
    
    NSAssert(baseUrl, @"baseUrl should be set.");
    NSAssert(objectType, @"objectType should be set.");
    NSAssert(action, @"action should be set.");
    
    NSURLComponents *components = [NSURLComponents componentsWithString:[[baseUrl absoluteString] stringByAppendingFormat:@"/%@/%@", objectType, action]];
    NSMutableArray *queryItems = [NSMutableArray array];
    for (NSString *key in parameters) {
        [queryItems addObject:[NSURLQueryItem queryItemWithName:key
                                                          value:[NSString stringWithFormat:@"%@", parameters[key]]]];
    }
    //    if (![[self.HTTPMethod lowercaseString] isEqualToString:@"post"]) {
    components.queryItems = queryItems;
    //    }
    NSURL *url = components.URL;
    return url;
}
    
- (NSData *)HTTPBody {
    NSData *data = nil;
    id bodyObject = [self bodyObject];
    if (bodyObject) {
        data = [NSJSONSerialization dataWithJSONObject:bodyObject options:0 error:nil];
    }
    return data;
}
    
- (NSDictionary *)HTTPHeaders {
    NSMutableDictionary *headers = [[NSMutableDictionary alloc] init];
    [headers setObject:@"application/json" forKey:@"Content-Type"];
    NSDictionary *additionalHeaders = [self additionalHeaders];
    if (additionalHeaders) {
        [headers addEntriesFromDictionary:[self additionalHeaders]];
    }
    return [headers copy];
}
    
- (NSDictionary *)additionalHeaders {
    NSMutableDictionary *headers = [NSMutableDictionary new];
    NSUInteger authUserId = [self.contextProvider authUserId];
    if (authUserId > 0) {
        [headers setObject:[NSString stringWithFormat:@"%lu", (unsigned long)authUserId] forKey:@"auth_user_id"];
    }
    NSString *authToken = [self.contextProvider authToken];
    if (authToken) {
        [headers setObject:authToken forKey:@"auth_token"];
    }
    return [headers copy];
}
    
    static id BRJSONObjectByRemovingKeysWithNullValues(id JSONObject, NSJSONReadingOptions readingOptions) {
        if ([JSONObject isKindOfClass:[NSArray class]]) {
            NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:[(NSArray *)JSONObject count]];
            for (id value in (NSArray *)JSONObject) {
                [mutableArray addObject:BRJSONObjectByRemovingKeysWithNullValues(value, readingOptions)];
            }
            
            return (readingOptions & NSJSONReadingMutableContainers) ? mutableArray : [NSArray arrayWithArray:mutableArray];
        } else if ([JSONObject isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *mutableDictionary = [NSMutableDictionary dictionaryWithDictionary:JSONObject];
            for (id <NSCopying> key in [(NSDictionary *)JSONObject allKeys]) {
                id value = (NSDictionary *)JSONObject[key];
                if (!value || [value isEqual:[NSNull null]]) {
                    [mutableDictionary removeObjectForKey:key];
                } else if ([value isKindOfClass:[NSArray class]] || [value isKindOfClass:[NSDictionary class]]) {
                    mutableDictionary[key] = BRJSONObjectByRemovingKeysWithNullValues(value, readingOptions);
                }
            }
            
            return (readingOptions & NSJSONReadingMutableContainers) ? mutableDictionary : [NSDictionary dictionaryWithDictionary:mutableDictionary];
        }
        
        return JSONObject;
    }
    
- (void)requestFinishedWithResponseStatusCode:(NSInteger)statusCode result:(id)result error:(NSError *)error {
    if (result) {
        id object = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableContainers error:&error];
        object = BRJSONObjectByRemovingKeysWithNullValues(object, NSJSONReadingMutableContainers);
        if (!error) {
            if ([self isClientErrorResponseCode:statusCode]) {
                NSInteger errorCode = [object[@"code"] integerValue];
                NSString *errorMessage = object[@"msg"];
                NSDictionary *userInfo = nil;
                if (errorMessage) {
                    userInfo = @{NSLocalizedDescriptionKey: errorMessage};
                }
                error = [[NSError alloc] initWithDomain:kBRApiErrorDomain code:errorCode userInfo:userInfo];
            } else {
                result = object;
            }
        } else {
            error = [[NSError alloc] initWithDomain:kBRApiErrorDomain code:0 userInfo:nil];
        }
    }
    [super requestFinishedWithResponseStatusCode:statusCode result:result error:error];
}
    
- (BOOL)isClientErrorResponseCode:(NSInteger)code {
    return (code >= 400 && code < 500);
}
    
    
@end
