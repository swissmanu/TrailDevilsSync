//
//  TDSCheckInTableViewController.m
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 11.11.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import "TDSCheckInTableViewController.h"
#import "TDSUser.h"
#import "TDSTrail.h"
#import "TDSTrailCheckIn.h"

@interface TDSCheckInTableViewController()

- (void)loadObjectsFromDataStoreWith:(NSPredicate*)predicate;

@end

@implementation TDSCheckInTableViewController

@synthesize user, trail, fetchController;

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        trail = nil;
        user = nil;
    }
    
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = NSLocalizedString(@"Check Ins", @"Check Ins");
}

- (void)loadDataWithUser {
    // Load the object model via RestKit	
    RKObjectManager* objectManager = [RKObjectManager sharedManager];
    
    [objectManager loadObjectsAtResourcePath:[NSString stringWithFormat:@"/users/%i/checkins", [[user userId] intValue]] delegate:self block:^(RKObjectLoader* loader) {
        loader.objectMapping = [objectManager.mappingProvider objectMappingForClass:[TDSTrailCheckIn class]];
    }]; 
}

- (void)loadObjectsFromDataStoreWithUser {
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"userId == %i", [[user userId] intValue]];

    [self loadObjectsFromDataStoreWith:predicate];
}

- (void)loadDataWithTrail {
    // Load the object model via RestKit	
    RKObjectManager* objectManager = [RKObjectManager sharedManager];
    
    [objectManager loadObjectsAtResourcePath:[NSString stringWithFormat:@"/trails/%i/checkins", [[trail trailId] intValue]] delegate:self block:^(RKObjectLoader* loader) {
        loader.objectMapping = [objectManager.mappingProvider objectMappingForClass:[TDSTrailCheckIn class]];
    }]; 
}

- (void)loadObjectsFromDataStoreWithTrail {
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"trailId == %i", [[trail trailId] intValue]];
    
    [self loadObjectsFromDataStoreWith:predicate];
}

- (void)loadObjectsFromDataStoreWith:(NSPredicate*)predicate {
    NSFetchRequest* fetchRequest = [TDSTrailCheckIn fetchRequest];
    NSSortDescriptor *sortCheckInsByDate = [NSSortDescriptor sortDescriptorWithKey:@"checkinDateInt" ascending:NO];
    
    [fetchRequest setPredicate:predicate];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortCheckInsByDate, nil]];
    
    fetchController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:[TDSTrailCheckIn managedObjectContext] sectionNameKeyPath:@"day" cacheName:nil];
    
    NSError *error;
    [fetchController performFetch:&error];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [[fetchController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[fetchController sections] objectAtIndex:section] numberOfObjects];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[[fetchController sections] objectAtIndex:section] name];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    TDSTrailCheckIn* curCheckIn = (TDSTrailCheckIn*)[fetchController objectAtIndexPath:indexPath];
    TDSUser *curUser = nil;
    TDSTrail *curTrail = nil;
    
    
    if (user) {
        curUser = user;
        curTrail = [TDSTrail findFirstByAttribute:@"trailId" withValue:curCheckIn.trailId];
        
        cell.textLabel.text = [curTrail name];
        
    } else if (trail) {
        curTrail = trail;
        curUser = [TDSUser findFirstByAttribute:@"userId" withValue:curCheckIn.userId];
        
        cell.textLabel.text = [curUser username];
        
    } else {
        cell.textLabel.text = @"Something is wrong! :(";
    }
    
    cell.detailTextLabel.text = [curCheckIn.checkinDate description];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

#pragma mark RKObjectLoaderDelegate methods

- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjects:(NSArray*)objects {
    if ([objectLoader wasSentToResourcePath:[NSString stringWithFormat:@"/users/%i/checkins", [[user userId] intValue]]]) {
        [self loadObjectsFromDataStoreWithUser];
    } else if ([objectLoader wasSentToResourcePath:[NSString stringWithFormat:@"/trails/%i/checkins", [[trail trailId] intValue]]]) {
        [self loadObjectsFromDataStoreWithTrail];
    }
    
    
	[self.tableView reloadData];
    
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didFailWithError:(NSError*)error {
	UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error" 
                                                    message:[error localizedDescription] 
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
	NSLog(@"Hit error: %@", error);
}

#pragma mark - Setter

- (void)setTrail:(TDSTrail *)aTrail {
    trail = aTrail;
    user = nil;
    
    [self loadObjectsFromDataStoreWithTrail];
    
    [self loadDataWithTrail];
}

- (void)setUser:(TDSUser *)aUser {
    user = aUser;
    trail = nil;
    
    [self loadObjectsFromDataStoreWithUser];
    
    [self loadDataWithUser];

}

@end
