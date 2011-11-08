//
//  TDSTrail.m
//  TrailDevilsSync
//
//  Created by Manuel Alabor on 31.10.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TDSTrail.h"


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

- (UIImage *)isOpenImageForTrailCellView {
    NSLog(@"icon: \"%@\"", [NSString stringWithFormat:@"%@_16", [[self isOpen] description]]);
	return [UIImage imageNamed:[NSString stringWithFormat:@"%@_16", [[self isOpen] description]]];
}


@end
