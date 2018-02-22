//
//  SubjectViewController.h
//  LearnPro
//
//  Created by Meri on 2/2/18.
//  Copyright © 2018 Meri. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LPSubject;

@interface SubjectViewController : UIViewController

@property (nonatomic, strong) NSMutableArray<LPSubject*>* subjectsArray;

@end
