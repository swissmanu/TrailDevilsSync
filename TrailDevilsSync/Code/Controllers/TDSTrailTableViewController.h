//
//  TDSTrailTableViewController.h
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 31.10.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import <UIKit/UIKit.h>

//TDS
#import "TDSTrailPopViewProtocol.h"

//RestKit
#import <RestKit/RestKit.h>

@interface TDSTrailTableViewController : UITableViewController <RKObjectLoaderDelegate, NSFetchedResultsControllerDelegate> {
    NSFetchedResultsController *fetchController;
    id target;
    SEL onTrailSelectSelector;
    BOOL showAccessoryType;
}

- (id)initWithStyle:(UITableViewStyle)style target:(id)target onTrailSelect:(SEL)selector showAccessoryType:(BOOL)showAccessory;

- (void)loadObjectsFromDataStore;
- (void)loadData;

@end
