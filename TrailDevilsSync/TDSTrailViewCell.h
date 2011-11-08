//
//  TDSTrailCellView.h
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 08.11.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TDSTrail, TDSTrailIsOpenView;

@interface TDSTrailViewCell : UITableViewCell {

    TDSTrail *trail;
    TDSTrailIsOpenView *trailIsOpenView;
    UILabel *labelView;
}

@property (nonatomic, retain) TDSTrail *trail;
@property (nonatomic, retain) TDSTrailIsOpenView *trailIsOpenView;
@property (nonatomic, retain) UILabel *labelView;

@end
