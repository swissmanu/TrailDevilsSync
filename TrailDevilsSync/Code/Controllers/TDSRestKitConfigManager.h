//
//  TDSRestKitConfigController.h
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 08.12.11.
//  Copyright (c) 2011 Hochschule für Technik in Rapperswil (HSR). All rights reserved.
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
