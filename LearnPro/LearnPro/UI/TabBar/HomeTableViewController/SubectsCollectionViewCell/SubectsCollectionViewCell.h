//
//  SubectsCollectionViewCell.h
//  LearnPro
//
//  Created by Meri on 1/19/18.
//  Copyright © 2018 Meri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubectsCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *titel;

@end
