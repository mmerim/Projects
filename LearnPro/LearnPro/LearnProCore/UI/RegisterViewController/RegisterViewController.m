//
//  RegisterViewController.m
//  LearnPro
//
//  Created by Meri on 12/25/17.
//  Copyright © 2017 Meri. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *surnameTF;
@property (weak, nonatomic) IBOutlet UITextField *birthdayTF;
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UITextField *repeatPasswordTF;
@property (weak, nonatomic) IBOutlet UITextField *genderTF;

@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self textFieldActions];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapOnScreen:(id)sender {
    [self.view endEditing:YES];
}

-(void) textFieldActions {
    self.nameTF.leftViewMode = UITextFieldViewModeAlways;
    self.nameTF.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user.png"]];
    
    self.surnameTF.leftViewMode = UITextFieldViewModeAlways;
    self.surnameTF.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user.png"]];
    
    self.birthdayTF.leftViewMode = UITextFieldViewModeAlways;
    self.birthdayTF.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user.png"]];
    
    self.userNameTF.leftViewMode = UITextFieldViewModeAlways;
    self.userNameTF.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user.png"]];
    
    self.emailTF.leftViewMode = UITextFieldViewModeAlways;
    self.emailTF.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mess.png"]];
    
    self.passwordTF.leftViewMode = UITextFieldViewModeAlways;
    self.passwordTF.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pass.png"]];
    
    self.repeatPasswordTF.leftViewMode = UITextFieldViewModeAlways;
    self.repeatPasswordTF.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pass.png"]];
    

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
