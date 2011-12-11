//
//  TDSCheckInTableViewController.h
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 11.11.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import <UIKit/UIKit.h>

//RestKit
#import <RestKit/RestKit.h>

@class TDSUser;
@class TDSTrail;

@interface TDSCheckInTableViewController : UITableViewController <RKObjectLoaderDelegate, NSFetchedResultsControllerDelegate> {
    TDSUser *user;
    TDSTrail *trail;
    
    NSFetchedResultsController *fetchController;
}

@property (nonatomic, retain) TDSUser *user;
@property (nonatomic, retain) TDSTrail *trail;
@property (nonatomic, retain) NSFetchedResultsController *fetchController;

- (void)loadDataWithUser;
- (void)loadDataWithTrail;
- (void)loadObjectsFromDataStoreWithUser;
- (void)loadObjectsFromDataStoreWithTrail;

@end
