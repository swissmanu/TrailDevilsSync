//
//  TDSTrailDetailViewController.m
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 08.11.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import "TDSTrailDetailViewController.h"
#import "TDSTrail.h"
#import "TDSCheckInTableViewController.h"

@implementation TDSTrailDetailViewController

@synthesize trail, groupedData;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        
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
    
    if (trail)
        self.title = [trail name];
    else
        self.title = NSLocalizedString(@"Trail Detail", @"Trail Detail");
    
    [self loadData];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)loadData {
    
    groupedData = nil;
    
    if (!trail) {
        NSDictionary *noData = [[NSDictionary alloc] initWithObjectsAndKeys:@"No Data available", @"", nil];
        groupedData = [[NSArray alloc] initWithObjects:noData, nil];
    } else {
        
        NSArray *firstSec = [[NSArray alloc] initWithObjects:
                             @"name", 
                             @"state",
                             @"isOpen",
                             @"desc",
                             @"nextCity",
                             @"info",
                             @"isCommercial",
                             nil];
        
        NSArray *secSec = [[NSArray alloc] initWithObjects:
                           @"checkins", 
                           nil];
        
        
        groupedData = [[NSArray alloc] initWithObjects:firstSec, secSec, nil];
    }
    
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
    return [groupedData count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[groupedData objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    NSArray *curSection = [groupedData objectAtIndex:[indexPath section]];
    
    if ([[curSection objectAtIndex:[indexPath row]] isEqual:@"checkins"]) {
        cell.textLabel.text = @" ";
        cell.detailTextLabel.text = NSLocalizedString([curSection objectAtIndex:[indexPath row]], @"Trail property");
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        cell.textLabel.text = NSLocalizedString([curSection objectAtIndex:[indexPath row]], @"Trail property");
        cell.detailTextLabel.text = [[trail primitiveValueForKey:[curSection objectAtIndex:[indexPath row]]] description]; 
    
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    NSArray *curSection = [groupedData objectAtIndex:[indexPath section]];
    
    if ([[curSection objectAtIndex:[indexPath row]] isEqual:@"checkins"]) {
    
        TDSCheckInTableViewController *checkInViewController = [[TDSCheckInTableViewController alloc] initWithStyle:UITableViewStylePlain];
        checkInViewController.trail = trail;
        // ...
        // Pass the selected object to the new view controller.
        [self.navigationController pushViewController:checkInViewController animated:YES];
    }
     
}

@end
