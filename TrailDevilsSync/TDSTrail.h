//
//  TDSTrail.h
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 18.11.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "TDSManagedObject.h"

@class TDSTrailCheckIn, TDSTrailType;

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
@property (nonatomic, retain) NSSet *trailTypes;
@property (nonatomic, retain) NSSet *checkins;

- (UIImage *)isOpenImageForTrailCellView;

@end

@interface TDSTrail (CoreDataGeneratedAccessors)

- (void)addTrailTypesObject:(TDSTrailType *)value;
- (void)removeTrailTypesObject:(TDSTrailType *)value;
- (void)addTrailTypes:(NSSet *)values;
- (void)removeTrailTypes:(NSSet *)values;

- (void)addCheckinsObject:(TDSTrailCheckIn *)value;
- (void)removeCheckinsObject:(TDSTrailCheckIn *)value;
- (void)addCheckins:(NSSet *)values;
- (void)removeCheckins:(NSSet *)values;

@end
