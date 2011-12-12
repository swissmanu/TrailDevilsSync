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

@interface TDSUserTableViewController()

@end

@implementation TDSUserTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {     
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
    
    if ([fetchController.fetchedObjects count] <= 0)
        [self loadData];
}


- (void)loadObjectsFromDataStore {
   
    NSFetchRequest* fetchRequest = [TDSUser fetchRequest];
    NSSortDescriptor *sortUsersByUsername = [NSSortDescriptor sortDescriptorWithKey:@"username" ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortUsersByUsername, nil]];
    
    [self loadObjectsFromDataStoreWithFetchRequest:fetchRequest managedObjectContext:[TDSUser managedObjectContext] sectionNameKeyPath:@"firstUsernameChar" cacheName:nil];
    
}

- (void)loadData {
    [self showProgressHUDWithLabel:@"Loading"];

    // Load the object model via RestKit	
    RKObjectManager* objectManager = [RKObjectManager sharedManager];
    
    [objectManager loadObjectsAtResourcePath:@"/users" delegate:self block:^(RKObjectLoader* loader) {
        loader.objectMapping = [objectManager.mappingProvider objectMappingForClass:[TDSUser class]];
    }]; 
}


- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    TDSUser* curUser = (TDSUser*)[fetchController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = [curUser username];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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




@end
