//
//  BEPUser.m
//  BehancePlay
//
//  Created by Vinayak Badrinathan on 2/11/16.
//  Copyright © 2016 Vinayak Badrinathan. All rights reserved.
//

#import <Mantle/MTLValueTransformer.h>
#import <Mantle/NSValueTransformer+MTLPredefinedTransformerAdditions.h>
#import "BEPUser.h"

@implementation BEPUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
            NSStringFromSelector(@selector(firstName)) : @"first_name",
            NSStringFromSelector(@selector(lastName)) : @"last_name",
            NSStringFromSelector(@selector(username)) : @"username",
            NSStringFromSelector(@selector(displayName)) : @"display_name",
            NSStringFromSelector(@selector(profileImageURL)) : @"images.138",
    };
}

+ (NSValueTransformer *)profileImageURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end
