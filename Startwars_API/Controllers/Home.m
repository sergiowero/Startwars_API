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
#import "PersonDetail.h"

@interface Home ()
@property NSMutableArray *people;
@end

int requestCounter = 0;

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
    
    [_people removeAllObjects];
    [self.tableView reloadData];
    requestCounter = 0;
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [WebServices getPeople:1 completion:^(NSMutableArray<SWObject> *people) { [self handler:people]; }];
    [WebServices getPeople:2 completion:^(NSMutableArray<SWObject> *people) { [self handler:people]; }];
    [WebServices getPeople:3 completion:^(NSMutableArray<SWObject> *people) { [self handler:people]; }];
    [WebServices getPeople:4 completion:^(NSMutableArray<SWObject> *people) { [self handler:people]; }];
    [WebServices getPeople:5 completion:^(NSMutableArray<SWObject> *people) { [self handler:people]; }];
    [WebServices getPeople:6 completion:^(NSMutableArray<SWObject> *people) { [self handler:people]; }];
    [WebServices getPeople:7 completion:^(NSMutableArray<SWObject> *people) { [self handler:people]; }];
    [WebServices getPeople:8 completion:^(NSMutableArray<SWObject> *people) { [self handler:people]; }];
    [WebServices getPeople:9 completion:^(NSMutableArray<SWObject> *people) { [self handler:people]; }];
}

-(void) handler:(NSMutableArray<SWObject>*) people {
    if(people){
        //[_people removeAllObjects];
        [_people addObjectsFromArray:people];
    }
    requestCounter ++;
    if(requestCounter == 9){
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [self.tableView reloadData];
    }
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


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     
     PersonDetail* detailView = (PersonDetail*)[segue destinationViewController];
     long index = [self.tableView.indexPathForSelectedRow row];
     [detailView setPerson: [self.people objectAtIndex:index]];
 }
 
@end
