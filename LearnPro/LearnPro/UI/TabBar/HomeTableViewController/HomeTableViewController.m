//
//  HomeTableViewController.m
//  LearnPro
//
//  Created by Meri on 1/19/18.
//  Copyright © 2018 Meri. All rights reserved.
//

#import "HomeTableViewController.h"
#import "WhyLearnProCollectionViewCell.h"
#import "BeFreeCollectionViewCell.h"
#import "SubectsCollectionViewCell.h"

#import "ClassesViewController.h"
#import "SubjectViewController.h"


#pragma Mark - models
#import "LPSubject.h"

#pragma Mark - api
#import "LPSubjectsApi.h"

#define WLPdata @"WLPdata.json"
#define BFdata @"BFdata.json"




static NSString *WLPIdentifier = @"WLPCell";
static NSString *BeFreeIdentifier = @"BeFreeCell";
static NSString *SubjectIdentifier = @"SubjectCell";


@interface HomeTableViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *wlpCollection;
@property (weak, nonatomic) IBOutlet UICollectionView *BFCollection;
@property (weak, nonatomic) IBOutlet UICollectionView *SubjectsCollection;

@property (nonatomic, strong) NSMutableArray <LPSubject *> *subjectsArray; //TO DO


@property(nonatomic)NSArray *wLPdata;

@property (weak, nonatomic) IBOutlet UIButton *startLessonButton;



