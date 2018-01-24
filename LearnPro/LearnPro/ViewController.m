//
//  ViewController.m
//  LearnPro
//
//  Created by Meri on 1/23/18.
//  Copyright © 2018 Meri. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.image.animationImages = [[NSArray alloc]initWithObjects:
                                  [UIImage imageNamed:@"0.png"],
                                  [UIImage imageNamed:@"1.png"],
                                  [UIImage imageNamed:@"2.png"],
                                  [UIImage imageNamed:@"3.png"],
                                  [UIImage imageNamed:@"4.png"],
                                  [UIImage imageNamed:@"5.png"], nil];
    [self.image setAnimationRepeatCount:2];
    self.image.animationDuration = 2;
    [self.image startAnimating];
}

@end
