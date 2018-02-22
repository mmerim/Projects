//
//  NSDictionary+UrlEncoding.m
//  MegaShopping
//
//  Created by Megatex on 11/24/16.
//  Copyright © 2016 Gor Hakobyan. All rights reserved.
//

#import "NSDictionary+UrlEncoding.h"

static NSString *toString(id object) {
    return [NSString stringWithFormat: @"%@", object];
}

static NSString *urlEncode(id object) {
    NSString *string = toString(object);
    
    NSString *escapedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                                                                    NULL,
                                                                                                    (__bridge CFStringRef) string,
                                                                                                    NULL,
                                                                                                    CFSTR("!*'();:&=+$,/?%#[]\" "),
                                                                                                    kCFStringEncodingUTF8));
    return escapedString;
}


@implementation NSDictionary (UrlEncoding)

-(NSString*) urlEncodedString {
    NSMutableArray *parts = [NSMutableArray array];
    for (id key in self) {
        id value = [self objectForKey: key];
        NSString *part = [NSString stringWithFormat: @"%@=%@", urlEncode(key), urlEncode(value)];
        [parts addObject: part];
    }
    return [parts componentsJoinedByString: @"&"];
}


@end
