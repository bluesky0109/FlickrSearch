//
//  RWTViewModelServicesImpl.m
//  RWTFlickrSearch
//
//  Created by sky on 14/12/13.
//  Copyright (c) 2014年 Colin Eberhardt. All rights reserved.
//

#import "RWTViewModelServicesImpl.h"
#import "RWTFlickrSearchImpl.h"
#import "RWTSearchResultsViewController.h"

@interface RWTViewModelServicesImpl()

@property (strong, nonatomic) RWTFlickrSearchImpl    *searchService;
@property (weak, nonatomic  ) UINavigationController *navigationController;

@end


@implementation RWTViewModelServicesImpl

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController {
    if (self = [super init]) {
        _searchService = [RWTFlickrSearchImpl new];
        _navigationController = navigationController;
    }
    return self;
}

- (id<RWTFlickrSearch>) getFlickrSearchService {
    return self.searchService;
}

- (void)pushViewModel:(id)viewModel {
    id viewController;
    
    if ([viewController isKindOfClass:RWTSearchResultsViewModel.class]) {
        viewController = [[RWTSearchResultsViewController alloc] initWithViewModel:viewModel];
    } else {
        NSLog(@"an unknown ViewModel was pushed");
    }
    
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
