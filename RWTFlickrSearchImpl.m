//
//  RWTFlickrSearchImpl.m
//  RWTFlickrSearch
//
//  Created by sky on 14/12/13.
//  Copyright (c) 2014年 Colin Eberhardt. All rights reserved.
//

#import "RWTFlickrSearchImpl.h"

@implementation RWTFlickrSearchImpl

- (RACSignal *)flickrSearchSignal:(NSString *)searchString {
    return [[[[RACSignal empty]
             logAll]
             delay:2.0]
             logAll];
}

@end
