//
//  InfoViewController.m
//  LearnPro
//
//  Created by Meri on 2/14/18.
//  Copyright © 2018 Meri. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titel;
@property (weak, nonatomic) IBOutlet UITextView *text;

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad]; 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setTitel:(NSString *)titel AndText:(NSString *)text {
    self.titel.text = titel;
    self.text.text = text;
}

@end
