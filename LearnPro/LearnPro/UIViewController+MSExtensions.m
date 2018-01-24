////
////  UIViewController+MSExtensions.m
////  MegaShopping
////
////  Created by Megatex on 11/29/16.
////  Copyright © 2016 Gor Hakobyan. All rights reserved.
////
//
//#import "UIViewController+MSExtensions.h"
//#import "AppDelegate.h"
//#import "HGSideMenu.h"
//#import "MSUser.h"
//
//@implementation UIViewController (MSExtensions)
//
//- (void)login {
////    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
////    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Initial" bundle: nil];
////    HGSideMenuContainerViewController *controller = [storyboard instantiateInitialViewController];
////    //controller.user = [HBLoginUser sharedObject].user;
////    //controller.delegate = appDelegate;
////    [appDelegate.window setRootViewController:controller];
//    
////    [[MSUser currentUser] updateFromData:result];
////    [MSUser setAuthUserId:[MSUser currentUser].userId];
////    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
////    HGSideMenuContainerViewController *container = [storyboard instantiateInitialViewController];
////    UINavigationController *navigationController = [storyboard instantiateViewControllerWithIdentifier:@"navigationController"];
////    UIViewController *leftSideMenuViewController = [storyboard instantiateViewControllerWithIdentifier:@"leftSideMenuViewController"];
////    [container setLeftMenuViewController:leftSideMenuViewController];
////    [container setCenterViewController:navigationController];
////    [self presentViewController:container animated:NO completion:nil];
//    
//    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    [appDelegate loginPage];
////    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Initial" bundle: nil];
////    HGSideMenuContainerViewController *controller = [storyboard instantiateInitialViewController];
////    [appDelegate.window setRootViewController:controller];
//}
//
//- (void)logout {
//    [MSUser unsetAuthUserId];
//    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
//    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
//    [[MSUser currentUser] resetUser];;
//    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    [appDelegate performUserFirstLoginCheckAction];
//    
////    [
////    [[HBLoginUser sharedObject] logout];
////    [[HBImageCache sharedInstance] purge];
////    HBAppDelegate *appDelegate = (HBAppDelegate *)[UIApplication sharedApplication].delegate;
////    [appDelegate performUserFirstLoginCheckAction];
//}
//
//
//@end

