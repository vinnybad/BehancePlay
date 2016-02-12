//
//  BEPUserService.m
//  BehancePlay
//
//  Created by Vinayak Badrinathan on 2/11/16.
//  Copyright © 2016 Vinayak Badrinathan. All rights reserved.
//

#import "BEPUserService.h"
#import "BEPUser.h"
#import "BEPClient.h"
#import <Overcoat/Overcoat.h>

@interface BEPUserService()
@property (nonatomic, strong) BEPClient *client;
@end

@implementation BEPUserService

+ (instancetype)shared {
    DEFINE_SHARED_INSTANCE_USING_BLOCK(^{
        return [BEPUserService new];
    });
}

- (void)fetchUsersMatchingQuery:(NSString *)query andOnCompletion:(void (^)(NSError *error, NSArray *users))completionBlock {
    [self.client fetchUsersMatchingQuery:query andOnCompletion:completionBlock];
}

- (BEPClient *)client {
    if( !_client ) {
        _client = [BEPClient shared];
    }
    return _client;
}

@end