@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.startLessonButton.layer.borderWidth = 2.0f;
    self.startLessonButton.layer.borderColor = [UIColor blackColor].CGColor;
    
    [self.wlpCollection registerNib:[UINib nibWithNibName:@"WhyLearnProCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:WLPIdentifier];
    [self.BFCollection registerNib:[UINib nibWithNibName:@"BeFreeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:BeFreeIdentifier];
    [self.SubjectsCollection registerNib:[UINib nibWithNibName:@"SubectsCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:SubjectIdentifier];
    
    [self parseJSON];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if([collectionView isEqual:self.wlpCollection]) {
        return 6;
    }
    if([collectionView isEqual:self.BFCollection]) {
        return 3;
    }
    if([collectionView isEqual:self.SubjectsCollection]) {
        return 5;
    }
    return 10;
}

- (void)parseJSON {
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"WLPdata" ofType:@"json"]];
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:data
                                                                                                                options:0
                                                                                                                    error:nil];
    self.wLPdata = (NSArray *)parsedObject;
    
    NSLog(@"---> %lu", (unsigned long)parsedObject.count);
    for (int i = 0; i < self.wLPdata.count; ++i) {
        NSLog(@"%@", self.wLPdata[i]);
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if([collectionView isEqual:self.wlpCollection]){
//        WhyLearnProCollectionViewCell *cell = (WhyLearnProCollectionViewCell *)[[NSBundle mainBundle] loadNibNamed:@"WhyLearnProCollectionViewCell" owner:nil options:nil][0];
        WhyLearnProCollectionViewCell *cell= [collectionView dequeueReusableCellWithReuseIdentifier:WLPIdentifier forIndexPath:indexPath];
        switch (indexPath.row) {
                //TO CHANGE TO JSON
            case 0:
                cell.backView.backgroundColor = [UIColor colorWithRed:0.97 green:0.77 blue:0.25 alpha:1.0];
                cell.title.text = @"ՈՒՍՈՒՑՈՒՄ՝ ՀԱՄԱՊԱՏԱՍԽԱՆ ՄԻՋԱԶԳԱՅԻՆ ՉԱՓԱՆԻՇՆԵՐԻՆ";
                cell.image.image = [UIImage imageNamed:@"0.png"];
                cell.text.text = @"Բոլոր գործընթացները կազմակերպված են միջազգային չափորոշիչներին համապատասխան:";
                break;
            case 1:
                cell.backView.backgroundColor = [UIColor colorWithRed:0.93 green:0.36 blue:0.25 alpha:1.0];
                cell.title.text = @"ԼԻԱՐԺԵՔ ԷԼԵԿՏՐՈՆԱՅԻՆ ԴԱՍՈՒՍՈՒՅՑՆԵՐ";
                cell.image.image = [UIImage imageNamed:@"1.png"];
                cell.text.text = @"Մեր էլեկտրոնային դասուսույցները պարունակում են դպրոցական առարկաների ամբողջական նյութը և ավելին:";
                break;
            case 2:
                cell.backView.backgroundColor = [UIColor colorWithRed:0.39 green:0.82 blue:0.51 alpha:1.0];
                cell.title.text = @"ԽՆԱՅԵՔ ՁԵՐ ՖԻՆԱՆՍԱԿԱՆ ՄԻՋՈՑՆԵՐԸ";
                cell.image.image = [UIImage imageNamed:@"2.png"];
                cell.text.text = @"Մեր դասուսույցները անհամեմատ էժան են դասախոսների հետ անհատական պարապմունքներից:";
                break;
            case 3:
                cell.backView.backgroundColor = [UIColor colorWithRed:0.28 green:0.67 blue:0.95 alpha:1.0];
                cell.title.text = @"ԼԻԱՐԺԵՔ ԻՆՔՆՈՒՐՈՒՅՆ ԿՐԹՈՒԹՅՈՒՆ";
                cell.image.image = [UIImage imageNamed:@"3.png"];
                cell.text.text = @"Ուսումը մեր դասուսույցներով լիարժեք է, որակյալ և մատչելի ցանկացած վայրում և ցանկացած ժամին:";
                break;
            case 4:
                cell.backView.backgroundColor = [UIColor colorWithRed:0.68 green:0.27 blue:0.76 alpha:1.0];
                cell.title.text = @"ԷԼԵԿՏՐՈՆԱՅԻՆ ԴԱՍԵՐԸ ԴՅՈՒՐԸՆԿԱԼԵԼԻ ԵՆ";
                cell.image.image = [UIImage imageNamed:@"4.png"];
                cell.text.text = @"Դասուսույցներում բոլոր բացատրությունները ուղեկցվում են պատկերավոր ցուցադրություններով և ապահովում նյութի հեշտ և լիարժեք յուրացումը:";
                break;
            case 5:
                cell.backView.backgroundColor = [UIColor colorWithRed:0.37 green:0.80 blue:0.75 alpha:1.0];
                cell.title.text = @"ՈՒՍՈՒՑՄԱՆ ԻՆՏԵՐԱԿՏԻՎ ՏԵԽՆՈԼՈԳԻԱՆԵՐ";
                cell.image.image = [UIImage imageNamed:@"5.png"];
                cell.text.text = @"Սովորողը ակտիվ մասնակցում է Ուսումնական նյութի մատուցման, գործնական, լաբորատոր աշխատանքների ու խնդիրների լուծման գործընթացներին:";
                break;
        }
        return cell;
    } else if([collectionView isEqual:self.BFCollection]){
        BeFreeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:BeFreeIdentifier forIndexPath:indexPath];
            switch (indexPath.row) {
                case 0:
                    cell.icon.image = [UIImage imageNamed:@"timer.png"];
                    cell.titel.text = @"ԿԱՌԱՎԱՐԻՐ ՔՈ ԺԱՄԱՆԱԿԸ";
                    cell.text.text = @"Էլեկտրոնային դասուսույցը դասը մատուցում է այնպիսի բաժիններով ու մանրամասնությամբ, որ ապահովվի դրա ինքնուրույն ու հեշտ ընկալումը կայքից: Այն միշտ մատչելի է առցանց:";
                    cell.image.image = [UIImage imageNamed:@"BF0.png"];
                break;
                case 1:
                    cell.icon.image = [UIImage imageNamed:@"books.png"];
                    cell.titel.text = @"ԼԻԱՐԺԵՔ ՈՐԱԿՅԱԼ ԳԻՏԵԼԻՔ";
                    cell.text.text = @"Էլեկտրոնային դասուսույցները պարբերաբար ճշտվում ու նորացվում են աշխարհում գիտական ու տեխնոլոգիական նվաճումներին զուգահեռ:";
                    cell.image.image = [UIImage imageNamed:@"BF1.png"];
                    break;
                case 2:
                    cell.icon.image = [UIImage imageNamed:@"graduationCap.png"];
                    cell.titel.text = @"ՈՐԱԿՅԱԼ ՈՒՍՈՒՑՈՒՄ";
                    cell.text.text = @"Ուսումնական նյութի մատուցումը ապահովում է սովորողի մոտ այդ գիտելիքների կիռարման հմտությունների ձևավորումը:";
                    cell.image.image = [UIImage imageNamed:@"BF2.png"];
                    break;
            }
        return cell;
    } else if([collectionView isEqual:self.SubjectsCollection]){
        SubectsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SubjectIdentifier forIndexPath:indexPath];
        
        switch (indexPath.row) {
                //TO CHANGE TO JSON
            case 0:
                cell.backView.backgroundColor = [UIColor colorWithRed:0.93 green:0.36 blue:0.27 alpha:1.0];
                cell.titel.text = @"ՖԻԶԻԿԱ";
                cell.image.image = [UIImage imageNamed:@"physics.png"];
                break;
            case 1:
                cell.backView.backgroundColor = [UIColor colorWithRed:0.39 green:0.80 blue:0.44 alpha:1.0];
                cell.titel.text = @"ԵՐԿՐԱՉԱՓՈՒԹՅՈՒՆ";
                cell.image.image = [UIImage imageNamed:@"math1.png"];
                break;
            case 2:
                cell.backView.backgroundColor = [UIColor colorWithRed:0.37 green:0.80 blue:0.76 alpha:1.0];
                cell.titel.text = @"ՄԱԹԵՄԱՏԻԿԱ";
                cell.image.image = [UIImage imageNamed:@"math.png"];
                break;
            case 3:
                cell.backView.backgroundColor = [UIColor colorWithRed:0.93 green:0.37 blue:0.39 alpha:1.0];
                cell.titel.text = @"ՔԻՄԻԱ";
                cell.image.image = [UIImage imageNamed:@"chemistry.png"];
                break;
            case 4:
                cell.backView.backgroundColor = [UIColor colorWithRed:0.19 green:0.42 blue:0.16 alpha:1.0];
                cell.titel.text = @"ԿԵՆՍԱԲԱՆՈՒԹՅՈՒՆ";
                cell.image.image = [UIImage imageNamed:@"microscope.png"];
                break;
        }
        //TO DO
        //NEED API
        return cell;
    } else return nil;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            return self.view.frame.size.height / 2.8f;
        case 1:
            return self.view.frame.size.height / 2.13f;
        case 2:
            return self.view.frame.size.height / 1.1f;
        case 4:
            return self.view.frame.size.height / 2.0f;
        default:
            break;
    }
    return self.view.frame.size.height /3.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UIViewController* vc;
    [self.navigationController pushViewController:vc animated:YES];
    // TO DO ONLY FOR SUBJECT - ?
    
    
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat height = collectionView.frame.size.height * 9 / 10;
    NSLog(@"%f", height);
    if([collectionView isEqual:self.wlpCollection]){
        return CGSizeMake(height / 1.22, height );
    }else{
        if([collectionView isEqual:self.BFCollection]){
            return CGSizeMake(height / 1.7, height );
        } else {
            return CGSizeMake(height/1.3, height/1.3);
        }
    }
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 2;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([collectionView isEqual:self.SubjectsCollection]) {
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([collectionView isEqual:self.SubjectsCollection]) {
        
        ClassesViewController* temp= [[UIStoryboard storyboardWithName:@"Lessons" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"ClassesViewController"];
        temp.view.backgroundColor =  [UIColor colorWithRed:0.93 green:0.36 blue:0.27 alpha:1.0];
        //guyn@ poxancel
        temp.navigationItem.title = @"Ֆիզիկա"; //to change
        
        [self.navigationController pushViewController:temp animated:YES];
        
    }
    //TO DO
}


#pragma mark - Play video
- (IBAction)playButtonClicked:(id)sender {
    [self playVideo];
}

- (IBAction)tapOnPlayView:(id)sender {
[self playVideo];
    
}

-(void)playVideo{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://www.youtube.com/watch?v=v_3Zf5IwbDg"]];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    } else{
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"YouTube"
                                                                                                    message:@"Sorry!!! \nCann't to access YouTube link"
                                                                                            preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* okButton = [UIAlertAction actionWithTitle:@"OK"
                                                                                        style:UIAlertActionStyleDefault
                                                                                    handler:^(UIAlertAction * action) {}];
        [alert addAction:okButton];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

#pragma mark - StartLesson button chlicked

- (IBAction)startLesson:(id)sender {
    
    self.subjectsArray = [NSMutableArray alloc];
    
    [LPSubjectsApi getSubjectsWithcallback:^(MSRequest *aRequest, NSDictionary *aResult, NSError *aError) {
        if (aResult) {
            NSArray* arr = aResult[@"data"];
            for (int i = 0; i < arr.count; i++) {
                [self.subjectsArray addObject: [[LPSubject alloc]initWithDictionary: arr[i]]];
            }
            self.subjectsArray = aResult[@"meta"][@"length"];
        }
        [self.SubjectsCollection reloadData];
    }];
    
    SubjectViewController* temp= [[UIStoryboard storyboardWithName:@"Lessons" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"SubjectViewController"];
    
    [self.navigationController pushViewController:temp animated:YES];
}


#pragma mark - Functions

- (void) addShadow: (UIView*) view{
    view.layer.shadowOffset = CGSizeMake(1, 1);
    view.layer.shadowColor = [[UIColor blackColor] CGColor];
    view.layer.shadowRadius = 2.0f;
    view.layer.shadowOpacity = 1.f;
}




@end


