//
//  MSApi.m
//  MegaShopping
//
//  Created by Megatex on 11/4/16.
//  Copyright © 2016 Gor Hakobyan. All rights reserved.
//

#import "MSApi.h"
//#import "AFNetworking.h"
//#import "MSApplicationSettings.h"

//#import "BRAbstractBackendGateway.h"


#define RUNSCOPE

@interface MSRequest ()

@property (nonatomic, readwrite) BOOL executing;
@property (nonatomic, strong) NSMutableURLRequest *taskRequest;
    
@end


@interface MSApi ()


    
@end

@implementation MSApi

- (NSString *)endPoint{
    return @"api";
}
    
- (NSString *)urlString {
    NSString *baseUrl = [self baseUrlString];
    NSString *path  = [NSString stringWithFormat:@"%@/%@", baseUrl, [self endPoint]];
    return path;
}
    
- (NSString *)baseUrlString {
    NSString *url = @"http://mshop.am:8080/api/v1";  //To add
    return url;
}
    
- (instancetype)initWithParams:(NSDictionary *)params method:(NSString *)method {
    NSString *path = [NSString stringWithFormat:@"%@", [self urlString]];
    
    NSURLComponents *components = [NSURLComponents componentsWithString:path];
    NSMutableArray *queryItems = [NSMutableArray array];
    for (NSString *key in params) {
        id val = params[key];
        if ([val isKindOfClass:[NSNumber class]]) {
            val = [val stringValue];
        } else if ([val isKindOfClass:[NSArray class]] || [val isKindOfClass:[NSDictionary class]]) {
            val = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:val options:0 error:nil] encoding:NSUTF8StringEncoding];
        } else if (![val isKindOfClass:[NSString class]]) {
            val = [NSString stringWithFormat:@"%@", val];
        }
        [queryItems addObject:[NSURLQueryItem queryItemWithName:key
                                                          value:val]];
    }
    if (queryItems.count) {
        components.queryItems = queryItems;
    }
    NSURL *url = components.URL;
    path = [url absoluteString];
    NSLog(@"Request : %@",path);
    self = [super initWithUrlString:path method:method params:nil];
    if (self) {
        [self.taskRequest addValue:@"c0ee5dc535ae20f9fc9d209e7b93b4d552ed3c7c34307f10324c1956f22629c1" forHTTPHeaderField:@"cli-session"];
//        NSInteger userId = [MSApi authUserId];
//        NSString *token = [MSApi authToken];
//        if (userId) {
//            [self.taskRequest addValue:[@(userId) stringValue] forHTTPHeaderField:@"auth_user_id"];
//        }
//        if (token) {
//            [self.taskRequest addValue:token forHTTPHeaderField:@"auth_token"];
//        }
    }
    return self;
}
    
- (void)requestDidFinish:(id)responseObject response:(NSURLResponse * _Nonnull)response {
    id result = nil;
    NSError *error = nil;
    if (responseObject) {
        NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
        if ([self isClientErrorResponseCode:statusCode]) {
            NSInteger errorCode = [responseObject[@"code"] integerValue];
            NSString *errorMessage = responseObject[@"msg"];
            NSDictionary *userInfo = nil;
            if (errorMessage) {
                userInfo = @{NSLocalizedDescriptionKey: errorMessage};
            }
            error = [NSError errorWithDomain:@"BRApiErrorDomain" code:errorCode userInfo:userInfo];
        } else {
            result = responseObject;
        }
    }
    
    self.executing = NO;
    if (self.callback) {
        self.callback(self, result, error);
    }
    if (self.completionBlock) {
        self.completionBlock(self, responseObject, response);
    }
}
    
- (void)requestDidFail:(NSError *)error response:(NSURLResponse * _Nonnull)response {
    NSLog(@"Connection ERROR: NSError query result: %@", error);
    self.executing = NO;
    if (self.callback) {
        self.callback(self, nil, error);
    }
    if (self.failureBlock) {
        self.failureBlock(self, error, response);
    }
}
    
- (void)requestDidFail:(NSError *)error responseObject:(id)responseObject response:(NSURLResponse *)response {
    NSLog(@"Connection ERROR: NSError query result: %@", error);
    NSString *defaultDescription = NSLocalizedString(@"Sorry, something went wrong.",);
    error = [NSError errorWithDomain:error.domain code:error.code userInfo:@{NSLocalizedDescriptionKey : defaultDescription}];
    NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
    if ([self isClientErrorResponseCode:statusCode]) {
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            NSInteger errorCode = [responseObject[@"code"] integerValue];
            NSString *errorMessage = responseObject[@"msg"];
            NSDictionary *userInfo = nil;
            if (errorMessage) {
                userInfo = @{NSLocalizedDescriptionKey: errorMessage};
            }
            else {
                userInfo = @{NSLocalizedDescriptionKey: defaultDescription};
            }
            error = [NSError errorWithDomain:@"BRApiErrorDomain" code:errorCode userInfo:userInfo];
        }
    }
    self.executing = NO;
    if (self.callback) {
        self.callback(self, nil, error);
    }
    if (self.failureBlock) {
        self.failureBlock(self, error, response);
    }
}
    
- (BOOL)isClientErrorResponseCode:(NSInteger)code {
    return (code >= 400 && code < 500);
}
    
    //TODO::Need to refactor
#pragma mark -
//+ (NSInteger)authUserId {
//    return [[[NSUserDefaults standardUserDefaults] objectForKey:kMSAuthUserIdKey] integerValue];
//}
//    
//+ (NSString *)authToken {
//    return [[NSUserDefaults standardUserDefaults] objectForKey:kMSAuthTokenKey];
//}
    
    
@end
