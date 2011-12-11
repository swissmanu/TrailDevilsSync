//
//  TDSTrailPopViewProtocol.h
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 22.11.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TDSTrail.h"

@protocol TDSTrailPopViewProtocol <NSObject>

@required
@property (nonatomic, retain) TDSTrail *trail; 

- (void)didSelectRowWithTrail:(TDSTrail*)selectedTrail;

@end
