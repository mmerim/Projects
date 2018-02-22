//
//  MSRequestToken.h
//  MegaShopping
//
//  Created by Megatex on 11/4/16.
//  Copyright © 2016 Gor Hakobyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MSRequestToken <NSObject>
    - (void)cancel;

@end


@class AFHTTPSessionManager;
@class MSRequest;

typedef void(^MSRequestCallback)(MSRequest *aRequest, id aResult, NSError *aError);

@protocol MSProgressDelegate <NSObject>

- (void)setProgress:(float)progress;
    
@end


@protocol MSRequestInterface <NSObject>

@required
- (void)startAsynchronous;
- (void)setTimeOutSeconds:(NSTimeInterval)seconds;
- (void)setPostBody:(NSData *)body;
   
@end
