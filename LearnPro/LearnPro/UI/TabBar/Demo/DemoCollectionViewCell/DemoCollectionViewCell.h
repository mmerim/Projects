//
//  DemoCollectionViewCell.h
//  LearnPro
//
//  Created by Meri on 1/17/18.
//  Copyright © 2018 Meri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoCollectionViewCell : UICollectionViewCell

//video
@property (weak, nonatomic) IBOutlet UILabel *titel;
@property (weak, nonatomic) IBOutlet UITextView *text;

@end
