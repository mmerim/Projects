//
//  MSBaseRequest.m
//  MegaShopping
//
//  Created by Megatex on 11/4/16.
//  Copyright © 2016 Gor Hakobyan. All rights reserved.
//

#import "MSBaseRequest.h"

@interface MSBaseRequest ()
    
    @property (copy, nonatomic) RequestCallback callback;
    @property (strong, nonatomic) NSURLResponse *response;
    @property (strong, nonatomic) NSMutableData *data;
    @property (nonatomic) NSURLSessionDataTask *dataTask;

@end

@implementation MSBaseRequest

- (NSURL *)url {
    return nil;
}
    
- (NSString *)HTTPMethod {
    return nil;
}
    
- (NSData *)HTTPBody {
    return nil;
}
    
- (NSDictionary *)HTTPHeaders {
    return nil;
}
    
- (void)executeWithCallback:(RequestCallback)callback {
    self.callback = callback;
    
    NSString *HTTPMethod = [self HTTPMethod];
    NSURL *url = [self url];
    NSData *HTTPBody = [self HTTPBody];
    NSDictionary *HTTPHeaders = [self HTTPHeaders];
    
    NSAssert(url, @"URL should be set.");
    NSAssert(HTTPMethod, @"HTTP method should be set.");
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = HTTPMethod;
    if (HTTPBody) {
        request.HTTPBody = HTTPBody;
    }
    if (HTTPHeaders) {
        [request setAllHTTPHeaderFields:HTTPHeaders];
    }
    
    NSURLSession *session = [NSURLSession sharedSession];
    self.dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
        if (error) {
            NSLog(@"Response: %ld, (%@)", (long)statusCode, error);
        }
        [self requestFinishedWithResponseStatusCode:statusCode result:data error:error];
    }];
    [self.dataTask resume];
}
    
- (void)requestFinishedWithResponseStatusCode:(NSInteger)statusCode result:(id)result error:(NSError *)error {
    if (self.callback) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.callback(result, error);
        });
    }
}
    
- (void)cancel {
    [self.dataTask cancel];
}

    
@end
