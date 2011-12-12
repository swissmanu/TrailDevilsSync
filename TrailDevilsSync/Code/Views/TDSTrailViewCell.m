//
//  TDSTrailCellView.m
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 08.11.11.
//  Copyright (c) 2011 Hochschule für Technik in Rapperswil (HSR). All rights reserved.
//

#import "TDSTrailViewCell.h"
#import "TDSTrail.h"
#import "TDSTrailIsOpenView.h"

@implementation TDSTrailViewCell

@synthesize trail, trailIsOpenView, labelView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        trail = nil;
        trailIsOpenView = nil;
        labelView = nil;
        
        trailIsOpenView = [[TDSTrailIsOpenView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:trailIsOpenView];
        
        
        labelView = [[UILabel alloc] initWithFrame:CGRectZero];
		// set the label view to have a clear background and a 20 point font
		labelView.backgroundColor = [UIColor clearColor];
		labelView.font = [UIFont boldSystemFontOfSize:20];
		self.labelView = labelView;
		[self.contentView addSubview:labelView];
    }
    return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
    
	// determine the content rect for the cell. This will change depending on the
	// style of table (grouped vs plain)
	CGRect contentRect = self.contentView.bounds;
	
	// position the image tile in the content rect.
	CGRect trailIsOpenRect = self.contentView.bounds;
	trailIsOpenRect.size = [TDSTrailIsOpenView preferredViewSize];
	trailIsOpenRect = CGRectOffset(trailIsOpenRect,12, (contentRect.size.height / 2) - (trailIsOpenRect.size.height / 2));
	trailIsOpenView.frame = trailIsOpenRect;
	
	// position the elment name in the content rect
	CGRect labelRect = contentRect;
	labelRect.origin.x = labelRect.origin.x+40;
	labelRect.origin.y = (contentRect.size.height / 2) - (labelRect.size.height / 2);
    labelRect.size.width = MIN(260, labelRect.size.width);
	labelView.frame = labelRect;	
}

- (void)setTrail:(TDSTrail *)aTrail {
	trail = aTrail;
	
    trailIsOpenView.trail = trail;
	labelView.text = trail.name;
	[trailIsOpenView setNeedsDisplay];
	[labelView setNeedsDisplay];
}


@end
