//
//  EyleriDzevapoxvacMethodViewController.m
//  DiplomaWork
//
//  Created by Meri on 5/2/17.
//  Copyright © 2017 Meri. All rights reserved.
//

#import "EyleriDzevapoxvacMethodViewController.h"
#import "CustomDiferencialTableViewCell.h"

@interface EyleriDzevapoxvacMethodViewController () <UIPickerViewDataSource,UIPickerViewDelegate, UITextViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *hValue;
@property (weak, nonatomic) IBOutlet UITextField *x0Value;
@property (weak, nonatomic) IBOutlet UITextField *y0Value;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *hashvelButton;


@property(weak, nonatomic) NSMutableArray *arrayOfXLebles;
@property(strong, nonatomic) NSMutableDictionary *dic;
@property(strong, nonatomic) NSString *aValue;

// for my counting
@property(retain, nonatomic) NSMutableArray *arrayOfXValues;
@property(retain, nonatomic) NSMutableArray *arrayOfYValues;

@property(retain, nonatomic) NSMutableArray *arrayOfXKesValues;
@property(retain, nonatomic) NSMutableArray *arrayOfYKesValues;

@property(retain, nonatomic) NSMutableArray *arrayOfFValues;


@end

@implementation EyleriDzevapoxvacMethodViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Էյլերի ձեւափոխված մեթոդ";
    [self.hashvelButton setTitle:@"Հաշվել" forState:UIControlStateNormal];
    
    self.numberOfN = 1;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self hideKeyboardWhenTouchingBackground];
    
    if (!self.dic) self.dic = [[NSMutableDictionary alloc]init];
    
    //given elements of arrays
    if (!self.arrayOfXValues)
        self.arrayOfXValues = [[NSMutableArray alloc] init];
    self.arrayOfXValues[0] = self.x0Value;
    
    if (!self.arrayOfYValues)
        self.arrayOfYValues = [[NSMutableArray alloc] init];
    self.arrayOfYValues[0] = self.y0Value;
    
    if (!self.arrayOfXKesValues)
        self.arrayOfXKesValues = [[NSMutableArray alloc] init];
    self.arrayOfXKesValues[0] = self.x0Value;
    
    if (!self.arrayOfYKesValues)
        self.arrayOfYKesValues = [[NSMutableArray alloc] init];
    self.arrayOfYKesValues[0] = self.y0Value;
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.tabBarController.title = self.tabBarItem.title;
    [self addKeyboardObservsers];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self removeKeyboardObservsers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void) clearContents{
    [self.hValue setText:@""];
    [self.x0Value setText:@""];
    [self.y0Value setText:@""];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if ([textField.text rangeOfCharacterFromSet:[NSCharacterSet letterCharacterSet]].location != NSNotFound) {
        [self clearContents];
    }
    return YES;
}

#pragma mark - PickerView
// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 900;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return  [NSString stringWithFormat:@"%ld",(long)row+1];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger) component {
    self.numberOfN = row+1;
    [self.tableView reloadData];
}

#pragma mark - TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = ( (self.numberOfN + 1) * (self.numberOfN + 2) ) / 2;
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomDiferencialTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell setStacox: self];
    self.aValue = [self.dic valueForKey: [NSString stringWithFormat: @"a%ld",(long)indexPath.row]];
    [cell updateCell:indexPath.row aValue: self.aValue];
    return cell;
}


#pragma mark - Hide keyboard when touching in the background
- (void)handleSingleTap:(UITapGestureRecognizer *) sender {
    [self.view endEditing:YES];
}

-(void)hideKeyboardWhenTouchingBackground {
    UIGestureRecognizer *tapper;
    tapper = [[UITapGestureRecognizer alloc]
              initWithTarget:self action:@selector(handleSingleTap:)];
    tapper.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapper];
}


#pragma mark - Keyboard
-(void)addKeyboardObservsers {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShown:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHidden:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)removeKeyboardObservsers {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

-(void)keyboardShown:(NSNotification*) notification {
    NSDictionary* info = [notification userInfo];
    double animationDuration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    [UIView animateWithDuration:animationDuration animations:^{
        self.tableView.contentInset = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0);
        self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0);
    }];
}

