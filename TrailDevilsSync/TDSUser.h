//
//  TDSUser.h
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 08.11.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "TDSManagedObject.h"


@interface TDSUser : TDSManagedObject

@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSNumber * countryId;

@end
