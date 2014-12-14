//
//  RWTFlickrSearchResults.h
//  RWTFlickrSearch
//
//  Created by sky on 14/12/13.
//  Copyright (c) 2014年 Colin Eberhardt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWTFlickrSearchResults : NSObject

@property (strong, nonatomic) NSString   *searchString;
@property (strong, nonatomic) NSArray    *photos;
@property (assign, nonatomic) NSUInteger totalResults;

@end
