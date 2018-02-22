//
//  MSRequest.m
//  MegaShopping
//
//  Created by Megatex on 11/4/16.
//  Copyright © 2016 Gor Hakobyan. All rights reserved.
//

#import "MSRequest.h"
#import "AFURLResponseSerialization.h"
#import "AFNetworking.h"

@interface MSRequest ()

@property (nonatomic, strong) NSURLSessionTask *dataTask;
@property (nonatomic, strong) NSMutableURLRequest *taskRequest;
@property (nonatomic, readwrite) BOOL executing;
    
@property (nonatomic) NSDictionary *formData;
@property (nonatomic, strong) AFHTTPSessionManager *httpSessionManager;

@end


@implementation MSRequest
    
- (AFHTTPSessionManager *)httpSessionManager{
    if (!_httpSessionManager) {
        _httpSessionManager = [AFHTTPSessionManager manager];
        _httpSessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        _httpSessionManager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
        ((AFJSONResponseSerializer *)_httpSessionManager.responseSerializer).removesKeysWithNullValues = YES;
        
    }
    return _httpSessionManager;
}
    
- (instancetype)initWithUrlString:(NSString *)urlString method:(NSString *)method params:(NSDictionary *)params {
    self = [self init];
    if (self) {
        NSError *error = nil;
        NSMutableURLRequest *request =
        [self.httpSessionManager.requestSerializer
         requestWithMethod:method
         URLString:urlString
         parameters:params
         error:&error];
        self.taskRequest = request;
        
    }
    return self;
}
    
- (instancetype)initWithUrlString:(NSString *)urlString method:(NSString *)method params:(NSDictionary *)params formData:(NSDictionary *)formData {
    return [self initWithUrlString:urlString method:method params:params formData:formData fileData:nil fileName:nil mimeType:nil];
}
    
- (instancetype)POST:(NSString *)urlString formData:(NSDictionary *)formData fileData:(NSData *)fileData fileName:(NSString *)fileName mimeType:(NSString *)mimeType{
    return [self initWithUrlString:urlString method:@"POST" params:nil formData:formData fileData:fileData fileName:fileName mimeType:mimeType];
}
    
- (instancetype)POST:(NSString *)urlString formData:(NSDictionary *)formData {
    return [self initWithUrlString:urlString method:@"POST" params:nil formData:formData fileData:nil fileName:nil mimeType:nil];
}
    
- (instancetype)initWithUrlString:(NSString *)urlString method:(NSString *)method params:(NSDictionary *)params formData:(NSDictionary *)formData fileData:(NSData *)fileData fileName:(NSString *)fileName mimeType:(NSString *)mimeType{
    self = [self init];
    if (self) {
        self.formData = formData;
        NSError *error = nil;
        NSMutableURLRequest *request =
        [self.httpSessionManager.requestSerializer
         multipartFormRequestWithMethod:method
         URLString:urlString
         parameters:params
         constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
             NSArray *allKeys = self.formData.allKeys;
             [allKeys enumerateObjectsUsingBlock:^(NSString * _Nonnull key, NSUInteger index, BOOL * _Nonnull stop) {
                 if ([self.formData[key] isKindOfClass:[NSString class]]) {
                     [formData appendPartWithFormData:[self.formData[key] dataUsingEncoding:NSUTF8StringEncoding] name:key];
                 } else if ([self.formData[key] isKindOfClass:[NSNumber class]]) {
                     [formData appendPartWithFormData:[[self.formData[key] stringValue] dataUsingEncoding:NSUTF8StringEncoding] name:key];
                 }
             }];
             if (fileData && fileName) {
                 [formData appendPartWithFileData:fileData name:fileName fileName:[NSString stringWithFormat:@"%@.%@", fileName, [mimeType lastPathComponent]] mimeType:mimeType];
             }
         } error:&error];
        self.taskRequest = request;
    }
    return self;
}
    
+ (instancetype)downloadRequestWithUrlString:(NSString *)urlString destinationPath:(NSURL *)destinationPath {
    MSRequest *ms_request = [[MSRequest alloc] init];
    if (ms_request) {
        [ms_request.httpSessionManager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/zip", nil]];
        NSError *error = nil;
        NSMutableURLRequest *request =
        [ms_request.httpSessionManager.requestSerializer
         requestWithMethod:@"POST"
         URLString:urlString
         parameters:nil
         error:&error];
        ms_request.taskRequest = request;
        ms_request.dataTask = [ms_request.httpSessionManager downloadTaskWithRequest:ms_request.taskRequest progress:^(NSProgress * _Nonnull downloadProgress) {
            if (ms_request.downloadProgressDelegate) {
                double percentDone = downloadProgress.completedUnitCount / downloadProgress.totalUnitCount;
                [ms_request.downloadProgressDelegate setProgress:percentDone];
            }
        } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
            return destinationPath;
        } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
            if (error) {
                [ms_request requestDidFail:error response:response];
            } else{
                [ms_request requestDidFinish:filePath response:response];
            }
        }];
    }
    return ms_request;
}
    
- (NSURL *)url {
    return self.dataTask.originalRequest.URL;
}
    
- (void)setPostBody:(NSData *)body{
    if (self.taskRequest) {
        [self.taskRequest setHTTPBody:body];
    }
}
    
- (void)dealloc {
    [self.dataTask cancel];
    self.dataTask = nil;
    self.callback = nil;
}
    
- (void)setTimeOutSeconds:(NSTimeInterval)seconds {
    [self.httpSessionManager.requestSerializer setTimeoutInterval:seconds];
}
    
- (void)cancel {
    [self.dataTask cancel];
    self.dataTask = nil;
    self.executing = NO;
}
    
- (void)startAsynchronous {
    self.executing = YES;
    if (self.dataTask) {
        [self.dataTask resume];
        return;
    }
    self.dataTask = [self.httpSessionManager dataTaskWithRequest:self.taskRequest completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                [self requestDidFail:error response:response];
            } else{
                [self requestDidFinish:responseObject response:response];
            }
        });
    }];
    [self.dataTask resume];
}
    
- (void)requestDidFinish:(id)responseObject response:(NSURLResponse * _Nonnull)response {
    if (self.callback) {
        self.callback(self, responseObject, nil);
    }
    if (self.completionBlock) {
        self.completionBlock(self, responseObject, response);
    }
}
    
- (void)requestDidFail:(NSError *)error response:(NSURLResponse *)response {
    if (self.callback) {
        self.callback(self, nil, error);
    }
    if (self.failureBlock) {
        self.failureBlock(self, error, response);
    }
}
    
- (void)requestDidFail:(NSError *)error responseObject:(id)responseObject response:(NSURLResponse *)response {
    if (self.callback) {
        self.callback(self, nil, error);
    }
    if (self.failureBlock) {
        self.failureBlock(self, error, response);
    }
}
    

@end
