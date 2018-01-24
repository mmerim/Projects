//
//  WhyLearnProCollectionViewCell.h
//  LearnPro
//
//  Created by Meri on 1/19/18.
//  Copyright © 2018 Meri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WhyLearnProCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UITextView *text;
@property (weak, nonatomic) IBOutlet UIView *backView;

@end
