//
//  LogInViewController.m
//  LearnPro
//
//  Created by Meri on 12/25/17.
//  Copyright © 2017 Meri. All rights reserved.
//

#import "LogInViewController.h"

@interface LogInViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *registration;

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self textFieldActions];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) textFieldActions {
    self.nameTF.leftViewMode = UITextFieldViewModeAlways;
    self.nameTF.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user.png"]];
    
    self.passwordTF.leftViewMode = UITextFieldViewModeAlways;
    self.passwordTF.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pass.png"]];
    
}


- (IBAction)tapOnScreen:(id)sender {
    [self.view endEditing:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
