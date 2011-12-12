//
//  TDSTrailTableViewController.m
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 31.10.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//


//TDS
#import "TDSTrailTableViewController.h"
#import "TDSTrail.h"
#import "TDSTrailDetailViewController.h"
#import "TDSTrailViewCell.h"

@implementation TDSTrailTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    return [self initWithStyle:style target:nil onTrailSelect:nil showAccessoryType:YES];
}

- (id)initWithStyle:(UITableViewStyle)style target:(id)targetObject onTrailSelect:(SEL)selector showAccessoryType:(BOOL)showAccessory {

    self = [super initWithStyle:style];
    if (self) {
        target = targetObject;
        onTrailSelectSelector = selector;
        showAccessoryType = showAccessory; 
        
        self.title = NSLocalizedString(@"Trails", @"Trails View Controller title");
        self.tabBarItem.image = [UIImage imageNamed:@"map"];
        
        UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
		temporaryBarButtonItem.title = NSLocalizedString(@"Back", @"Back");
		self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
        
    }
    return self;
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
    
    NSFetchRequest* fetchRequest = [TDSTrail fetchRequest];
    NSSortDescriptor *sortTrailsByCountry = [NSSortDescriptor sortDescriptorWithKey:@"country" ascending:YES];
    NSSortDescriptor *sortTrailsByName = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortTrailsByCountry, sortTrailsByName, nil]];
    
    [self loadObjectsFromDataStoreWithFetchRequest:fetchRequest managedObjectContext:[TDSTrail managedObjectContext] sectionNameKeyPath:@"country" cacheName:nil];
    
}

- (void)loadData {
    [self showProgressHUDWithLabel:@"Loading"];
    
    // Load the object model via RestKit	
    RKObjectManager* objectManager = [RKObjectManager sharedManager];
    
    [objectManager loadObjectsAtResourcePath:@"/trails" delegate:self block:^(RKObjectLoader* loader) {
        loader.objectMapping = [objectManager.mappingProvider objectMappingForClass:[TDSTrail class]];
    }]; 
}


- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    TDSTrail* curTrail = (TDSTrail*)[fetchController objectAtIndexPath:indexPath];
    
    TDSTrailViewCell *trailCell = (TDSTrailViewCell*)cell;
    
    trailCell.trail = curTrail;
    
    if (showAccessoryType) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TDSTrailViewCell";
    
    TDSTrailViewCell *cell = (TDSTrailViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[TDSTrailViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    TDSTrail *curTrail = [fetchController objectAtIndexPath:indexPath];    
    
    if (target != nil || onTrailSelectSelector != nil) {   
        [target performSelector:onTrailSelectSelector withObject:curTrail];
    } else {
        TDSTrailDetailViewController *detailViewController = [[TDSTrailDetailViewController alloc] initWithStyle:UITableViewStyleGrouped];
        detailViewController.trail = curTrail;
        
        
        [self.navigationController pushViewController:detailViewController animated:YES];
    }
}



@end


