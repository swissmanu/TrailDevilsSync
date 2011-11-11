//
//  TDSTrailTableViewController.h
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 31.10.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import <UIKit/UIKit.h>

//RestKit
#import <RestKit/RestKit.h>

@interface TDSUserTableViewController : UITableViewController <RKObjectLoaderDelegate> {
    NSArray *users;
    NSFetchedResultsController *fetchController;
}

@property (retain, atomic) NSArray *users;
@property (retain, atomic) NSFetchedResultsController *fetchController;


- (void)loadObjectsFromDataStore;
- (void)loadData;

@end
