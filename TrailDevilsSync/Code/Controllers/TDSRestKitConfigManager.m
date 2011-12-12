//
//  TDSRestKitConfigController.m
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 08.12.11.
//  Copyright (c) 2011 Hochschule für Technik in Rapperswil (HSR). All rights reserved.
//

// RestKit:
#import <RestKit/RestKit.h>
#import <RestKit/CoreData/CoreData.h>
#import <RestKit/Support/JSON/JSONKit/RKJSONParserJSONKit.h>

// TDS:
#import "TDSRestKitConfigManager.h"

// Models:
// Add your needed models headers here
#import "TDSTrail.h"
#import "TDSTrailType.h"
#import "TDSTrailCheckIn.h"
#import "TDSUser.h"

@interface TDSRestKitConfigManager()

-(void) initObjectStore;
-(void) initClient;
-(void) initMappings;
-(void) initLoging;

@end

static TDSRestKitConfigManager *sharedConfigManager = nil;


static NSString *baseUrl = @"http://152.96.80.18:8080/api";
static NSString *storeFilename = @"TDSData.sqlite";

@implementation TDSRestKitConfigManager

- (id)init {
    self = [super init];
    
    if (self) {
        
        objectManager = [RKObjectManager objectManagerWithBaseURL:baseUrl];
        
        [self initObjectStore];
        [self initClient];
        [self initMappings];
        [self initLoging];
    }  
    
    return self;
}

+ (TDSRestKitConfigManager*)sharedConfigManager {
    return sharedConfigManager;
}

+ (void)setSharedConfigManager:(TDSRestKitConfigManager*)manager {
    sharedConfigManager = nil;
    sharedConfigManager = manager;
}

+ (TDSRestKitConfigManager*)configManager {
    TDSRestKitConfigManager* manager = [[self alloc] init];
    
    if (sharedConfigManager == nil)
        [TDSRestKitConfigManager setSharedConfigManager:manager];
    
    return manager;
}

-(void) initObjectStore {
    objectManager.objectStore = [RKManagedObjectStore objectStoreWithStoreFilename:storeFilename];
}

-(void) initClient {
    [objectManager.client setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    objectManager.client.requestQueue.showsNetworkActivityIndicatorWhenBusy = YES;

}

-(void) initMappings {
    /****** T R A I L T Y P E ******/
    
    RKManagedObjectMapping* trailTypeMapping = [RKManagedObjectMapping mappingForClass:[TDSTrailType class]];
    trailTypeMapping.primaryKeyAttribute = @"trailTypeId";
    trailTypeMapping.setDefaultValueForMissingAttributes = YES;
    [trailTypeMapping mapKeyPathsToAttributes:
     @"Id",@"trailTypeId"
     ,@"Name",@"name"
     ,@"Description",@"desc"
     ,nil];
    [objectManager.mappingProvider setMapping:trailTypeMapping forKeyPath:@"TrailType"];
    
    [objectManager.router routeClass:[TDSTrailType class] 
                      toResourcePath:@"trails/types" 
                           forMethod:RKRequestMethodGET];
    
    /****** T R A I L ******/
    
    RKManagedObjectMapping* trailMapping = [RKManagedObjectMapping mappingForClass:[TDSTrail class]];
    trailMapping.primaryKeyAttribute = @"trailId";
    trailMapping.setDefaultValueForMissingAttributes = YES;
    [trailMapping mapKeyPathsToAttributes:
     @"Country",@"country"
     ,@"CountryId",@"countryId"
     ,@"CreatedDate",@"createdDate"
     ,@"Desc",@"desc"
     ,@"Favorits",@"favorits"
     ,@"GmapX",@"gmapX"
     ,@"GmapY",@"gmapY"
     ,@"ImageUrl120",@"imageUrl120"
     ,@"ImageUrl800",@"imageUrl800"
     ,@"Info",@"info"
     ,@"IsCommercial",@"isCommercial"
     ,@"IsOpen",@"isOpen"
     ,@"Journey",@"journey"
     ,@"Name", @"name"
     ,@"NextCity",@"nextCity"
     ,@"State",@"state"
     ,@"Url",@"url"
     ,@"Id",@"trailId"
     ,nil];
    //[objectManager.mappingProvider registerMapping:trailMapping withRootKeyPath:@"trail"];
    [objectManager.mappingProvider setMapping:trailMapping forKeyPath:@"trail"];
    
    [trailMapping mapRelationship:@"TrailType" withMapping:trailTypeMapping];
    
    [objectManager.router routeClass:[TDSTrail class]
                      toResourcePath:@"/trails"
                           forMethod:RKRequestMethodGET];
    
    
    /****** U S E R ******/
    
    RKManagedObjectMapping* userMapping = [RKManagedObjectMapping mappingForClass:[TDSUser class]];
    userMapping.primaryKeyAttribute = @"userId";
    userMapping.setDefaultValueForMissingAttributes = YES;
    [userMapping mapKeyPathsToAttributes:
     @"Id", @"userId"
     ,@"CreatedUnixTs", @"createdDate"
     ,@"ModifiedUnixTs", @"lastModifiedDate"
     ,@"Username", @"username"
     ,@"CountryId", @"countryId" 
     , nil];
    [objectManager.mappingProvider setMapping:userMapping forKeyPath:@"user"];
    
    
    [objectManager.router routeClass:[TDSUser class]
                      toResourcePath:@"/users"
                           forMethod:RKRequestMethodGET];
    
    /****** C H E C K  I N ******/
    
    RKManagedObjectMapping* checkinMapping = [RKManagedObjectMapping mappingForClass:[TDSTrailCheckIn class]];
    checkinMapping.primaryKeyAttribute = @"checkinId";
    checkinMapping.setDefaultValueForMissingAttributes = YES;
    [checkinMapping mapKeyPathsToAttributes:
     @"Id", @"checkinId"
     , @"CreatedUnixTs", @"createdDate"
     , @"CheckinUnixTs", @"checkinDateInt"
     , @"IsManualCheckin", @"isManualCheckin"
     , @"PosLatitude", @"posLatitude"
     , @"PosLongitude", @"posLongitude"
     , @"PosPrecision", @"posPrecision"
     , @"TrailId", @"trailId"
     , @"UserId", @"userId"
     , nil];
    [objectManager.mappingProvider setMapping:checkinMapping forKeyPath:@"checkin"];
    [objectManager.mappingProvider setSerializationMapping:[checkinMapping inverseMapping] forClass:[TDSTrailCheckIn class]];
    
    
    [objectManager.router routeClass:[TDSTrailCheckIn class] toResourcePath:@"/contacts/:contactID"];
    [objectManager.router routeClass:[TDSTrailCheckIn class] toResourcePath:@"/contacts" forMethod:RKRequestMethodPOST];
}

-(void) initLoging {
#ifdef DEBUG
    RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelDebug);
    RKLogConfigureByName("RestKit/CoreData", RKLogLevelTrace);
    //RKLogConfigureByName("RestKit/Network/Queue", RKLogLevelTrace)
    RKLogSetAppLoggingLevel(RKLogLevelDebug);
#endif
}

@end
