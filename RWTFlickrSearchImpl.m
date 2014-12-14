//
//  RWTFlickrSearchImpl.m
//  RWTFlickrSearch
//
//  Created by sky on 14/12/13.
//  Copyright (c) 2014年 Colin Eberhardt. All rights reserved.
//

#import "RWTFlickrSearchImpl.h"
#import "RWTFlickrSearchResults.h"
#import "RWTFlickrPhoto.h"
#import <objectiveflickr/ObjectiveFlickr.h>
#import <LinqToObjectiveC/NSArray+LinqExtensions.h>

@interface RWTFlickrSearchImpl() <OFFlickrAPIRequestDelegate>

@property (strong, nonatomic) NSMutableSet       *requests;
@property (strong, nonatomic) OFFlickrAPIContext *flickrContext;

@end

@implementation RWTFlickrSearchImpl

- (instancetype)init {
    self = [super init];
    
    if (self) {
        NSString *OFSampleAppAPIKey = @"5fc3ab871908f1f2d3e261562608d1d6";
        NSString *OFSampleAppAPISharedSecret = @"54750373b9af99ee";
        
        _flickrContext = [[OFFlickrAPIContext alloc] initWithAPIKey:OFSampleAppAPIKey
                                                       sharedSecret:OFSampleAppAPISharedSecret];
        
        _requests = [NSMutableSet new];
    }
    
    return self;
}

- (RACSignal *)signalFromAPIMethod:(NSString *)method
                         arguments:(NSDictionary *)args
                         transform:(id(^)(NSDictionary *response))block {
    //1.Create a signal for this request
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        //2.Create a Flick request object
        OFFlickrAPIRequest *flickrRequest =
          [[OFFlickrAPIRequest alloc] initWithAPIContext:self.flickrContext];
        flickrRequest.delegate = self;
        [self.requests addObject:flickrRequest];
        
        
        //3.Create a signal from the delegate method
        RACSignal *successSignal =
        [self rac_signalForSelector:@selector(flickrAPIRequest:didCompleteWithResponse:)
                       fromProtocol:@protocol(OFFlickrAPIRequestDelegate)];
        
        // 3.5 Create a signal from the failure delegate method
        RACSignal *failureSignal =
        [self rac_signalForSelector:@selector(flickrAPIRequest:didFailWithError:)
                       fromProtocol:@protocol(OFFlickrAPIRequestDelegate)];
        
        //4.Handle the response
        [[[successSignal
           map:^id(RACTuple *tuple) {
               return tuple.second;
           }]
           map:block]
           subscribeNext:^(id x) {
               [subscriber sendNext:x];
               [subscriber sendCompleted];
           }
           error:^(NSError *error) {
               NSLog(@"An error occurred: %@", error);
           }];
        
        // 4.4. Handle if a response is a failure
        [[[failureSignal
           map:^id(RACTuple *tuple) {
               return @{@"error" : tuple.second};
           }]
          map:block]
         subscribeNext:^(id x) {
             [subscriber sendNext:x];
             [subscriber sendCompleted];
         }
         error:^(NSError *error) {
             NSLog(@"An error occurred: %@", error);
         }];
        
        //5.Make the request
        [flickrRequest callAPIMethodWithGET:method
                                  arguments:args];
        
        //6.When we are done, remove the reference to thsi request
        return [RACDisposable disposableWithBlock:^{
            [self.requests removeObject:flickrRequest];
        }];
    }];
}


#pragma mark - RWTFlickrSearch
- (RACSignal *)flickrSearchSignal:(NSString *)searchString {
    
    return [self signalFromAPIMethod:@"flickr.photos.search"
                           arguments:@{@"text": searchString,
                                       @"sort": @"interesting-desc"}
                           transform:^id(NSDictionary *response) {

       RWTFlickrSearchResults *results = [RWTFlickrSearchResults new];;
                               results.searchString = searchString;
                               results.totalResults = [[response valueForKeyPath:@"photos.total"] integerValue];
                               
                               NSArray *photos = [response valueForKeyPath:@"photos.photo"];
                               results.photos = [photos linq_select:^id(NSDictionary *jsonPhoto) {
                                   RWTFlickrPhoto *photo = [RWTFlickrPhoto new];
                                   photo.title = [jsonPhoto objectForKey:@"title"];
                                   photo.identifer = [jsonPhoto objectForKey:@"id"];
                                   photo.url = [self.flickrContext photoSourceURLFromDictionary:jsonPhoto
                                                                                           size:OFFlickrSmallSize];
                                   return photo;
                               }];
                               
                               return results;
                           }];
    
    
}

- (RACSignal *)flickrImageMetadata:(NSString *)photoIdentifier {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *currentDateString = [dateFormatter stringFromDate:[NSDate date]];
    return [self signalFromAPIMethod:@"flickr.stats.getPhotoStats"
                           arguments:@{@"photo_id": photoIdentifier,
                                       @"date": currentDateString}
                           transform:^id(NSDictionary *response) {
                               NSLog(@"Response: %@", response);
#warning Do and Return stuff
                               return nil;
                           }];
}

@end
