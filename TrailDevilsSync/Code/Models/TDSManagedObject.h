//
//  TDSManagedObject.h
//  TrailDevilsSync
//
//  Created by Manuel Alabor on 31.10.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

//RestKit
#import <RestKit/RestKit.h>
#import <RestKit/CoreData/CoreData.h>


@interface TDSManagedObject : NSManagedObject

@property (nonatomic, retain) NSDate * createdDate;
@property (nonatomic, retain) NSNumber * isNew;
@property (nonatomic, retain) NSDate * lastModifiedDate;

@end
