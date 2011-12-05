//
//  TDSTrail.m
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 29.11.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import "TDSTrail.h"
#import "TDSTrailCheckIn.h"
#import "TDSTrailType.h"


@implementation TDSTrail

@dynamic country;
@dynamic countryId;
@dynamic desc;
@dynamic favorits;
@dynamic gmapX;
@dynamic gmapY;
@dynamic imageUrl120;
@dynamic imageUrl800;
@dynamic info;
@dynamic isCommercial;
@dynamic isOpen;
@dynamic journey;
@dynamic name;
@dynamic nextCity;
@dynamic state;
@dynamic trailId;
@dynamic url;
@dynamic createdDate;
@dynamic lastModifiedDate;
@dynamic checkins;
@dynamic trailTypes;

- (UIImage *)isOpenImageForTrailCellView {
	return [UIImage imageNamed:[NSString stringWithFormat:@"%d_16", [self.isOpen boolValue]]];
}

@end
