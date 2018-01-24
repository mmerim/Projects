//
//  ContactUsViewController.m
//  LearnPro
//
//  Created by Meri on 11/27/17.
//  Copyright © 2017 Meri. All rights reserved.
//

#import "ContactUsViewController.h"
#import "MapKit/MapKit.h"
#import "NSString+EmailValidation.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>


@interface ContactUsViewController ()<MKMapViewDelegate, MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *callImage;
@property (weak, nonatomic) IBOutlet UIButton *callNumber;
@property (weak, nonatomic) IBOutlet UIButton *mailImage;
@property (weak, nonatomic) IBOutlet UIButton *mail;
@property (weak, nonatomic) IBOutlet UIButton *addressImage;
@property (weak, nonatomic) IBOutlet UIButton *address;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (weak, nonatomic) IBOutlet UILabel *text2Label;

@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextView *commentTV;

//soc
@property (weak, nonatomic) IBOutlet UIButton *facebookB;
@property (weak, nonatomic) IBOutlet UIButton *vimeoB;
@property (weak, nonatomic) IBOutlet UIButton *twitterB;
@property (weak, nonatomic) IBOutlet UIButton *pinterestB;


@property (weak, nonatomic) IBOutlet UITextField *emailBajTF;


@end

@implementation ContactUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.address.enabled = YES;
    
    //map
    MKCoordinateSpan span = MKCoordinateSpanMake(0.1, 0.1);
    CLLocationCoordinate2D location = CLLocationCoordinate2DMake(40.1786946,44.5250605);
    MKCoordinateRegion region =  MKCoordinateRegionMake(location, span);
    [self.mapView setRegion:region animated:true];
    
    MKPointAnnotation *annotation = [MKPointAnnotation alloc];
    annotation.coordinate = location;
    annotation.title = @"Learn Pro";
    [self.mapView addAnnotation:annotation];
    
    [self textFieldActions];
    [self textViewBorder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void) textFieldActions {
    self.nameTF.leftViewMode = UITextFieldViewModeAlways;
    self.nameTF.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user.png"]];
    
    self.emailTF.leftViewMode = UITextFieldViewModeAlways;
    self.emailTF.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mess.png"]];
    
    self.phoneTF.leftViewMode = UITextFieldViewModeAlways;
    self.phoneTF.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"phone_gray.png"]];
    
}

-(void) textViewBorder {
    CALayer *imageLayer = self.commentTV.layer;
    [imageLayer setCornerRadius:10];
    [imageLayer setBorderWidth:0.5];
    imageLayer.borderColor=[[UIColor lightGrayColor] CGColor];
}

#pragma mark - Validations
- (BOOL) checkFields {
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:nil
                                 message:@"Message"
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okButton = [UIAlertAction
                                actionWithTitle:@"OK"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    //Handle your yes please button action here
                                }];
    
    [alert addAction:okButton];
    
    if (!(self.nameTF.text && self.nameTF.text.length > 0)) {
        [self presentViewController:alert animated:YES completion:nil];
        alert.message = @"«Անուն» պարտադիր դաշտ է:";
        return NO;
    }
    if (!(self.emailTF.text.length > 0)) {
        [self presentViewController:alert animated:YES completion:nil];
        alert.message = @"«Էլ․Փոստ» պարտադիր դաշտ է:";
        return NO;
    }
    if (![self.emailTF.text isValidEmail]) {
        [self presentViewController:alert animated:YES completion:nil];
        alert.message = @"Սխալ «Էլ․Փոստ»";
        self.emailTF.text = nil;
        return NO;
    }
    if (!(self.phoneTF.text.length > 0)) {
        [self presentViewController:alert animated:YES completion:nil];
        alert.message = @"«Հեռախոսահամար» պարտադիր դաշտ է:";
        return NO;
    }
    if (!(self.commentTV.text && self.commentTV.text.length > 0)) {
        [self presentViewController:alert animated:YES completion:nil];
        alert.message = @"«Հաղորդագրություն» պարտադիր դաշտ է:";
        return NO;
    }
    return YES;
}

#pragma mark - Keyboard

////////////////////////////////////////////////
////////////////////////////////////////////////
////////////////////////////////////////////////

#pragma mark - Actions

- (IBAction)tapOnScreen:(id)sender {
    [self.view endEditing:YES];
}

//call phone
- (IBAction)callImageButtonClicked:(id)sender {
    [self call];
}

- (IBAction)callButtonClicked:(id)sender {
    [self call];
}

//send mail
- (IBAction)mailButtonClicked:(id)sender {
    [self sendMail];
}

- (IBAction)mailImageButtonClicked:(id)sender {
    [self sendMail];
}



-(void)call {
    NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",@"+37498156446"]]; //self.callNumber.titleLabel.text
    if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
        [[UIApplication sharedApplication] openURL:phoneUrl];
    } else
    {
        //        calert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Call facility is not available!!!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        //        [calert show];
    }
}

-(void)sendMail {
    NSString *emailTitle = @"Learn Pro";
    NSArray *toRecipents = [NSArray arrayWithObject:@"manuchmeri@gmail.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setToRecipients:toRecipents];
    [self presentViewController:mc animated:YES completion:NULL];
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}


//soc
- (IBAction)facebookBClicked:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://www.facebook.com/Learnpro.am"]];
}

- (IBAction)vimeoBClicked:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://vimeo.com/user34458599/videos"]];
}

- (IBAction)twitterBClicked:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://twitter.com/LearnProAM"]];
}

- (IBAction)pinterestBClicked:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://www.pinterest.com/?show_error=true"]];
}

//send mail bajNew
- (IBAction)sendBClicked:(id)sender {
    if ([self checkFields]) {
    }
}

- (IBAction)sendNewsB:(id)sender {
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:nil
                                 message:@"Message"
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okButton = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   //Handle your yes please button action here
                               }];
    
    [alert addAction:okButton];
    
    if (!(self.emailBajTF.text.length > 0)) {
        [self presentViewController:alert animated:YES completion:nil];
        alert.message = @"«Էլ․Փոստ» պարտադիր դաշտ է:";
        return;
    }
    if (![self.emailTF.text isValidEmail]) {
        [self presentViewController:alert animated:YES completion:nil];
        alert.message = @"Սխալ «Էլ․Փոստ»";
        self.emailTF.text = nil;
    }
    //TO DO
}

@end
