//
//  TDSCheckInTableViewController.h
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 11.11.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TDSUser;
@class TDSTrail;

@interface TDSCheckInTableViewController : UITableViewController {
    TDSUser *user;
    TDSTrail *trail;
}

@property (nonatomic, retain) TDSUser *user;
@property (nonatomic, retain) TDSTrail *trail;

- (void)loadUserData;
- (void)loadTrailData;

@end
