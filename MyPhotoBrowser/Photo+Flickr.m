//
//  Photo+Flickr.m
//  MyPhotoBrowser
//
//  Created by Shanshan ZHAO on 21/04/14.
//  Copyright (c) 2014 Shanshan ZHAO. All rights reserved.
//

#import "Photo+Flickr.h"
#import "FlickrFetcher.h"
#import "Photographer+Create.h"

@implementation Photo (Flickr)


+ (Photo *)photoWithFlickrInfo: (NSDictionary *)photoDictionary
        inManagedObjectContext: (NSManagedObjectContext *)context
{
    Photo * photo = nil;
    
    NSString * unique = photoDictionary[FLICKR_PHOTO_ID]; //valueForKeyPath ..
    
    NSFetchRequest * request = [NSFetchRequest fetchRequestWithEntityName:@"Photo"];
    request.predicate = [NSPredicate predicateWithFormat:@"unique = %@",unique];
    
    
    NSError *error;
    NSArray * matches = [context executeFetchRequest:request error:&error];
    
    
    if (!matches || error || ([matches count] > 1)){
        // TODO: handle error
    } else if ([matches count]) {
        photo = [matches firstObject];
    } else {
        photo = [NSEntityDescription insertNewObjectForEntityForName:@"Photo"
                                              inManagedObjectContext:context];
        photo.unique = unique;
        photo.title = [photoDictionary valueForKeyPath:FLICKR_PHOTO_TITLE];
        photo.subtitle = [photoDictionary valueForKeyPath:FLICKR_PHOTO_DESCRIPTION];
        photo.imageURL =[[FlickrFetcher URLforPhoto:photoDictionary
                                             format:FlickrPhotoFormatLarge] absoluteString];
        
        NSString * photographerName = [photoDictionary valueForKeyPath:FLICKR_PHOTO_OWNER];
        photo.whoTook = [Photographer photographerWithName:photographerName
                                    inManagedObjectContext:context];
    }
    return  photo;
    
    
}


+ (void)loadPhotosFromFlickrArray:(NSArray *)photos
         intoManagedObjectContext: (NSManagedObjectContext *)context
{
    for (NSDictionary * photo in photos ) {
        [self photoWithFlickrInfo: photo inManagedObjectContext:context];
    }
    
}

@end

