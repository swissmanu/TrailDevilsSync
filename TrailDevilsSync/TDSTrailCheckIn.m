//
//  TDSTrailCheckIn.m
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 18.11.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import "TDSTrailCheckIn.h"
#import "TDSTrail.h"
#import "TDSUser.h"


@implementation TDSTrailCheckIn

@dynamic checkinId;
@dynamic checkinDate;
@dynamic isManualCheckin;
@dynamic posLatitude;
@dynamic posLongitude;
@dynamic posPrecision;
@dynamic trailId;
@dynamic userId;
@dynamic user;
@dynamic trail;

@synthesize dateFormatter;

- (void)awakeFromFetch {
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateStyle:NSDateFormatterMediumStyle];
}

- (void)awakeFromInsert {
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateStyle:NSDateFormatterMediumStyle];
}

- (NSString *)day {
    NSDate *date = self.checkinDate;
    return [self.dateFormatter stringFromDate:date];
}

@end