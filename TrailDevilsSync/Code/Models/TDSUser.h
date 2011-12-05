//
//  TDSUser.h
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

@class TDSTrailCheckIn;

@interface TDSUser : NSManagedObject

@property (nonatomic, retain) NSNumber * countryId;
@property (nonatomic, retain) NSNumber * userId;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSDate * createdDate;
@property (nonatomic, retain) NSDate * lastModifiedDate;
@property (nonatomic, retain) NSSet *checkins;
@end

@interface TDSUser (CoreDataGeneratedAccessors)

- (void)addCheckinsObject:(TDSTrailCheckIn *)value;
- (void)removeCheckinsObject:(TDSTrailCheckIn *)value;
- (void)addCheckins:(NSSet *)values;
- (void)removeCheckins:(NSSet *)values;

@end
