//
//  BEPUsersViewController.m
//  BehancePlay
//
//  Created by Vinayak Badrinathan on 2/11/16.
//  Copyright © 2016 Vinayak Badrinathan. All rights reserved.
//

#import "BEPUsersViewController.h"
#import "BEPUserService.h"
#import "BEPUsersViewControllerCollectionViewCell.h"
#import "BEPUser.h"
#import <BlocksKit/BlocksKit.h>

const struct BEPUsersViewControllerCellType {
    __unsafe_unretained NSString *UserCell;
} BEPUsersViewControllerCellType;

const struct BEPUsersViewControllerCellType BEPUsersViewControllerCellType = {
    .UserCell = @"BEPUsersViewControllerCollectionViewCell"
};

@interface BEPUsersViewController ()<UICollectionViewDataSource>
@property (nonatomic, strong) NSArray *userResults;
@end

@implementation BEPUsersViewController

- (instancetype)init {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake( screenSize.width/3, screenSize.width/3);
    layout.minimumInteritemSpacing = 5.f;
    
    self = [super initWithCollectionViewLayout:layout];
    if( self ) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self registerCellTypes];

    BEPUser *user = [BEPUser new];
    self.userResults = @[user, user];
}

- (void)registerCellTypes {
    NSArray *cellTypes = @[ BEPUsersViewControllerCellType.UserCell ];

    [cellTypes bk_each:^(NSString *cellId) {
        UINib *nib = [UINib nibWithNibName:cellId bundle:nil];
        [self.collectionView registerNib:nib forCellWithReuseIdentifier:cellId];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.userResults.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BEPUsersViewControllerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:BEPUsersViewControllerCellType.UserCell forIndexPath:indexPath];

    BEPUser *user = self.userResults[indexPath.row];
    [cell configureWithUser:user];

    return cell;
}


@end
