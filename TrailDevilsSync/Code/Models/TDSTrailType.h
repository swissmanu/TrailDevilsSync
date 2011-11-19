//
//  TDSTrailType.h
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 18.11.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "TDSManagedObject.h"

@class TDSTrail;

@interface TDSTrailType : TDSManagedObject

@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * trailTypeId;
@property (nonatomic, retain) NSSet *trails;
@end

@interface TDSTrailType (CoreDataGeneratedAccessors)

- (void)addTrailsObject:(TDSTrail *)value;
- (void)removeTrailsObject:(TDSTrail *)value;
- (void)addTrails:(NSSet *)values;
- (void)removeTrails:(NSSet *)values;

@end
