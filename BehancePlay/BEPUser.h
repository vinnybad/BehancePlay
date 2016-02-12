//
//  BEPUser.h
//  BehancePlay
//
//  Created by Vinayak Badrinathan on 2/11/16.
//  Copyright © 2016 Vinayak Badrinathan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BEPUser : NSObject

@property (nonatomic, strong) NSString *firstName, *lastName;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, strong) NSURL *profileImageURL;

@end
