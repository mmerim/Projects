//
//  RightView.m
//  LearnPro
//
//  Created by Meri on 2/1/18.
//  Copyright © 2018 Meri. All rights reserved.
//

#import "RightView.h"
#import "InfoViewController.h"
#import "AppDelegate.h"



@interface RightView () 
{

NSMutableArray *sectionArray;
NSMutableArray *texArray;
NSMutableArray *ognArray;
    
}
@end

@implementation RightView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    sectionArray = [[NSMutableArray alloc]initWithObjects:@"ՏԵՂԵԿՏՎՈՒԹՅՈՒՆ", @"ՕԳՆՈՒԹՅՈՒՆ", nil];
    texArray = [[NSMutableArray alloc] initWithObjects:@"Մեր Մասին", @"Իմ Անձնական Էջը", @"Ինչպես Օգտվել", nil];
    ognArray = [[NSMutableArray alloc] initWithObjects:@"Հաճախ Տրվող Հարցեր", @"Օգտագործման Պայմաններ", @"Գաղտնիության Քաղաքականոթյուն", nil];
    
    [[self menuTableView]setDelegate:self];
    [[self menuTableView]setDataSource:self];
    [[self menuTableView]reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [sectionArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return [texArray count];
            break;
        case 1:
            return [ognArray count];
            break;
        default:
            break;
    }
    return 0;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [sectionArray objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [texArray objectAtIndex:indexPath.row];
            break;
        case 1:
            cell.textLabel.text = [ognArray objectAtIndex:indexPath.row];
            break;
            
        default:
            break;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    InfoViewController* temp= [[UIStoryboard storyboardWithName:@"MenuSide"
                                                                                              bundle:[NSBundle mainBundle]]
                                            instantiateViewControllerWithIdentifier:@"InfoViewController"];
    
    temp.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"home.png"]
                                                                                                                             style:UIBarButtonItemStylePlain
                                                                                                                           target:self
                                                                                                                           action:@selector(goHome)];
    
    UINavigationController *ntemp = [[UINavigationController alloc]initWithRootViewController:temp];
    
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0: {
                    temp.navigationItem.title = @"0bbbb";
//                    [self.infoDelegate setTitel:@"hi" AndText:@"sdfghjkl"];
                }break;
                case 1: temp.title = @"0bbbb"; break;
                case 2: temp.title = @"0cccc"; break;
                default: break;
            }
            break;
        }
        case 1:
        {
            switch (indexPath.row) {
                case 0: {
//                    temp.navigationItem.title = sectionArray[indexPath.row]
                    [temp setTitel:@"bnm," AndText:@"xcvbnm,"];
                    
                    break;
                }
                case 1: {
                    temp.title = @"1bbbb";
                    break; }
                case 2: temp.title = @"1cccc"; break;
                default: break;
            }
            break;
        }
        default:
            break;
    }
    [self presentViewController:ntemp animated:YES completion:nil];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45.0;
}

-(void)goHome {
        AppDelegate *app =  (AppDelegate*)[[UIApplication sharedApplication]delegate];
        [app firstPage];
}

@end

