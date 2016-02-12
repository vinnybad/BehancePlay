//
//  BEPProgressHUD.m
//  BehancePlay
//
//  Created by Vinayak Badrinathan on 2/11/16.
//  Copyright © 2016 Vinayak Badrinathan. All rights reserved.
//

#import "BEPProgressHUD.h"
#import <SVProgressHUD/SVProgressHUD.h>

@implementation BEPProgressHUD

+ (void)setUp {
    static dispatch_once_t pred = 0;
    dispatch_once(&pred, ^{
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    });
}

+ (void)dismiss {
    [BEPProgressHUD setUp];
    [SVProgressHUD dismiss];
}


+ (void)display {
    [BEPProgressHUD setUp];
    [SVProgressHUD show];
}

@end
