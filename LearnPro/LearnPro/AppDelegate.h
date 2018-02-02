//
//  AppDelegate.h
//  LearnPro
//
//  Created by Meri on 11/27/17.
//  Copyright © 2017 Meri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "MMDrawerController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(readonly, strong, nonatomic)NSManagedObjectContext *managedObjectContext;
@property(readonly, strong, nonatomic)NSManagedObjectModel *managedObjectModel;
@property(readonly, strong, nonatomic)NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property(strong, nonatomic)MMDrawerController *drawerController;

- (void)saveContext;


@end

