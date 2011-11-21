//
//  TDSCheckInPOSTTableViewController.h
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 21.11.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TDSUser;
@class TDSTrail;
@class TDSTrailCheckIn;

@interface TDSCheckInPOSTTableViewController : UITableViewController {
    TDSUser *user;
    TDSTrail *trail;
    TDSTrailCheckIn *checkInToPost;
}

@property (nonatomic, retain) TDSUser *user;
@property (nonatomic, retain) TDSTrail *trail;
@property (nonatomic, retain) TDSTrailCheckIn *checkInToPost;

@end
