//
//  BEPUsersViewControllerSearchBarReusableView.m
//  BehancePlay
//
//  Created by Vinayak Badrinathan on 2/11/16.
//  Copyright © 2016 Vinayak Badrinathan. All rights reserved.
//

#import "BEPUsersViewControllerSearchBarReusableView.h"

@interface BEPUsersViewControllerSearchBarReusableView ()
@property (weak, nonatomic) UISearchBar *searchBar;

@end

@implementation BEPUsersViewControllerSearchBarReusableView

- (void)awakeFromNib {
    // Initialization code
}

- (void)configureWithSearchController:(UISearchController *)searchController {
    if( self.searchBar != searchController.searchBar ) {
        [self.searchBar removeFromSuperview];

        [searchController.searchBar sizeToFit];
        self.searchBar = searchController.searchBar;
        [self addSubview:self.searchBar];
    }
}

@end
