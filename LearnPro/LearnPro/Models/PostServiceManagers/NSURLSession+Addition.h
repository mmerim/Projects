//
//  NSURLSession+Addition.h
//  MegaShopping
//
//  Created by Megatex on 10/17/17.
//  Copyright © 2017 Gor Hakobyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLSession (Addition)

+ (NSData *)sendSynchronousRequest:(NSURLRequest *)request returningResponse:(NSURLResponse **)response error:(NSError **)error;

@end
