//
//  RWTSearchResultsItemViewModel.h
//  RWTFlickrSearch
//
//  Created by sky on 14/12/14.
//  Copyright (c) 2014年 Colin Eberhardt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RWTFlickrPhoto.h"
#import "RWTViewModelServices.h"

@interface RWTSearchResultsItemViewModel : NSObject

@property (assign, nonatomic) BOOL     isVisible;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSURL    *url;
@property (strong, nonatomic) NSNumber *favorites;
@property (strong, nonatomic) NSNumber *comments;

- (instancetype)initWithPhoto:(RWTFlickrPhoto *)photo
                     services:(id<RWTViewModelServices>)services;

@end
