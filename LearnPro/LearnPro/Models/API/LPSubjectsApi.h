//
//  LPSubjectsApi.h
//  LearnPro
//
//  Created by Meri on 2/5/18.
//  Copyright © 2018 Meri. All rights reserved.
//

#import "MSApi.h"

@interface LPSubjectsApi : MSApi

+ (id<MSRequestToken>)getSubjectsWithcallback:(MSRequestCallback)callback ;

@end
