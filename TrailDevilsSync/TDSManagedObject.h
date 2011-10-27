//
//  TDSManagedObject.h
//  TrailDevilsSync
//
//  Created by Manuel Alabor on 27.10.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface TDSManagedObject : NSManagedObject

@property (nonatomic, retain) NSDate * lastModifiedDate;
@property (nonatomic, retain) NSDate * createdDate;

@end
