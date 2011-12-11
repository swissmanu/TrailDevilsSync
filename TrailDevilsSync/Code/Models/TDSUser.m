//
//  TDSUser.m
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 29.11.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import "TDSUser.h"
#import "TDSTrailCheckIn.h"


@implementation TDSUser

@dynamic countryId;
@dynamic userId;
@dynamic username;
@dynamic createdDate;
@dynamic lastModifiedDate;
@dynamic checkins;

- (NSString *)firstUsernameChar { 
    return [self.username substringToIndex:1];
}

@end
