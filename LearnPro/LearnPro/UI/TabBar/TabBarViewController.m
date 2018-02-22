//
//  TabBarViewController.m
//  LearnPro
//
//  Created by Meri on 12/4/17.
//  Copyright © 2017 Meri. All rights reserved.
//

#import "TabBarViewController.h"
#import "LogRegViewController.h"
#import "AppDelegate.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}

- (IBAction)leftSide:(id)sender {
    AppDelegate *app =  (AppDelegate*)[[UIApplication sharedApplication]delegate];
    [app.drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

- (IBAction)rightSide:(id)sender {
    AppDelegate *app =  (AppDelegate*)[[UIApplication sharedApplication]delegate];
    [app.drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

- (IBAction)openRegLogPage:(id)sender {

    LogRegViewController* temp= [[UIStoryboard storyboardWithName:@"MenuSide" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"LogReg"];
    [self.navigationController pushViewController:temp animated:YES];
}


@end
