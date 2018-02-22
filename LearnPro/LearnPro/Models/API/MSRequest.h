//
//  MSRequest.h
//  MegaShopping
//
//  Created by Megatex on 11/4/16.
//  Copyright © 2016 Gor Hakobyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSRequestToken.h"

@class AFHTTPSessionManager;

@interface MSRequest : NSObject<MSRequestInterface, MSRequestToken>

- (instancetype)initWithUrlString:(NSString *)urlString method:(NSString *)method params:(NSDictionary *)params;
- (instancetype)POST:(NSString *)urlString formData:(NSDictionary *)formData;
- (instancetype)POST:(NSString *)urlString formData:(NSDictionary *)formData fileData:(NSData *)fileData fileName:(NSString *)fileName mimeType:(NSString *)mimeType;
- (instancetype)initWithUrlString:(NSString *)urlString method:(NSString *)method params:(NSDictionary *)params formData:(NSDictionary *)formData;
+ (instancetype)downloadRequestWithUrlString:(NSString *)urlString destinationPath:(NSURL *)destinationPath;
    
//Use callback as completion or 'completionBlock' and 'failureBlock'
@property (nonatomic, copy) MSRequestCallback callback;
// ------- OR ------------//
@property (nonatomic, copy) void(^completionBlock)(MSRequest *request, id result, NSURLResponse *urlResponse);
@property (nonatomic, copy) void(^failureBlock)(MSRequest *request, NSError *error, NSURLResponse *urlResponse);
// *********** Readonly *********** //
@property (nonatomic, readonly) BOOL executing;
@property (nonatomic, readonly) NSURL *url;
    
@property (nonatomic, strong, readonly) NSURLSessionTask *dataTask;
@property (nonatomic, strong, readonly) NSMutableURLRequest *taskRequest;
@property (nonatomic, strong, readonly) AFHTTPSessionManager *httpSessionManager;
    
@property (nonatomic, weak) id<MSProgressDelegate> uploadProgressDelegate;
@property (nonatomic, weak) id<MSProgressDelegate> downloadProgressDelegate;
    
@end
