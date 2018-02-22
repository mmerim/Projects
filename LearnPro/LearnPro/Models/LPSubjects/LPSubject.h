//
//  LPSubject.h
//  LearnPro
//
//  Created by Meri on 2/5/18.
//  Copyright © 2018 Meri. All rights reserved.
//

#import "MSApi.h"

@interface LPSubject : NSObject

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *image;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
