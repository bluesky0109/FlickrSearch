//
//  RWTFlickrSearchViewModel.m
//  RWTFlickrSearch
//
//  Created by sky on 14/12/13.
//  Copyright (c) 2014年 Colin Eberhardt. All rights reserved.
//

#import "RWTFlickrSearchViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation RWTFlickrSearchViewModel

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self initialize];
    }
    
    return self;
}

- (void)initialize {
    self.title = @"Flickr Search";
    
    RACSignal *validSearchSignal =
      [[RACObserve(self, searchText)
         map:^id(NSString *text) {
             return @(text.length > 3);
         }]
         distinctUntilChanged];
    
    [validSearchSignal subscribeNext:^(id x) {
        NSLog(@"search text is valid %@",x);
    }];
    
    self.executeSearch =
      [[RACCommand alloc] initWithEnabled:validSearchSignal
        signalBlock:^RACSignal *(id input) {
          return [self executeSearchSignal];
      }];
}

- (RACSignal *)executeSearchSignal {
    return [[[[RACSignal empty]
             logAll]
             delay:2.0]
             logAll];
}

@end
