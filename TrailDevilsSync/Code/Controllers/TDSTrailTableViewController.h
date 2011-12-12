//
//  TDSTrailTableViewController.h
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 31.10.11.
//  Copyright (c) 2011 Hochschule für Technik in Rapperswil (HSR). All rights reserved.
//

#import <UIKit/UIKit.h>

//TDS
#import "TDSTrailPopViewProtocol.h"
#import "TDSRestKitManagedTableViewController.h"
#import "MBProgressHUD.h"

//RestKit
#import <RestKit/RestKit.h>

@interface TDSTrailTableViewController : TDSRestKitManagedTableViewController {
    id target;
    SEL onTrailSelectSelector;
    BOOL showAccessoryType;
}

- (id)initWithStyle:(UITableViewStyle)style target:(id)target onTrailSelect:(SEL)selector showAccessoryType:(BOOL)showAccessory;

- (void)loadObjectsFromDataStore;

@end
