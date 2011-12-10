//
//  TDSRestKitConfigController.h
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 08.12.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RKObjectManager;

@interface TDSRestKitConfigManager : NSObject {
    RKObjectManager* objectManager;
}


+ (TDSRestKitConfigManager*)sharedConfigManager;

+ (void)setSharedConfigManager:(TDSRestKitConfigManager*)manager;

+ (TDSRestKitConfigManager*)configManager;

@end