-(void)keyboardHidden:(NSNotification*)notification {
    double animationDuration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:animationDuration
                     animations:^{
                         self.tableView.contentInset = UIEdgeInsetsZero;
                         self.tableView.scrollIndicatorInsets =UIEdgeInsetsZero;
                     }];
}

-(void)saveValue:(NSString *) labelTextA keyA:(NSString *)key {
    [self.dic setValue: labelTextA forKey: key];
}

#pragma mark -Counting Eyler Dzevapoxvac
-(double)countFx:(double)x  y:(double)y  k:(int)k {
    [self.arrayOfFValues insertObject:[NSNumber numberWithDouble:0] atIndex:k];
    double sum = 0;
    for(int i = 0, p = 0; i < self.numberOfN + 1; ++i) {
        for(int j = 0; j < self.numberOfN - i + 1; ++j, ++p) {
            NSString *aIKey = [NSString stringWithFormat: @"a%ld",(long)p];
            double aI = [[self.dic valueForKey: aIKey] integerValue];
            NSNumber *x = [self.arrayOfXValues objectAtIndex:k];
            NSNumber *y = [self.arrayOfYValues objectAtIndex:k];
            double current = aI * x.doubleValue * y.doubleValue;
            current = aI * pow(x.doubleValue, i)* pow(y.doubleValue, j);
            sum += current;
        }
    }
    [self.arrayOfFValues insertObject:[NSNumber numberWithDouble:sum] atIndex:k];
    NSNumber *f =  [self.arrayOfFValues objectAtIndex:k];
    return f.doubleValue;
}

-(void)countEylerDzevapoxvac{
    self.arrayOfXValues[0] = [NSNumber numberWithDouble:self.x0Value.text.doubleValue];
    self.arrayOfYValues[0] = [NSNumber numberWithDouble:self.y0Value.text.doubleValue];
    
    for(int i = 1; i < self.numberOfN + 1; ++i) {
        self.arrayOfXValues[i] = [NSNumber numberWithDouble:self.x0Value.text.doubleValue + (i * self.hValue.text.doubleValue)];
        NSLog(@"%f", [self.arrayOfXValues[i] doubleValue]);
        NSLog(@"%f", self.hValue.text.doubleValue / 2);
//        NSNumber * current = [self.arrayOfXValues objectAtIndex:i];
        self.arrayOfXKesValues[i] = [NSNumber numberWithDouble:[self.arrayOfXValues[i] doubleValue] + self.hValue.text.doubleValue / 2];
        NSLog(@"x[%d]=%f", i, [self.arrayOfXValues[i] doubleValue]);
        NSLog(@"xKes[%d]=%f", i, [self.arrayOfXKesValues[i] doubleValue]);
    }
    
    
    for(int k = 0; k < self.numberOfN; ++k) {
        self.arrayOfFValues[0] = [NSNumber numberWithDouble:0];
        
        NSNumber *xk = [self.arrayOfXValues objectAtIndex:k];
        NSNumber *yk = [self.arrayOfYValues objectAtIndex:k];
        double aa = [self countFx:xk.doubleValue y:yk.doubleValue k:k];
        NSNumber * curY = [self.arrayOfXValues objectAtIndex:k];
        self.arrayOfYKesValues[k] = [NSNumber numberWithDouble:curY.doubleValue + (aa * self.hValue.text.doubleValue / 2)];

        
        NSNumber *fk = [self.arrayOfFValues objectAtIndex:k] ;
        double current = yk.doubleValue + (self.hValue.text.doubleValue * fk.doubleValue);
        self.arrayOfYValues[k + 1] = [NSNumber numberWithDouble:current];
    }
    
}
- (IBAction)hashvelButtonClicked:(id)sender {
    [self countEylerDzevapoxvac];}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqual: @"result"]){
        ResultViewController *result = ( ResultViewController *)segue.destinationViewController;
        [result showResultX: self.arrayOfXValues
                          Y:self.arrayOfYValues
                  numberOfN:self.numberOfN
                      title:@"Էյլերի ձեւափոխված մեթոդի արդյունքը՝"];
    }
}
@end
