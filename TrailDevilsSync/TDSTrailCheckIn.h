//
//  TDSTrailCheckIn.h
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 18.11.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "TDSManagedObject.h"

@class TDSTrail, TDSUser;

@interface TDSTrailCheckIn : TDSManagedObject

@property (nonatomic, retain) NSNumber * checkinId;
@property (nonatomic, retain) NSDate * checkinDate;
@property (nonatomic, retain) NSNumber * isManualCheckin;
@property (nonatomic, retain) NSNumber * posLatitude;
@property (nonatomic, retain) NSNumber * posLongitude;
@property (nonatomic, retain) NSNumber * posPrecision;
@property (nonatomic, retain) NSNumber * trailId;
@property (nonatomic, retain) NSNumber * userId;
@property (nonatomic, retain) TDSUser *user;
@property (nonatomic, retain) TDSTrail *trail;

@property (nonatomic, readonly) NSString * day;
@property (nonatomic, retain) NSDateFormatter * dateFormatter;

@end
