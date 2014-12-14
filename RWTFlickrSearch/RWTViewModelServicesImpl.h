//
//  RWTViewModelServicesImpl.h
//  RWTFlickrSearch
//
//  Created by sky on 14/12/13.
//  Copyright (c) 2014年 Colin Eberhardt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RWTViewModelServices.h"

@interface RWTViewModelServicesImpl : NSObject <RWTViewModelServices>

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController;

@end
