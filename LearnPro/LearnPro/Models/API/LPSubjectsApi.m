//
//  LPSubjectsApi.m
//  LearnPro
//
//  Created by Meri on 2/5/18.
//  Copyright © 2018 Meri. All rights reserved.
//

#import "LPSubjectsApi.h"
#import "MSAPIConstants.h"

@implementation LPSubjectsApi

- (NSString *)endPoint{
    return @"category/brands";
}

+ (id<MSRequestToken>)getSubjectsWithcallback:(MSRequestCallback)callback {
    LPSubjectsApi *api = [[LPSubjectsApi alloc] initWithParams:nil method:kMSHTTPMethodGet];
    api.callback = callback;
    [api setCallback:^(MSRequest *request, id result, NSError *error){
        callback(request, result, error);
    }];
    [api startAsynchronous];
    return api;
}

@end

