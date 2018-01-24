//
//  TabBarViewController.m
//  LearnPro
//
//  Created by Meri on 12/4/17.
//  Copyright © 2017 Meri. All rights reserved.
//

#import "TabBarViewController.h"
#import "LGSideMenuController.h"
#import "UIViewController+LGSideMenuController.h"

#import "LeftViewController.h"
#import "RightViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (id)init {
    self = [super init];
    if (self) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Left"
                                                                                 style:UIBarButtonItemStylePlain
                                                                                target:self
                                                                                action:@selector(showLeftView)];
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Right"
                                                                                  style:UIBarButtonItemStylePlain
                                                                                 target:self
                                                                                 action:@selector(showRightView)];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.tabBar.frame = CGRectMake(0.0, 0.0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    
//    self.button.frame = CGRectMake(0.0, CGRectGetHeight(self.view.frame)-44.0, CGRectGetWidth(self.view.frame), 44.0);
}

#pragma mark -

- (void)showLeftView {
    [self.sideMenuController showLeftViewAnimated:YES completionHandler:nil];
}

- (void)showRightView {
    [self.sideMenuController showRightViewAnimated:YES completionHandler:nil];
}

//- (void)showChooseController {
//    ChooseNavigationController *navigationController = [ChooseNavigationController new];
//    
//    UIWindow *window = UIApplication.sharedApplication.delegate.window;
//    window.rootViewController = navigationController;
//    
//    [UIView transitionWithView:window
//                      duration:0.3
//                       options:UIViewAnimationOptionTransitionCrossDissolve
//                    animations:nil
//                    completion:nil];
//}

@end
