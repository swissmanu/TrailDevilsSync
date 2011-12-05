//
//  TDSTrailType.h
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 29.11.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

//RestKit
#import <RestKit/RestKit.h>
#import <RestKit/CoreData/CoreData.h>

@class TDSTrail;

@interface TDSTrailType : NSManagedObject

@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * trailTypeId;
@property (nonatomic, retain) NSDate * createdDate;
@property (nonatomic, retain) NSDate * lastModifiedDate;
@property (nonatomic, retain) NSSet *trails;
@end

@interface TDSTrailType (CoreDataGeneratedAccessors)

- (void)addTrailsObject:(TDSTrail *)value;
- (void)removeTrailsObject:(TDSTrail *)value;
- (void)addTrails:(NSSet *)values;
- (void)removeTrails:(NSSet *)values;

@end
