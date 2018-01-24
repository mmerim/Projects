//
//  MSNavigationController.m
//  MegaShopping
//
//  Created by Gor Hakobyan on 11/20/16.
//  Copyright © 2016 Gor Hakobyan. All rights reserved.
//

#import "MSNavigationController.h"
#import "UIColor+MSAdditions.h"

@interface MSNavigationController ()

@end

@implementation MSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureNavigationBar];
    [self configNavigationItem:self.navigationItem];
}

- (void)configureNavigationBar {
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [UIImage new];
    self.navigationBar.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor ms_yellowColor]}];
}


- (void) configNavigationItem:(UINavigationItem *)navigationItem {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    
    NSArray *viewControllers = self.navigationController.viewControllers;
    
    UIView *cardView = [[[NSBundle mainBundle] loadNibNamed:@"MSShoppingCartButtonView" owner:self options:nil] firstObject];
    UIBarButtonItem *card = [[UIBarButtonItem alloc]initWithCustomView:cardView];
    
    UIButton *menuBtn =  [[UIButton alloc]init];
    UIImage *menuImage = [UIImage imageNamed:@"menu.png"];
    menuBtn.frame = CGRectMake(0, 0, menuImage.size.width, menuImage.size.height);
    [menuBtn setBackgroundImage:menuImage forState:UIControlStateNormal];
    [menuBtn addTarget:self action:@selector(openMenu) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menu = [[UIBarButtonItem alloc]initWithCustomView:menuBtn];
    
    UIButton *backBtn =  [[UIButton alloc]init];
    UIImage *backImage = [UIImage imageNamed:@"back.png"];
    backBtn.frame = CGRectMake(0, 0, backImage.size.width, backImage.size.height);
    [backBtn setBackgroundImage:backImage forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(leftButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    
    NSArray *items = nil;
    if (viewControllers.firstObject != self) {
        items = @[menu, back];
    } else {
        items = @[menu];
    }
    
    [navigationItem setRightBarButtonItem: card];
    [navigationItem setLeftBarButtonItems:items animated:YES];
}

//- (void)openMenu {
//    [self.menuContainerViewController setMenuState:HGSideMenuStateLeftMenuOpen];
//}
//
//- (void)leftButtonPressed {
//    [self.navigationController popViewControllerAnimated:YES];
//}


@end
