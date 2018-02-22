//
//  JSON.m
//  MegaShopping
//
//  Created by Megatex on 11/24/16.
//  Copyright © 2016 Gor Hakobyan. All rights reserved.
//

#import "JSON.h"

#pragma mark Deserializing methods

@implementation NSString (JSONKitDeserializing)

- (id)objectFromJSONString
{
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
}

@end


@implementation NSData (JSONDeserializing)

- (id)objectFromJSONData
{
    return [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingAllowFragments error:nil];
}

@end


#pragma mark Serializing methods

@implementation NSString (JSONSerializing)

- (NSData *)JSONData
{
    return [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
}

- (NSString *)JSONString
{
    
    NSString* jsonString = [[NSString alloc] initWithData:[self JSONData] encoding:NSUTF8StringEncoding];
    return jsonString;
}

@end

@implementation NSArray (JSONSerializing)

- (NSData *)JSONData
{
    return [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
}

- (NSString *)JSONString
{
    NSString* jsonString = [[NSString alloc] initWithData:[self JSONData] encoding:NSUTF8StringEncoding];
    return jsonString;
}

@end

@implementation NSDictionary (JSONKitSerializing)

- (NSData *)JSONData
{
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    
    return data;
}

- (NSString *)JSONString
{
    NSString* jsonString = [[NSString alloc] initWithData:[self JSONData] encoding:NSUTF8StringEncoding];
    return jsonString;
}

@end
