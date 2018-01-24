//
//  AboutUsViewController.m
//  LearnPro
//
//  Created by Meri on 11/27/17.
//  Copyright © 2017 Meri. All rights reserved.
//

#import "AboutUsViewController.h"
#import "SubviewViewController.h"

#define aboutUs @"Կոմպասս ՍՊԸ-ը Հայաստանի ICT շուկայում գործելու արդեն 15 տարվա փորց ունեցող ձերնարկություն է: 2013 թ. մենք հիմնել ենք բաժին, որը պետք է հանրությանը արդյունավետ ու որակյալ առցանց կրթություն ապահովելու նպատակով ներկայացներ մատչելի էլեկտրոնային կրթական շտեմարաններ ու ծրագրեր: Արդյունքում ստեղծվեցին learnpro.am և sovorir.am հարթակները, որոնք նպատակ ունեն ապահովել անկախ, արդյունավետ կրթական միջավայր Հայալեզու հանրության համար: Դրանք ներառում են ինչպես դպրոցական առարկաների այնպես էլ մասնագիտական մի շարք դասընթացների էլեկտրոնային շտեմարաններ, որոնք կարող են նախ օգտակար լինել հասարակության տարբեր շերտերին իրենց մասնագիտական որակը ապահովելու ու արդիականացնելու համար և բացի դրանից բարձրացնել դպրոցում օգտագործվող կրթական տեխնոլոգիաների արդյունավետությունը: Ապահովել աշակերտների ակտիվ մասնակցությունը ուսումնական գործընթացներին և ձևավորել նրանց մոտ ստացված գիտելիքների կիռարման հմտություններ: Այս տարիների ընթացքում մեզ մոտ ձևավորվել է բարձր որակավորում ունեցող հեղինակների, արհեստավարժ օպերատորների ու դիզայներների թիմ, որը ստեղծում է որակյալ էլեկտրոնային կրթական ռեսուրսներ(ԷԿՌ): Մեր արտադրանքը` ավելի քան 30 դպրոցական ԷԿՌ-ներ անցել են բովանդակային և որակական ստուգում Կրթության Ազգային Ինստիտուտի մասնագետների կողմից, և ունեն ՀՀ ԿԳ Նախարարության արտոնագիրը: Իրենց պատկերավորությամբ, շարադրանքով ու ուսումնական նյութի ամողջական մատուցմամբ այդ նյութերը չունեն այլընտրանք Հայաստանում:"

@interface AboutUsViewController ()

@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIImageView *aboutUsImage;
@property (weak, nonatomic) IBOutlet UITextView *aboutUsText;

@property (weak, nonatomic) IBOutlet UIView *view2;

@end

@implementation AboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.aboutUsImage.image = [UIImage imageNamed:@"aboutUsImage.jpg"];
    
    [self textViewHeight];
    SubviewViewController * svc = [[SubviewViewController alloc]init];
    self.view2 = svc.View;
    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)textViewHeight {
    self.aboutUsText.text = aboutUs;
    self.aboutUsText.font = [UIFont systemFontOfSize:14];
    CGRect frame = self.aboutUsText.frame;
    frame.size.height = self.aboutUsText.contentSize.height;
    self.aboutUsText.frame=frame;
}



@end
