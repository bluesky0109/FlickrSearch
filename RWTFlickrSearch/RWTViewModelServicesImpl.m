//
//  RWTViewModelServicesImpl.m
//  RWTFlickrSearch
//
//  Created by sky on 14/12/13.
//  Copyright (c) 2014年 Colin Eberhardt. All rights reserved.
//

#import "RWTViewModelServicesImpl.h"
#import "RWTFlickrSearchImpl.h"

@interface RWTViewModelServicesImpl()

@property(strong, nonatomic) RWTFlickrSearchImpl *searchService;

@end


@implementation RWTViewModelServicesImpl

- (instancetype)init {
    if (self = [super init]) {
        _searchService = [RWTFlickrSearchImpl new];
    }
    return self;
}

- (id<RWTFlickrSearch>) getFlickrSearchService {
    return self.searchService;
}

@end
