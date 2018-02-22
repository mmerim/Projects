//
//  WebServiceManager.m
//  MegaShopping
//
//  Created by Megatex on 11/21/16.
//  Copyright © 2016 Gor Hakobyan. All rights reserved.
//

#import "WebServiceManager.h"
#import "JSON.h"
#import "NSDictionary+UrlEncoding.h"
#import "NSURLSession+Addition.h"
#import "Reachability.h"
#import <CommonCrypto/CommonCryptor.h>

static NSString *wsUrl = @"-----"; //http://mshop.am:8083/api/v1/customer/auth/
//static NSString *aa = @"49779dff4318c4fa4d57ec2b2dc4f7881ea637c956bef5461375d41b9254a88f";
//static NSString *name = @"Cli-Session";

@implementation WebServiceManager

+ (void)login:(NSDictionary *)params withCompletion:( void (^) (id result, NSError *error))handler {
    NSMutableURLRequest *request = [self requestForPostMethod:@"signin" withParams:[params urlEncodedString]];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSURLResponse* response = nil;
        NSError *error = nil;
        NSData *data = [NSURLSession sendSynchronousRequest:request returningResponse:&response error:&error];
        dispatch_async(dispatch_get_main_queue(), ^(void){
            NSDictionary *dict = [[NSDictionary alloc]initWithDictionary:[data objectFromJSONData]];
            if (dict[@"error"]) {
                NSError *aError = dict[@"error"][@"message"];
                handler(nil, aError);
            } else {
                Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
                NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
                if (networkStatus == NotReachable) {
                    NSError *aError = (NSError *)@"No Internet Connection. Please try again.";
                    handler(nil, aError);
                } else {
                    handler(dict, nil);
                }
            }
        });
    });
}

+ (void)checkEmail:(NSDictionary *)params withCompletion:( void (^) (id result, NSError *error))handler {
    NSMutableURLRequest *request = [self requestForPostMethod:@"check/e" withParams:[params urlEncodedString]];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSURLResponse* response = nil;
        NSError *error = nil;
        NSData *data = [NSURLSession sendSynchronousRequest:request returningResponse:&response error:&error];
        dispatch_async(dispatch_get_main_queue(), ^(void){
            NSDictionary *dict = [[NSDictionary alloc]initWithDictionary:[data objectFromJSONData]];
            if (!dict[@"success"]) {
                NSError *aError = dict[@"message"];
                handler(nil, aError);
            } else {
                Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
                NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
                if (networkStatus == NotReachable) {
                    NSError *aError = (NSError *)@"No Internet Connection. Please try again.";
                    handler(nil, aError);
                } else {
                    handler(dict, nil);
                }
            }
        });
    });
}

+ (void)forgotPassword:(NSDictionary *)params withCompletion:( void (^) (id result, NSError *error))handler {
    NSMutableURLRequest *request = [self requestForPostMethod:@"forget-password" withParams:[params urlEncodedString]];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSURLResponse* response = nil;
        NSError *error = nil;
        NSData *data = [NSURLSession sendSynchronousRequest:request returningResponse:&response error:&error];
        dispatch_async(dispatch_get_main_queue(), ^(void){
            NSDictionary *dict = [[NSDictionary alloc]initWithDictionary:[data objectFromJSONData]];
            if (!dict[@"success"]) {
                NSError *aError = dict[@"message"];
                handler(nil, aError);
            } else {
                Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
                NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
                if (networkStatus == NotReachable) {
                    NSError *aError = (NSError *)@"No Internet Connection. Please try again.";
                    handler(nil, aError);
                } else {
                    handler(dict, nil);
                }
            }
        });
    });
}


