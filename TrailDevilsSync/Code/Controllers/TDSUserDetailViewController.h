//
//  TDSUserDetailViewController.h
//  TrailDevilsSync
//
//  Created by Alexandre Joly on 11.11.11.
//  Copyright (c) 2011 Hochschule für Technik in Rapperswil (HSR). All rights reserved.
//

#import <UIKit/UIKit.h>

@class TDSUser;

@interface TDSUserDetailViewController : UITableViewController {
    TDSUser* user;
    NSArray* groupedData;
}

@property (retain, nonatomic) TDSUser* user;
@property (retain, nonatomic) NSArray* groupedData;

- (void)loadData;
- (void)pushCheckIn;


@end
