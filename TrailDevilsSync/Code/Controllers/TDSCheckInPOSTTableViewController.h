//
//  TDSCheckInPOSTTableViewController.h
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 21.11.11.
//  Copyright (c) 2011 Hochschule für Technik in Rapperswil (HSR). All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TDSTrailPopViewProtocol.h"

//
#import "MBProgressHUD.h"


@class TDSUser;
@class TDSTrail;
@class TDSTrailCheckIn;

@interface TDSCheckInPOSTTableViewController : UITableViewController <TDSTrailPopViewProtocol, RKObjectLoaderDelegate, MBProgressHUDDelegate> {
    TDSUser *user;
    TDSTrailCheckIn *checkInToPost;
    MBProgressHUD *HUD;

}

@property (nonatomic, retain) TDSUser *user;
@property (nonatomic, retain) TDSTrailCheckIn *checkInToPost;

- (void)didSelectRowWithTrail:(TDSTrail*)selectedTrail;
- (TDSTrailCheckIn*)createTrailCheckIn;

@end