+ (void)orderRequest:(NSDictionary *)params withCompletion:( void (^) (id result, NSError *error))handler {
    NSMutableURLRequest *request = [self requestForPostMethodDecoding:@"action/RequestOrder" withParams:[params urlEncodedString]];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSURLResponse* response = nil;
        NSError *error = nil;
        NSData *data = [NSURLSession sendSynchronousRequest:request returningResponse:&response error:&error];
        dispatch_async(dispatch_get_main_queue(), ^(void){
            NSDictionary *dict = [[NSDictionary alloc]initWithDictionary:[data objectFromJSONData]];
            if (dict[@"error"]) {
                NSError *aError = dict[@"error"];
                handler(nil, aError);
            } else {
                Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
                NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
                if (networkStatus == NotReachable) {
                    NSError *aError = (NSError *)@"No Internet Connection. Please try again.";
                    handler(nil, aError);
                } else {
                    handler([data objectFromJSONData], nil);
                }
            }
        });
    });
}

///<<<<< HEAD

//+ (void)registerUser:(NSDictionary *)params withCompletion:( void (^) (id result, NSError *error))handler {
//    NSMutableURLRequest *request = [self requestForPostMethodDecoding:@"signup" withParams:[params urlEncodedString]];
//=======
    
+ (void)loginWithSocial:(NSDictionary *)params withCompletion:( void (^) (id result, NSError *error))handler {
    NSMutableURLRequest *request = [self requestForPostMethod:@"action/socialloginapi" withParams:[params urlEncodedString]];
//>>>>>>> cbb1f5ec35c82d0edeca791979e5d2dfc4a277fc
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSURLResponse* response = nil;
        NSError *error = nil;
        NSData *data = [NSURLSession sendSynchronousRequest:request returningResponse:&response error:&error];
        dispatch_async(dispatch_get_main_queue(), ^(void){
            NSDictionary *dict = [[NSDictionary alloc]initWithDictionary:[data objectFromJSONData]];
            if (dict[@"error"]) {
                NSError *aError = dict[@"error"];
                handler(nil, aError);
            } else {
                Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
                NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
                if (networkStatus == NotReachable) {
                    NSError *aError = (NSError *)@"No Internet Connection. Please try again.";
                    handler(nil, aError);
                } else {
                    handler([data objectFromJSONData], nil);
                }
            }
        });
    });
}

+ (void)registerUser:(NSDictionary *)params withCompletion:( void (^) (id result, NSError *error))handler {
    NSMutableURLRequest *request = [self requestForPostMethodDecoding:@"action/register" withParams:[params urlEncodedString]];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSURLResponse* response = nil;
        NSError *error = nil;
        NSData *data = [NSURLSession sendSynchronousRequest:request returningResponse:&response error:&error];
        dispatch_async(dispatch_get_main_queue(), ^(void){
            NSDictionary *dict = [[NSDictionary alloc]initWithDictionary:[data objectFromJSONData]];
            if (dict[@"error"]) {
                NSError *aError = dict[@"error"];
                handler(nil, aError);
            } else {
                Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
                NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
                if (networkStatus == NotReachable) {
                    NSError *aError = (NSError *)@"No Internet Connection. Please try again.";
                    handler(nil, aError);
                } else {
                    handler([data objectFromJSONData], nil);
                }
            }
        });
    });
}

+ (void)updateUser:(NSDictionary *)params withCompletion:( void (^) (id result, NSError *error))handler {
    NSMutableURLRequest *request = [self requestForPostMethod:@"action/updateprofileapi" withParams:[params urlEncodedString]];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSURLResponse* response = nil;
        NSError *error = nil;
        NSData *data = [NSURLSession sendSynchronousRequest:request returningResponse:&response error:&error];
        dispatch_async(dispatch_get_main_queue(), ^(void){
            NSDictionary *dict = [[NSDictionary alloc]initWithDictionary:[data objectFromJSONData]];
            if (dict[@"error"]) {
                NSError *aError = dict[@"error"];
                handler(nil, aError);
            } else {
                Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
                NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
                if (networkStatus == NotReachable) {
                    NSError *aError = (NSError *)@"No Internet Connection. Please try again.";
                    handler(nil, aError);
                } else {
                    handler([data objectFromJSONData], nil);
                }
            }
        });
    });
}

