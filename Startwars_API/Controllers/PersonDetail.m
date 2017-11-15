//
//  PersonDetail.m
//  Startwars_API
//
//  Created by Virtual Box on 11/14/17.
//  Copyright © 2017 UAG. All rights reserved.
//

#import "PersonDetail.h"

@interface PersonDetail ()
@property (nonatomic) SWObject *person;
@end

@implementation PersonDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _labelName.text = _person.name;
    _labelHeight.text = _person.height;
    _labelMass.text = _person.mass;
    _labelHair.text = _person.hair_color;
    _labelSkin.text = _person.skin_color;
    _labelEyes.text = _person.eye_color;
    _labelGender.text = _person.gender;
    _labelPlanet.text = _person.homeworld;
    _labelBirthYear.text = _person.birth_year;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setPerson:(SWObject*)person{
    
    _person = person;
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
