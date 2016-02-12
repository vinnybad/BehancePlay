//
//  BEPClient.m
//  BehancePlay
//
//  Created by Vinayak Badrinathan on 2/11/16.
//  Copyright © 2016 Vinayak Badrinathan. All rights reserved.
//

#import <Overcoat/OVCResponse.h>
#import "BEPClient.h"
#import "BEPUser.h"
#import "BEPClientUsersResponse.h"

@implementation BEPClient

+ (instancetype)shared {
    DEFINE_SHARED_INSTANCE_USING_BLOCK(^{
        return [BEPClient new];
    });
}

+ (NSDictionary *)responseClassesByResourcePath {
    return @{
            @"v2/users" : [BEPClientUsersResponse class]
             };
}

+ (NSDictionary *)modelClassesByResourcePath {
    return @{
            @"v2/users": [BEPUser class],
    };
}

- (void)fetchUsersMatchingQuery:(NSString *)query andOnCompletion:(void (^)(NSError *error, NSArray *users))completionBlock  {
    NSString *url = @"https://api.behance.net/v2/users?q=matias&client_id=4pLngWl2RHGkLkWPwKgoifzpXFxLmxBh";
    
    [self GET:url parameters:nil completion:^(OVCResponse *response, NSError *error) {
        if( completionBlock ) {
            completionBlock( error, response.result );
        }
    }];
}

@end
