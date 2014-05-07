//
//  PhotographersCDTVC.m
//  MyPhotoBrowser
//
//  Created by Shanshan ZHAO on 21/04/14.
//  Copyright (c) 2014 Shanshan ZHAO. All rights reserved.
//

#import "PhotographersCDTVC.h"
#import "Photographer.h"
#import "PhotoDatabaseAvailability.h"


@interface PhotographersCDTVC ()

@end

@implementation PhotographersCDTVC

// notify both posting and receving 

- (void)awakeFromNib
{
    [[NSNotificationCenter defaultCenter] addObserverForName:PhotoDatabaseAvailabilityNotification
                                                      object:nil
                                                       queue:nil
                                                  usingBlock:^(NSNotification *note) {
                                                      self.managedObjectContext = note.userInfo[PhotoDatabaseAvailabilityContext];
                                                  }];
}


- (void)setManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    _managedObjectContext = managedObjectContext;
    
    NSFetchRequest * request = [NSFetchRequest fetchRequestWithEntityName:@"Photographer"];
    request.predicate = nil; // predicate nil means all the photographers
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name"
                                                              ascending:YES selector:@selector(localizedStandardCompare:)]]; // localizedStandardCompare is the way mac finder use to sort files
    request.fetchLimit = 100;
     
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:managedObjectContext
                                                                          sectionNameKeyPath:nil cacheName:nil];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:@"Photographer Cell"];
    // remember to sent in storyboard
    
    Photographer * photographer = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = photographer.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d photos",[photographer.photos count]]; // %d for number
    
    return  cell;
    
}

@end
