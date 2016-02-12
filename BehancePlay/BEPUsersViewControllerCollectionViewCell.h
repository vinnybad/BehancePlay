//
//  BEPUsersViewControllerCollectionViewCell.h
//  BehancePlay
//
//  Created by Vinayak Badrinathan on 2/11/16.
//  Copyright © 2016 Vinayak Badrinathan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BEPUser.h"

@interface BEPUsersViewControllerCollectionViewCell : UICollectionViewCell

- (void)configureWithUser:(BEPUser *)user;
@end
