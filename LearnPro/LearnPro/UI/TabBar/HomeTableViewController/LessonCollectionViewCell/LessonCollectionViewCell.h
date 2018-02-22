//
//  LessonCollectionViewCell.h
//  LearnPro
//
//  Created by Meri on 2/2/18.
//  Copyright © 2018 Meri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LessonCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;

@end
