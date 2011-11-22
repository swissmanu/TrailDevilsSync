//
//  TDSCheckInPOSTTableViewController.m
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 21.11.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import "TDSCheckInPOSTTableViewController.h"

//TDS
#import "TDSUser.h"
#import "TDSTrail.h"
#import "TDSTrailCheckIn.h"


@implementation TDSCheckInPOSTTableViewController

@synthesize user, trail, checkInToPost;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        UIBarButtonItem* checkIn = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Save", @"Save") style:UIBarButtonItemStyleDone target:self action:@selector(pushCheckIn)];
        self.navigationItem.rightBarButtonItem = checkIn;
        
        UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
		temporaryBarButtonItem.title = NSLocalizedString(@"Back", @"Back");
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

    self.title = NSLocalizedString(@"POST check in", @"POST check in title");
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
    return 2;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = @"User";
            cell.detailTextLabel.text = [user username];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            break;
        case 1:
            cell.textLabel.text = @"Trail";
            
            if (trail) {
                cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", [trail name], [trail country]];
            } else {
                cell.detailTextLabel.text = @"none";
            }
        
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
            break;
        default:
            break;
    }
    
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

#pragma mark - Setter

- (void)setTrail:(TDSTrail *)aTrail {
    trail = aTrail;
    
    //TODO: reload datasource
}

- (void)setUser:(TDSUser *)aUser {
    user = aUser;
    
    //TODO: reload datasource
}

@end
