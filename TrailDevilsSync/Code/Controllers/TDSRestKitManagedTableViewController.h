//
//  TDSRestKitManagedTableViewController.h
//  
//
//  Created by Alexandre Joly on 12.12.11.
//  Copyright (c) 2011 Bühler AG Uzwil. All rights reserved.
//

#import <UIKit/UIKit.h>

//RestKit
#import <RestKit/RestKit.h>

//TDS
#import "MBProgressHUD.h"

@interface TDSRestKitManagedTableViewController : UITableViewController <RKObjectLoaderDelegate, NSFetchedResultsControllerDelegate, MBProgressHUDDelegate> {
    NSFetchedResultsController* fetchController;
    MBProgressHUD* HUD;

}
- (void)loadData;
- (void)showProgressHUDWithLabel:(NSString*)label;
- (void)loadObjectsFromDataStoreWithFetchRequest:(NSFetchRequest *)fetchRequest managedObjectContext:(NSManagedObjectContext *)context sectionNameKeyPath:(NSString *)sectionNameKeyPath cacheName:(NSString *)name;
@end
