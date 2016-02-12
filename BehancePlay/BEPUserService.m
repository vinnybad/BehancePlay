//
//  BEPUserService.m
//  BehancePlay
//
//  Created by Vinayak Badrinathan on 2/11/16.
//  Copyright © 2016 Vinayak Badrinathan. All rights reserved.
//

#import "BEPUserService.h"

@implementation BEPUserService

+ (instancetype)shared {
    DEFINE_SHARED_INSTANCE_USING_BLOCK(^{
        return [BEPUserService new];
    });
}

@end
