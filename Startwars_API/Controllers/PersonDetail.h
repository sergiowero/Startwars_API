//
//  PersonDetail.h
//  Startwars_API
//
//  Created by Virtual Box on 11/14/17.
//  Copyright © 2017 UAG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWObject.h"

@interface PersonDetail : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelHeight;
@property (weak, nonatomic) IBOutlet UILabel *labelMass;
@property (weak, nonatomic) IBOutlet UILabel *labelHair;
@property (weak, nonatomic) IBOutlet UILabel *labelSkin;
@property (weak, nonatomic) IBOutlet UILabel *labelEyes;
@property (weak, nonatomic) IBOutlet UILabel *labelBirthYear;
@property (weak, nonatomic) IBOutlet UILabel *labelGender;
@property (weak, nonatomic) IBOutlet UILabel *labelPlanet;

- (void)setPerson:(SWObject*)person;

@end
