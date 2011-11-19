//
//  TDSUser.h
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 18.11.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "TDSManagedObject.h"


@interface TDSUser : TDSManagedObject

@property (nonatomic, retain) NSNumber * countryId;
@property (nonatomic, retain) NSNumber * userId;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSSet *checkins;
@end

@interface TDSUser (CoreDataGeneratedAccessors)

- (void)addCheckinsObject:(NSManagedObject *)value;
- (void)removeCheckinsObject:(NSManagedObject *)value;
- (void)addCheckins:(NSSet *)values;
- (void)removeCheckins:(NSSet *)values;

@end
