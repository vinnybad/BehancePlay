//
//  BEPUserService.m
//  BehancePlay
//
//  Created by Vinayak Badrinathan on 2/11/16.
//  Copyright © 2016 Vinayak Badrinathan. All rights reserved.
//

#import "BEPUserService.h"
#import "BEPUser.h"
#import <Overcoat/Overcoat.h>

@implementation BEPUserService

+ (instancetype)shared {
    DEFINE_SHARED_INSTANCE_USING_BLOCK(^{
        return [BEPUserService new];
    });
}

- (void)fetchUsersMatchingQuery:(NSString *)query andOnCompletion:(void (^)(NSError *error, NSArray *users))completionBlock {

    BEPUser *user = [BEPUser new];
    user.displayName = @"Vinny Badrinathan";

    if( completionBlock ) {
        completionBlock( nil, @[user] );
    }

}

@end
