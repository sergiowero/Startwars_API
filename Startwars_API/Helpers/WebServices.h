//
//  WebServices.h
//  Startwars_API
//
//  Created by Virtual Box on 11/8/17.
//  Copyright © 2017 UAG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import "SWObject.h"

@interface WebServices : NSObject<NSURLSessionDelegate>

+ (void)getPeople:(int)page completion:(void (^)(NSMutableArray<SWObject> *people)) handler;
+ (void)getPerson:(NSString*)personID completion: (void (^)(SWObject *person)) handler;

@end
