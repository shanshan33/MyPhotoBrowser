//
//  Photo+Flickr.h
//  MyPhotoBrowser
//
//  Created by Shanshan ZHAO on 21/04/14.
//  Copyright (c) 2014 Shanshan ZHAO. All rights reserved.
//

#import "Photo.h"

@interface Photo (Flickr)

// take flickr dictionary and add photo object to the data base
+ (Photo *)photoWithFlickrInfo: (NSDictionary *)photoDictionary
        inManagedObjectContext: (NSManagedObjectContext *)context ;


+ (void)loadPhotosFromFlickrArray:(NSArray *)photos //of Flickr Dictionary
         intoManagedObjectContext: (NSManagedObjectContext *)context;

@end
