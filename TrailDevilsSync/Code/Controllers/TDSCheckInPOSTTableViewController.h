//
//  TDSCheckInPOSTTableViewController.h
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 21.11.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TDSTrailPopViewProtocol.h"

@class TDSUser;
@class TDSTrail;
@class TDSTrailCheckIn;

@interface TDSCheckInPOSTTableViewController : UITableViewController <TDSTrailPopViewProtocol> {
    TDSUser *user;
    TDSTrailCheckIn *checkInToPost;
}

@property (nonatomic, retain) TDSUser *user;
@property (nonatomic, retain) TDSTrailCheckIn *checkInToPost;

@end
