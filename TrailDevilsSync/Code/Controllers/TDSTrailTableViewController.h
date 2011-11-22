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

@interface TDSTrailTableViewController : UITableViewController <RKObjectLoaderDelegate> {
    NSArray *trails;
    NSFetchedResultsController *fetchController;
    id<TDSTrailPopViewProtocol> popView;
}

@property (retain, atomic) NSArray *trails;
@property (retain, atomic) NSFetchedResultsController *fetchController;
@property (retain, nonatomic) id<TDSTrailPopViewProtocol> popView;

- (id)initWithStyle:(UITableViewStyle)style popToView:(id<TDSTrailPopViewProtocol>)viewOrNil;

- (void)loadObjectsFromDataStore;
- (void)loadData;

@end
