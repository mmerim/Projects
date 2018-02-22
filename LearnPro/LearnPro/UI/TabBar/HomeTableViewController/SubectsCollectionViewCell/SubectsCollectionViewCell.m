//
//  SubectsCollectionViewCell.m
//  LearnPro
//
//  Created by Meri on 1/19/18.
//  Copyright © 2018 Meri. All rights reserved.
//

#import "SubectsCollectionViewCell.h"

@implementation SubectsCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backView.layer.cornerRadius = 75;
    
    CALayer *layer = self.backView.layer;
    layer.shadowOffset = CGSizeMake(1, 1);
    layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    layer.shadowRadius = 3.0f;
    layer.shadowOpacity = 1.f;
    
}

//- (IBAction)didTapButton:(id)sender{
//    self.backgroundColor = [UIColor redColor];
//}


@end
