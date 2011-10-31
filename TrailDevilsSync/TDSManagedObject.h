//
//  TDSManagedObject.h
//  TrailDevilsSync
//
//  Created by Manuel Alabor on 27.10.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <RestKit/RestKit.h>
#import <RestKit/CoreData/CoreData.h>


@interface TDSManagedObject : NSManagedObject

@property (nonatomic, retain) NSDate * lastModifiedDate;
@property (nonatomic, retain) NSDate * createdDate;

/**
 * Indicates that this TDSManagedObject is not known on the remote system.
 * Means no primary key is available already.
 */
@property (nonatomic, retain) NSNumber * isNew;

@end
