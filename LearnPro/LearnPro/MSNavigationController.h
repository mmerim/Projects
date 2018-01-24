//
//  MSNavigationController.h
//  MegaShopping
//
//  Created by Gor Hakobyan on 11/20/16.
//  Copyright © 2016 Gor Hakobyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MSNavigationControllerDelegate;

@interface MSNavigationController : UINavigationController

- (void)configNavigationItem: (UINavigationItem *)navigationItem;

@end


