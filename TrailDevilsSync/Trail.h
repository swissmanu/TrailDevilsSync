//
//  Trail.h
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 06.10.11.
//  Copyright (c) 2011 HSR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Trail : NSManagedObject

@property (nonatomic, retain) NSString * country;
@property (nonatomic, retain) NSNumber * countryId;
@property (nonatomic, retain) NSDate * createdDate;
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

@end
