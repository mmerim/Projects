//
//  LPSubject.m
//  LearnPro
//
//  Created by Meri on 2/5/18.
//  Copyright © 2018 Meri. All rights reserved.
//

#import "LPSubject.h"

@interface LPSubject()

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *image;

@end

@implementation LPSubject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.title = dictionary[@"meta_title"]; //TO CHANGE
        self.image = dictionary[@"thumbnail"];
    }
    return self;
}

@end

