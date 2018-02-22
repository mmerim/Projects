//
//  NewsCollectionViewCell.m
//  LearnPro
//
//  Created by Meri on 12/6/17.
//  Copyright © 2017 Meri. All rights reserved.
//

#import "NewsCollectionViewCell.h"

@interface NewsCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIView *backView;

@end

@implementation NewsCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    CALayer *layer = self.backView.layer;
    layer.shadowOffset = CGSizeMake(1, 1);
    layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    layer.shadowRadius = 3.0f;
    layer.shadowOpacity = 1.f;
}

@end
