//
//  PhotomaniaAppDelegate+MOC.h
//  Photomania
//
//  Created by Shanshan ZHAO on 14-2-12.
//  Copyright (c) 2014年 Shanshan ZHAO. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (MOC)

- (void)saveContext:(NSManagedObjectContext *)managedObjectContext;

- (NSManagedObjectContext *)createMainQueueManagedObjectContext;

@end
