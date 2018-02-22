//
//  JSON.h
//  MegaShopping
//
//  Created by Megatex on 11/24/16.
//  Copyright © 2016 Gor Hakobyan. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark Deserializing methods

@interface NSString (JSONDeserializing)

- (id)objectFromJSONString;

@end

@interface NSData (JSONDeserializing)

- (id)objectFromJSONData;

@end


#pragma mark Serializing methods

@interface NSString (JSONSerializing)
- (NSData *)JSONData;
- (NSString *)JSONString;
@end

@interface NSArray (JSONSerializing)
- (NSData *)JSONData;
- (NSString *)JSONString;
@end

@interface NSDictionary (JSONSerializing)
- (NSData *)JSONData;
- (NSString *)JSONString;
@end
