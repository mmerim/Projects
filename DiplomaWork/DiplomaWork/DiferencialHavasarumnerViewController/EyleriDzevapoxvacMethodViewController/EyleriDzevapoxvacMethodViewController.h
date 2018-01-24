//
//  EyleriDzevapoxvacMethodViewController.h
//  DiplomaWork
//
//  Created by Meri on 5/2/17.
//  Copyright © 2017 Meri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderDiferencial.h"
#import "HeaderForResult.h"

@interface EyleriDzevapoxvacMethodViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource, TestProtocol>

// for indexes
@property (assign, nonatomic) NSInteger numberOfN;

-(void)countEylerDzevapoxvac;

//for showResult..
@property(nonatomic,strong) id<ResultProtocol> delegate;

@end
