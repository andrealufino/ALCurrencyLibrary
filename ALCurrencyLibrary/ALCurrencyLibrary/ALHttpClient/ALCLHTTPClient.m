//
//  ALCLHTTPClient.m
//  ALCurrencyLibrary
//
//  Created by Andrea Mario Lufino on 12/11/13.
//  Copyright (c) 2013 Andrea Mario Lufino. All rights reserved.
//

#import "ALCLHTTPClient.h"

#define kBaseURL @"http://rate-exchange.appspot.com/"

@implementation ALCLHTTPClient

+ (id)sharedHTTPClient {
    static dispatch_once_t once_token;
    static id sharedInstance;
    dispatch_once(&once_token, ^{
        sharedInstance = [[[self class] alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    });
    return sharedInstance;
}

@end
