//
//  Photographer+Create.m
//  MyPhotoBrowser
//
//  Created by Shanshan ZHAO on 21/04/14.
//  Copyright (c) 2014 Shanshan ZHAO. All rights reserved.
//

#import "Photographer+Create.h"

@implementation Photographer (Create)


+ (Photographer *)photographerWithName:(NSString *)name
                inManagedObjectContext:(NSManagedObjectContext *)context
{
    Photographer * photographer = nil;
    
    if ([name length]) {
        NSFetchRequest * request = [NSFetchRequest fetchRequestWithEntityName:@"Photographer"];
        request.predicate = [NSPredicate predicateWithFormat:@"name = %@",name];
        
        NSError * error ;
        NSArray * matches = [context executeFetchRequest:request
                                                   error:&error];
        if (!matches || [matches count] > 1) {
            // hander error
        } else if (![matches count]) {
            photographer = [NSEntityDescription insertNewObjectForEntityForName:@"Photographer" inManagedObjectContext:context];
            photographer.name = name;
            
        } else {
            photographer = [matches lastObject];
        }
        
    }
    
    return photographer;
    
}

@end
