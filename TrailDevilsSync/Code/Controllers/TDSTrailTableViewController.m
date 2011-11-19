//
//  TDSTrailTableViewController.m
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 31.10.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import "TDSTrailTableViewController.h"
#import "TDSTrail.h"
#import "TDSTrailDetailViewController.h"
#import "TDSTrailViewCell.h"

@implementation TDSTrailTableViewController

@synthesize trails, fetchController;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        trails = [NSArray alloc];
        
        self.title = NSLocalizedString(@"Trails", @"Trails View Controller title");
        self.tabBarItem.image = [UIImage imageNamed:@"map"];
        
        UIBarButtonItem *temporaryBarButtonItem=[[UIBarButtonItem alloc] init];
		temporaryBarButtonItem.title=@"Back";
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
    trails = nil;
    
    NSFetchRequest* fetchRequest = [TDSTrail fetchRequest];
    NSSortDescriptor *sortTrailsByCountry = [NSSortDescriptor sortDescriptorWithKey:@"country" ascending:YES];
    NSSortDescriptor *sortTrailsByName = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortTrailsByCountry, sortTrailsByName, nil]];
    
    fetchController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:[TDSTrail managedObjectContext] sectionNameKeyPath:@"country" cacheName:nil];
    
    NSError *error;
    [fetchController performFetch:&error];
    
    trails = [TDSTrail objectsWithFetchRequest:fetchRequest];
}

- (void)loadData {
    // Load the object model via RestKit	
    RKObjectManager* objectManager = [RKObjectManager sharedManager];
    
    [objectManager loadObjectsAtResourcePath:@"/trails" delegate:self block:^(RKObjectLoader* loader) {
        loader.objectMapping = [objectManager.mappingProvider objectMappingForClass:[TDSTrail class]];
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

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[[fetchController sections] objectAtIndex:section] name];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TDSTrailViewCell";
    
    TDSTrailViewCell *cell = (TDSTrailViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[TDSTrailViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    TDSTrail* curTrail = (TDSTrail*)[fetchController objectAtIndexPath:indexPath];
    
    cell.trail = curTrail;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
     TDSTrailDetailViewController *detailViewController = [[TDSTrailDetailViewController alloc] initWithStyle:UITableViewStyleGrouped];
    detailViewController.trail = [fetchController objectAtIndexPath:indexPath];
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
