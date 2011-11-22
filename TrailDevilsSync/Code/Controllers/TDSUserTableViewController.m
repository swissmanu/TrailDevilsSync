//
//  TDSTrailTableViewController.m
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 31.10.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import "TDSUserTableViewController.h"
#import "TDSUser.h"
#import "TDSUserDetailViewController.h"

@implementation TDSUserTableViewController

@synthesize users, fetchController;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        users = [NSArray alloc];
        
        self.title = NSLocalizedString(@"Users", @"Users View Controller title");
        self.tabBarItem.image = [UIImage imageNamed:@"group"];
        
        UIBarButtonItem *temporaryBarButtonItem=[[UIBarButtonItem alloc] init];
		temporaryBarButtonItem.title=NSLocalizedString(@"Back", @"Back");
		self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
        
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
        
    [self loadObjectsFromDataStore];
    
    [self loadData];
}


- (void)loadObjectsFromDataStore {
    users = nil;    
    
    NSFetchRequest* fetchRequest = [TDSUser fetchRequest];
    NSSortDescriptor *sortUsersByUsername = [NSSortDescriptor sortDescriptorWithKey:@"username" ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortUsersByUsername, nil]];
    
    fetchController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:[TDSUser managedObjectContext] sectionNameKeyPath:nil cacheName:nil];
    
    NSError *error;
    [fetchController performFetch:&error];
    
    users = [TDSUser objectsWithFetchRequest:fetchRequest];

}

- (void)loadData {
    // Load the object model via RestKit	
    RKObjectManager* objectManager = [RKObjectManager sharedManager];
    
    [objectManager loadObjectsAtResourcePath:@"/users" delegate:self block:^(RKObjectLoader* loader) {
        loader.objectMapping = [objectManager.mappingProvider objectMappingForClass:[TDSUser class]];
    }]; 
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
    return [fetchController.sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[fetchController sections] objectAtIndex:section] numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    TDSUser* curUser = (TDSUser*)[fetchController objectAtIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [curUser username];
        
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TDSUserDetailViewController *detailViewController = [[TDSUserDetailViewController alloc] initWithStyle:UITableViewStyleGrouped];
    detailViewController.user = (TDSUser*)[fetchController objectAtIndexPath:indexPath];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}

#pragma mark RKObjectLoaderDelegate methods

- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjects:(NSArray*)objects {
	[self loadObjectsFromDataStore];
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

@end
