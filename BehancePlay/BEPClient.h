//
//  BEPClient.h
//  BehancePlay
//
//  Created by Vinayak Badrinathan on 2/11/16.
//  Copyright © 2016 Vinayak Badrinathan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Overcoat/OVCHTTPSessionManager.h>

@interface BEPClient : OVCHTTPSessionManager

+ (instancetype)shared;

- (void)fetchUsersMatchingQuery:(NSString *)query andOnCompletion:(void (^)(NSError *error, NSArray *users))completionBlock;

@end
