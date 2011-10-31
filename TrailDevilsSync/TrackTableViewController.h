//
//  TrackTableViewController.h
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 30.10.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>

@interface TrackTableViewController : UITableViewController <RKObjectLoaderDelegate> {
    NSArray *trails;
}

@property (nonatomic, retain) NSArray* trails;

- (void)loadObjectsFromDataStore;

@end
