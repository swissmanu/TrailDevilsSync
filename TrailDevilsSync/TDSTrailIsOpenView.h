//
//  TDSTrailStateView.h
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 08.11.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TDSTrail;

@interface TDSTrailIsOpenView : UIView {
    TDSTrail *trail;
}

@property (nonatomic, retain) TDSTrail *trail;

+ (CGSize)preferredViewSize;

@end