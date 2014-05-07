//
//  Photo.h
//  MyPhotoBrowser
//
//  Created by Shanshan ZHAO on 21/04/14.
//  Copyright (c) 2014 Shanshan ZHAO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Photographer;

@interface Photo : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * subtitle;
@property (nonatomic, retain) NSString * imageURL;
@property (nonatomic, retain) NSString * unique;
@property (nonatomic, retain) Photographer *whoTook;

@end
