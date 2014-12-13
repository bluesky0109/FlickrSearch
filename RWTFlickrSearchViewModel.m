//
//  RWTFlickrSearchViewModel.m
//  RWTFlickrSearch
//
//  Created by sky on 14/12/13.
//  Copyright (c) 2014年 Colin Eberhardt. All rights reserved.
//

#import "RWTFlickrSearchViewModel.h"

@implementation RWTFlickrSearchViewModel

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self initialize];
    }
    
    return self;
}

- (void)initialize {
    self.searchText = @"search text";
    self.title = @"Flickr Search";
}

@end
