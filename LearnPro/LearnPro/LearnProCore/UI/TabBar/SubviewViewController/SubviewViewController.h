//
//  SubviewViewController.h
//  LearnPro
//
//  Created by Meri on 1/13/18.
//  Copyright © 2018 Meri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubviewViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *View;
@property (weak, nonatomic) IBOutlet UILabel *countHetevoerdner;
@property (weak, nonatomic) IBOutlet UILabel *countDasytac;
@property (weak, nonatomic) IBOutlet UILabel *countJam;
@property (weak, nonatomic) IBOutlet UILabel *countTeachers;

@end
