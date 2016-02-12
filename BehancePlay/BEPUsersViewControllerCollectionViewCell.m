//
//  BEPUsersViewControllerCollectionViewCell.m
//  BehancePlay
//
//  Created by Vinayak Badrinathan on 2/11/16.
//  Copyright © 2016 Vinayak Badrinathan. All rights reserved.
//

#import "BEPUsersViewControllerCollectionViewCell.h"
#import "BEPUser.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface BEPUsersViewControllerCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *displayNameLabel;

@end

@implementation BEPUsersViewControllerCollectionViewCell

- (void)configureWithUser:(BEPUser *)user {
    [self configureProfileImageView:user];
    self.displayNameLabel.text = user.displayName;
}

- (void)configureProfileImageView:(const BEPUser *)user {
    UIImage *placeholderImage = [UIImage imageNamed:@"userPlaceholderImage"];
    [self.profileImageView setImageWithURL:user.profileImageURL placeholderImage:placeholderImage];
}


@end
