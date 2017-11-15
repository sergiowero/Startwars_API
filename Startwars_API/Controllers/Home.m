//
//  ViewController.m
//  Startwars_API
//
//  Created by Virtual Box on 11/8/17.
//  Copyright © 2017 UAG. All rights reserved.
//

#import "Home.h"
#import "WebServices.h"
#import "Constants.h"
#import "SWPersonCell.h"

@interface Home ()
@property NSMutableArray *people;
@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _people = [[NSMutableArray alloc] init];
    [self refreshPeople];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnRefreshPressed:(id)sender {
    [self refreshPeople];
}

-(void) refreshPeople {
    if([UIApplication sharedApplication].networkActivityIndicatorVisible)
        return;
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [WebServices getPeople:^(NSMutableArray<SWObject> *people) {
        
        if(people){
            [_people removeAllObjects];
            [_people addObjectsFromArray:people];
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [self.tableView reloadData];
    }];
}

#pragma mark - Table

- (NSInteger)numberOfSectionTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.people count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return 50.5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    SWPersonCell *cell = (SWPersonCell *)[tableView dequeueReusableCellWithIdentifier:@"SWPersonCell"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"SWPersonCell" bundle:nil] forCellReuseIdentifier:@"SWPersonCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"SWPersonCell"];
    }
    
    //Fill cell with info from arrays
    cell.labelName.text = [[self.people objectAtIndex:[indexPath row]] name];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"PeopleTableToDetail" sender:self];
}
@end
