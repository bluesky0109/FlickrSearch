//
//  RWTSearchResultsViewModel.m
//  RWTFlickrSearch
//
//  Created by sky on 14/12/14.
//  Copyright (c) 2014年 Colin Eberhardt. All rights reserved.
//

#import "RWTSearchResultsViewModel.h"

@implementation RWTSearchResultsViewModel

- (instancetype)initWithSearchResults:(RWTFlickrSearchResults *)results
                             services:(id<RWTViewModelServices>)services {
    
    if (self = [super init]) {
        _title = results.searchString;
        _searchResults = results.photos;
    }
    
    return self;
}

@end
