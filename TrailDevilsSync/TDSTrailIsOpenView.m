//
//  TDSTrailStateView.m
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 08.11.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import "TDSTrailIsOpenView.h"
#import "TDSTrail.h"

@implementation TDSTrailIsOpenView

@synthesize trail;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        trail = nil;
        [self setBackgroundColor:[UIColor clearColor]];

    }
    return self;
}

+ (CGSize)preferredViewSize {
	return CGSizeMake(16,16);
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{    
	UIImage *backgroundImage = trail.isOpenImageForTrailCellView;
	CGRect elementSymbolRectangle = CGRectMake(0,0, [backgroundImage size].width, [backgroundImage size].height);
	[backgroundImage drawInRect:elementSymbolRectangle blendMode:0 alpha:1];
}


@end
