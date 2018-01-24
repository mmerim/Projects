//
//  BeFreeCollectionViewCell.m
//  LearnPro
//
//  Created by Meri on 1/19/18.
//  Copyright © 2018 Meri. All rights reserved.
//

#import "BeFreeCollectionViewCell.h"

@interface BeFreeCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIView *backView;

@end

@implementation BeFreeCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    self.iconImageBackView.layer.cornerRadius = 40;
//    self.iconImageBackView.layer.borderColor = [UIColor grayColor].CGColor;
//    self.iconImageBackView.layer.borderWidth = 3.0f;
    
    CALayer *layer = self.backView.layer;
    layer.shadowOffset = CGSizeMake(1, 1);
    layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    layer.shadowRadius = 3.0f;
    layer.shadowOpacity = 1.f;
    
    layer = self.iconImageBackView.layer;
    
    layer.shadowOffset = CGSizeMake(1, 1);
    layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    layer.shadowRadius = 3.0f;
    layer.shadowOpacity = 1.f;
}

@end
