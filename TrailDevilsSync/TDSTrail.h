//
//  TDSTrail.h
//  TrailDevilsSync
//
//  Created by Manuel Alabor on 27.10.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "TDSManagedObject.h"


@interface TDSTrail : TDSManagedObject

@property (nonatomic, retain) NSString * country;
@property (nonatomic, retain) NSNumber * countryId;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSNumber * favorits;
@property (nonatomic, retain) NSNumber * gmapX;
@property (nonatomic, retain) NSNumber * gmapY;
@property (nonatomic, retain) NSString * imageUrl120;
@property (nonatomic, retain) NSString * imageUrl800;
@property (nonatomic, retain) NSString * info;
@property (nonatomic, retain) NSNumber * isCommercial;
@property (nonatomic, retain) NSNumber * isOpen;
@property (nonatomic, retain) NSString * journey;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * nextCity;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSNumber * trailId;
@property (nonatomic, retain) NSString * url;

@end
