//
//  TDSUser.h
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 07.11.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "TDSManagedObject.h"


@interface TDSUser : TDSManagedObject

@property (nonatomic, retain) NSString * name;

@end
