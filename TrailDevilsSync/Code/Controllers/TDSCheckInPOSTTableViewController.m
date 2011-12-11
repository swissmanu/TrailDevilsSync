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
#import "TDSTrailTableViewController.h"


@interface TDSCheckInPOSTTableViewController()

- (BOOL)validateCheckinData;
- (void)showSavingView;

@end

@implementation TDSCheckInPOSTTableViewController

@synthesize user, trail, checkInToPost;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        UIBarButtonItem* saveBtn = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Save", @"Save") style:UIBarButtonItemStyleDone target:self action:@selector(saveCheckIn)];
        self.navigationItem.rightBarButtonItem = saveBtn;
        
        UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
		temporaryBarButtonItem.title = NSLocalizedString(@"Back", @"Back");
		self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
    }
    return self;
}

- (void)saveCheckIn {
    
    if ([self validateCheckinData]) {
        TDSTrailCheckIn *checkInToPOST = [self createTrailCheckIn];
        
        RKObjectManager* objectManager = [RKObjectManager sharedManager];
        
        [objectManager postObject:checkInToPOST delegate:self block:^(RKObjectLoader * loader) {
            loader.resourcePath = [NSString stringWithFormat:@"/trails/%i/checkins", [trail.trailId intValue]];
        }];
        
        [self showSavingView];
    }
    
}

-(void)showSavingView {
    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    
    // Add HUD to screen
    [self.navigationController.view addSubview:HUD];
    
    // Regisete for HUD callbacks so we can remove it from the window at the right time
    HUD.delegate = self;
    
    HUD.labelText = @"Saving";
    
    // Show the HUD while the provided method executes in a new thread
    [HUD showUsingAnimation:YES];
    
}




- (BOOL)validateCheckinData {
    if (!trail) {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error" 
                                                        message:@"Choose a trail!" 
                                                       delegate:nil 
                                              cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
        return NO;
    
    }
    
    if (!user) { 
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error" 
                                                        message:@"An internal error occured!" 
                                                       delegate:nil 
                                              cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
        return NO;
    } 
    
    return YES;
}


- (TDSTrailCheckIn*)createTrailCheckIn {
    TDSTrailCheckIn *trailCheckIn = [TDSTrailCheckIn object];
    
    trailCheckIn.trailId = trail.trailId;
    trailCheckIn.userId = user.userId;
    trailCheckIn.isManualCheckin = [NSNumber numberWithBool:YES];
    trailCheckIn.checkinDateInt = [NSNumber numberWithInt:(int)[[NSDate date] timeIntervalSince1970]];
    
    return trailCheckIn;
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
    
    if (indexPath.section == 1) {
        TDSTrailTableViewController *trailViewController = [[TDSTrailTableViewController alloc] initWithStyle:UITableViewStylePlain target:self onTrailSelect:@selector(didSelectRowWithTrail:) showAccessoryType:NO];
        
        [self.navigationController pushViewController:trailViewController animated:YES];
    }
}

- (void)didSelectRowWithTrail:(TDSTrail*)selectedTrail {
    [self setTrail:selectedTrail];
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark MBProgressHUDDelegate methods

- (void)hudWasHidden {
    // Remove HUD from screen when the HUD was hidded
    [HUD removeFromSuperview];
}

#pragma mark RKObjectLoaderDelegate methods

- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjects:(NSArray*)objects {
    [HUD hideUsingAnimation:YES];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didFailWithError:(NSError*)error {
    [HUD hideUsingAnimation:YES];
    
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
    
    [self.tableView reloadData];
}

- (void)setUser:(TDSUser *)aUser {
    user = aUser;
    
    [self.tableView reloadData];
}

@end
