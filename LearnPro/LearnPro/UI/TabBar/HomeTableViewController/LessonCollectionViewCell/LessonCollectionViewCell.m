//
//  LessonCollectionViewCell.m
//  LearnPro
//
//  Created by Meri on 2/2/18.
//  Copyright © 2018 Meri. All rights reserved.
//

#import "LessonCollectionViewCell.h"

@implementation LessonCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    CALayer *layer = self.backView.layer;
    layer.shadowOffset = CGSizeMake(1, 1);
    layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    layer.shadowRadius = 3.0f;
    layer.shadowOpacity = 1.f;
}

@end
