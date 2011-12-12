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

@synthesize user, trail;

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
    
    [self loadObjectsFromDataStoreWithFetchRequest:fetchRequest managedObjectContext:[TDSTrailCheckIn managedObjectContext] sectionNameKeyPath:@"day" cacheName:nil];

}



#pragma mark - Table view data source

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
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
