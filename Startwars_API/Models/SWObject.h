//
//  SWObject.h
//  Startwars_API
//
//  Created by Virtual Box on 11/8/17.
//  Copyright © 2017 UAG. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@protocol SWObject;
@interface SWObject : JSONModel

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *height;
@property (strong, nonatomic) NSString *mass;
@property (strong, nonatomic) NSString *hair_color;
@property (strong, nonatomic) NSString *skin_color;
@property (strong, nonatomic) NSString *eye_color;
@property (strong, nonatomic) NSString *birth_year;
@property (strong, nonatomic) NSString *gender;
@property (strong, nonatomic) NSString *homeworld;
@property (strong, nonatomic) NSMutableArray *films;
@property (strong, nonatomic) NSMutableArray *species;
@property (strong, nonatomic) NSMutableArray *vehicles;
@property (strong, nonatomic) NSMutableArray *starships;

@end
