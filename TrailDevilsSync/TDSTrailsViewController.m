//
//  TDSTrailsViewController.m
//  TrailDevilsSync
//
//  Created by Manuel Alabor on 31.10.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Three20/Three20+Additions.h>
#import "TDSTrailsViewController.h"
#import "TDSTrail.h"

@implementation TDSTrailsViewController


-(void)createModel {
    RKObjectTTTableViewDataSource* dataSource = [RKObjectTTTableViewDataSource dataSource];

    RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[TTTableTextItem class]];
    [mapping mapKeyPath:@"name" toAttribute:@"text"];
    [dataSource mapObjectClass:[TDSTrail class] toTableItemWithMapping:mapping];
    
    RKObjectLoader* objectLoader = [[RKObjectManager sharedManager] objectLoaderWithResourcePath:@"/trails" delegate:nil ];
    objectLoader.objectMapping = [[RKObjectManager sharedManager].mappingProvider objectMappingForClass:[TDSTrail class]];
    
    dataSource.model = [RKObjectLoaderTTModel modelWithObjectLoader:objectLoader];
    self.dataSource = dataSource;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
