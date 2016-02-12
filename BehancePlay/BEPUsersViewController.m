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
#import "BEPProgressHUD.h"
#import "BEPUsersViewControllerSearchBarReusableView.h"

const struct BEPUsersViewControllerCellType {
    __unsafe_unretained NSString *UserCell;
    __unsafe_unretained NSString *HeaderSearchCell;
} BEPUsersViewControllerCellType;

const struct BEPUsersViewControllerCellType BEPUsersViewControllerCellType = {
    .UserCell = @"BEPUsersViewControllerCollectionViewCell",
        .HeaderSearchCell = @"BEPUsersViewControllerSearchBarReusableView"
};

@interface BEPUsersViewController ()<UICollectionViewDataSource, UISearchResultsUpdating, UISearchBarDelegate>
@property (nonatomic, strong) BEPUserService *userService;
@property (nonatomic, strong) NSArray *userResults;
@property (nonatomic, strong) UISearchController *searchController;
@end

@implementation BEPUsersViewController

- (instancetype)init {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat padding = 5.f;
    CGFloat width = (screenSize.width - padding * 2) / 3;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake( width, width );
    layout.minimumInteritemSpacing = padding;
    layout.minimumLineSpacing = padding;
    layout.headerReferenceSize = CGSizeMake(screenSize.width, 44);
    
    self = [super initWithCollectionViewLayout:layout];
    if( self ) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Users", @"Users View Controller Title");
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self registerCellTypes];

    [self searchController];

    NSString *query = @"";
    [self updateResultsWithQuery:query];
}

- (void)updateResultsWithQuery:(NSString *)query {
    [BEPProgressHUD display];
    
    __weak typeof(self) weakSelf = self;
    [self.userService fetchUsersMatchingQuery:query andOnCompletion:^(NSError *error, NSArray *users) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.userResults = users;
        [strongSelf.collectionView reloadData];

        [BEPProgressHUD dismiss];
    }];
}

- (void)registerCellTypes {
    NSArray *cellTypes = @[ BEPUsersViewControllerCellType.UserCell ];
    [cellTypes bk_each:^(NSString *cellId) {
        UINib *nib = [UINib nibWithNibName:cellId bundle:nil];
        [self.collectionView registerNib:nib forCellWithReuseIdentifier:cellId];
    }];
    
    NSArray *supplementaryTypes = @[ BEPUsersViewControllerCellType.HeaderSearchCell ];
    [supplementaryTypes bk_each:^(NSString *cellId) {
        Class class = NSClassFromString(cellId);
        [self.collectionView registerClass:class forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:cellId];
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

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    BEPUsersViewControllerSearchBarReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:BEPUsersViewControllerCellType.HeaderSearchCell forIndexPath:indexPath];
    [header configureWithSearchController:self.searchController];
    return header;
}


#pragma mark - Getters & Setters

- (BEPUserService *)userService {
    if( !_userService ) {
        _userService = [BEPUserService shared];
    }
    return _userService;
}

- (UISearchController *)searchController {
    if( !_searchController ) {
        _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
        _searchController.searchResultsUpdater = self;
        _searchController.dimsBackgroundDuringPresentation = NO;
        _searchController.searchBar.delegate = self;
    }
    return _searchController;
}

#pragma mark - UISearchResultsUpdating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *query = searchController.searchBar.text;
    [self updateResultsWithQuery:query];
}

#pragma mark - UISearchBarDelegate

@end
