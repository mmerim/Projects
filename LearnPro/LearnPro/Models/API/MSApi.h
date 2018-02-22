//
//  MSApi.h
//  MegaShopping
//
//  Created by Megatex on 11/4/16.
//  Copyright © 2016 Gor Hakobyan. All rights reserved.
//

#import "MSRequest.h"

@interface MSApi : MSRequest

- (instancetype)initWithParams:(NSDictionary *)params method:(NSString *)method;
    
@end
