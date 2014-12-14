//
//  RWTFlickrSearchViewModel.h
//  RWTFlickrSearch
//
//  Created by sky on 14/12/13.
//  Copyright (c) 2014年 Colin Eberhardt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "RWTViewModelServices.h"

@interface RWTFlickrSearchViewModel : NSObject

@property (strong, nonatomic) NSString   *searchText;
@property (strong, nonatomic) NSString   *title;

@property (strong, nonatomic) RACCommand *executeSearch;

//暴露一个接口来间接 获取 Model
- (instancetype)initWithServices:(id<RWTViewModelServices>)services;

@end
