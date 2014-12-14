//
//  RWTSearchResultsViewModel.h
//  RWTFlickrSearch
//
//  Created by sky on 14/12/14.
//  Copyright (c) 2014年 Colin Eberhardt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RWTViewModelServices.h"
#import "RWTFlickrSearchResults.h"

@interface RWTSearchResultsViewModel : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSArray  *searchResults;


- (instancetype)initWithSearchResults:(RWTFlickrSearchResults *)results
                             services:(id<RWTViewModelServices>)services;


@end
