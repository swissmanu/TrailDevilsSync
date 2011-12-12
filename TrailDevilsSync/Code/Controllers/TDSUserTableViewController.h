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

//TDS
#import "MBProgressHUD.h"
#import "TDSRestKitManagedTableViewController.h"

@interface TDSUserTableViewController : TDSRestKitManagedTableViewController {

}

- (void)loadObjectsFromDataStore;
- (void)loadData;

@end
