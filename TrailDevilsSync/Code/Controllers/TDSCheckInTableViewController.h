//
//  TDSCheckInTableViewController.h
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 11.11.11.
//  Copyright (c) 2011 Hochschule für Technik in Rapperswil (HSR). All rights reserved.
//

#import <UIKit/UIKit.h>

//TDS
#import "TDSRestKitManagedTableViewController.h"

@class TDSUser;
@class TDSTrail;

@interface TDSCheckInTableViewController : TDSRestKitManagedTableViewController {
    TDSUser *user;
    TDSTrail *trail;
    
}

@property (nonatomic, retain) TDSUser *user;
@property (nonatomic, retain) TDSTrail *trail;

- (void)loadDataWithUser;
- (void)loadDataWithTrail;
- (void)loadObjectsFromDataStoreWithUser;
- (void)loadObjectsFromDataStoreWithTrail;

@end
