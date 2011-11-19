//
//  TDSTrail.m
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 18.11.11.
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
@dynamic trailTypes;
@dynamic checkins;

- (UIImage *)isOpenImageForTrailCellView {
    NSLog(@"icon: \"%@\"", [NSString stringWithFormat:@"%@_16", [[self isOpen] description]]);
	return [UIImage imageNamed:[NSString stringWithFormat:@"%@_16", [[self isOpen] description]]];
}

@end
