//
//  BEPCommon.h
//  BehancePlay
//
//  Created by Vinayak Badrinathan on 2/11/16.
//  Copyright © 2016 Vinayak Badrinathan. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Easier method of creating singletons
 */
#define DEFINE_SHARED_INSTANCE_USING_BLOCK(block)        \
    static dispatch_once_t pred = 0;                     \
    __strong static id _sharedObject = nil;              \
    dispatch_once(&pred, ^{ _sharedObject = block(); }); \
    return _sharedObject;

@interface BEPCommon : NSObject

@end
