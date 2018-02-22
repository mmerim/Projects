//
//  ClassesViewController.m
//  LearnPro
//
//  Created by Meri on 2/2/18.
//  Copyright © 2018 Meri. All rights reserved.
//

#import "ClassesViewController.h"
#import "ClassCollectionViewCell.h"
#import "LessonsViewController.h"

#import "AppDelegate.h"

static NSString *classIdentifier = @"ClassCell";


@interface ClassesViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UIView *viewCheck;
@property (weak, nonatomic) IBOutlet UICollectionView *classesCollectionView;

@end

@implementation ClassesViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addRightBarButtonItem];
    [self.classesCollectionView registerNib:[UINib nibWithNibName:@"ClassCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:classIdentifier];
    
}

-(void)addRightBarButtonItem {
    //TO DO3
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 15;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ClassCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:classIdentifier forIndexPath:indexPath];
    cell.title.text = @"X";
    return cell;
    //        if([collectionView isEqual:self.sectionNewCollection]){
    //        MSSectionNewCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:sectionNewIdentifier forIndexPath:indexPath];
    //        if(self.newsArray.count > 9){
    //            [cell.prodImage sd_setImageWithURL:[NSURL URLWithString:self.newsArray[indexPath.row].productImage] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
    //            }];
    //            [cell.compImage sd_setImageWithURL:[NSURL URLWithString:self.newsArray[indexPath.row].companyImage] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
    //            }];
    //            cell.name.text = self.newsArray[indexPath.item].title;
    //            cell.price.text = self.newsArray[indexPath.item].discountedPrice;
    //        }
    //        return cell;
    //    }
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
    
    return CGSizeMake(self.view.frame.size.width/3, self.view.frame.size.width/3);
}

#pragma mark - UICollectionViewDelegate


#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    LessonsViewController* temp= [[UIStoryboard storyboardWithName:@"Lessons" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"LessonsViewController"];
    [self.navigationController pushViewController:temp animated:YES];}

@end

