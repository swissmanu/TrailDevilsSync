//
//  TDSTrailDetailViewController.h
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 08.11.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TDSTrail;

@interface TDSTrailDetailViewController : UITableViewController {
    TDSTrail* trail;
    NSArray* groupedData;
}

@property (retain, nonatomic) TDSTrail* trail;
@property (retain, nonatomic) NSArray* groupedData;

//- (void)loadObjectsFromDataStore;
- (void)loadData;

@end
