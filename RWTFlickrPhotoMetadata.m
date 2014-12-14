//
//  RWTFlickrPhotoMetadata.m
//  RWTFlickrSearch
//
//  Created by sky on 14/12/14.
//  Copyright (c) 2014年 Colin Eberhardt. All rights reserved.
//

#import "RWTFlickrPhotoMetadata.h"

@implementation RWTFlickrPhotoMetadata


- (NSString *)description {
    return [NSString stringWithFormat:@"metadata: comments=%lU, faves=%lU",
              self.comments, self.favorites];
}

@end
