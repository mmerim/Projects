//
//  NewsCollectionViewCell.h
//  LearnPro
//
//  Created by Meri on 12/6/17.
//  Copyright © 2017 Meri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UITextView *text;
@property (weak, nonatomic) IBOutlet UIButton *more;

@end
