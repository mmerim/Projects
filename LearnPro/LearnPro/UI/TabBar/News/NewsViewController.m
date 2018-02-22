//
//  NewsViewController.m
//  LearnPro
//
//  Created by Meri on 11/27/17.
//  Copyright © 2017 Meri. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsCollectionViewCell.h"
#import "NewsCellInfoViewController.h"

static NSString *newsIdentifier = @"NewsCell";

@interface NewsViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *newsCollectionView;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.newsCollectionView registerNib:[UINib nibWithNibName:@"NewsCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:newsIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NewsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:newsIdentifier forIndexPath:indexPath];
//    cell.titel.text = @"Titel";
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionView *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    //    CGFloat width = self.view.frame.size.width * 0.5;
    //
    //    UIImage* image = [[UIImage alloc] init];
    //
    //    if(indexPath.item % 3 == 0){
    //        image = [UIImage imageNamed:@"o"];
    //    }else if(indexPath.item % 3 == 1){
    //        image = [UIImage imageNamed:@"d.jpg"];
    //    }else {
    //        image = [UIImage imageNamed:@"l.jpg"];
    //    }
    //    CGFloat height = image.size.height * width / image.size.width + 75;
    
    return CGSizeMake(self.view.frame.size.width/2, self.view.frame.size.height/1.5);
}


#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NewsCellInfoViewController* nvc = [self.storyboard instantiateViewControllerWithIdentifier:@"NewsCellInfo"];
    //TO DO
    [self.navigationController pushViewController:nvc animated:YES];
}


@end