+ (void)changePassword:(NSDictionary *)params withCompletion:( void (^) (id result, NSError *error))handler {
    NSMutableURLRequest *request = [self requestForPostMethod:@"action/changepasswordapi" withParams:[params urlEncodedString]];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSURLResponse* response = nil;
        NSError *error = nil;
        NSData *data = [NSURLSession sendSynchronousRequest:request returningResponse:&response error:&error];
        dispatch_async(dispatch_get_main_queue(), ^(void){
            NSDictionary *dict = [[NSDictionary alloc]initWithDictionary:[data objectFromJSONData]];
            if (dict[@"error"]) {
                NSError *aError = dict[@"error"];
                handler(nil, aError);
            } else {
                Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
                NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
                if (networkStatus == NotReachable) {
                    NSError *aError = (NSError *)@"No Internet Connection. Please try again.";
                    handler(nil, aError);
                } else {
                    handler([data objectFromJSONData], nil);
                }
            }
        });
    });
}

+ (void)syncWithSotial:(NSDictionary *)params withCompletion:( void (^) (id result, NSError *error))handler {
    NSMutableURLRequest *request = [self requestForPostMethod:@"action/socialsyncapi" withParams:[params urlEncodedString]];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSURLResponse* response = nil;
        NSError *error = nil;
        NSData *data = [NSURLSession sendSynchronousRequest:request returningResponse:&response error:&error];
        dispatch_async(dispatch_get_main_queue(), ^(void){
            NSDictionary *dict = [[NSDictionary alloc]initWithDictionary:[data objectFromJSONData]];
            if (dict[@"error"]) {
                NSError *aError = dict[@"error"];
                handler(nil, aError);
            } else {
                Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
                NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
                if (networkStatus == NotReachable) {
                    NSError *aError = (NSError *)@"No Internet Connection. Please try again.";
                    handler(nil, aError);
                } else {
                    handler([data objectFromJSONData], nil);
                }
            }
        });
    });
}

#pragma mark Request

+ (NSMutableURLRequest *)requestForPostMethod:(NSString *)method withJSONData:(NSData *)data {
    
    NSString* url = [NSString stringWithFormat:@"%@%@", wsUrl, method];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0f];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    //[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Accept"];
    [request setHTTPBody:data];
    
    return request;
}

+ (NSMutableURLRequest *)requestForPostURL:(NSString *)url withParams:(NSString *)params {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0f];
    [request setHTTPMethod:@"POST"];
    params = [params stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    NSData *postData = [params dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:postData];
    
    return request;
}

+ (NSMutableURLRequest *)requestForPostURL:(NSString *)url withJSONData:(NSData *)data {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0f];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPBody:data];
    
    return request;
}

+ (NSMutableURLRequest *)requestForPostMethod:(NSString *)method withParams:(NSString *)params {
    NSString* url = [NSString stringWithFormat:@"%@%@", wsUrl, method];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0f];
    [request setHTTPMethod:@"POST"];
    [request addValue:@"49779dff4318c4fa4d57ec2b2dc4f7881ea637c956bef5461375d41b9254a88f" forHTTPHeaderField:@"Cli-Session"];
    NSData *postData = [params dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:postData];
    return request;
}

+ (NSMutableURLRequest *)requestForPostMethodDecoding:(NSString *)method withParams:(NSString *)params {
    NSString* url = [NSString stringWithFormat:@"%@%@", wsUrl, method];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0f];
    [request setHTTPMethod:@"POST"];
    [request addValue:@"49779dff4318c4fa4d57ec2b2dc4f7881ea637c956bef5461375d41b9254a88f" forHTTPHeaderField:@"Cli-Session"];
    NSData *postData = [params dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:postData];
    
    return request;
}


+ (NSMutableURLRequest *) requestForPostMethod:(NSString *)method withPostData:(NSData *)postData {
    NSString* url = [NSString stringWithFormat:@"%@", wsUrl];
    if (method) {
        url = [NSString stringWithFormat:@"%@%@", wsUrl, method];
    }
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0f];
    [request setHTTPMethod:@"POST"];
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    [request addValue:[NSString stringWithFormat:@"multipart/form-data;boundary=%@",boundary] forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    return request;
}


@end
