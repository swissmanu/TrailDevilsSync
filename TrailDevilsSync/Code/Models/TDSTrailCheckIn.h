//
//  TDSTrailCheckIn.h
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 18.11.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

//RestKit
#import <RestKit/RestKit.h>
#import <RestKit/CoreData/CoreData.h>

@class TDSTrail, TDSUser;

@interface TDSTrailCheckIn : NSManagedObject

@property (nonatomic, retain) NSNumber * checkinId;
@property (nonatomic, retain) NSNumber * checkinDateInt;
@property (nonatomic, retain) NSNumber * isManualCheckin;
@property (nonatomic, retain) NSNumber * posLatitude;
@property (nonatomic, retain) NSNumber * posLongitude;
@property (nonatomic, retain) NSNumber * posPrecision;
@property (nonatomic, retain) NSNumber * trailId;
@property (nonatomic, retain) NSNumber * userId;
@property (nonatomic, retain) NSDate * createdDate;
@property (nonatomic, retain) NSDate * lastModifiedDate;
@property (nonatomic, retain) TDSUser *user;
@property (nonatomic, retain) TDSTrail *trail;

@property (nonatomic, readonly) NSString * day;
@property (nonatomic, retain) NSDateFormatter * dateFormatter;
@property (nonatomic, readonly) NSDate * checkinDate;

@end
