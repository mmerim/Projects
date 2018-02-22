//
//  LogRegViewController.m
//  LearnPro
//
//  Created by Meri on 2/8/18.
//  Copyright © 2018 Meri. All rights reserved.
//

#import "LogRegViewController.h"
#import "TabBarViewController.h"

@interface LogRegViewController()

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIButton *login;
@property (weak, nonatomic) IBOutlet UIButton *registration;

@property (weak, nonatomic) IBOutlet UIButton *skip;
@end

@implementation LogRegViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor *customBlue = [UIColor colorWithRed:0.22 green:0.44 blue:0.78 alpha:1.0];
    self.login.layer.borderWidth = 2.5f;
    self.login.layer.borderColor = customBlue.CGColor;
    self.registration.layer.borderWidth = 2.5f;
    self.registration.layer.borderColor = customBlue.CGColor;
    
    self.image.animationImages = [[NSArray alloc]initWithObjects:
                                  [UIImage imageNamed:@"FP1.png"],
                                  [UIImage imageNamed:@"FP2.png"],
                                  [UIImage imageNamed:@"FP3.png"],
                                  [UIImage imageNamed:@"FP4.png"],
                                  [UIImage imageNamed:@"FP5.png"],
                                  [UIImage imageNamed:@"FP6.png"],
                                  [UIImage imageNamed:@"FP7.png"], nil];
    [self.image setAnimationRepeatCount:10];
    self.image.animationDuration = 30;
    [self.image startAnimating];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginAction:(id)sender {
    //
}

- (IBAction)registrationAction:(id)sender {
    //
}
@end
