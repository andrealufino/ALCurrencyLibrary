//
//  ALCLHTTPClient.h
//  ALCurrencyLibrary
//
//  Created by Andrea Mario Lufino on 12/11/13.
//  Copyright (c) 2013 Andrea Mario Lufino. All rights reserved.
//

#import "AFHTTPClient.h"

@interface ALCLHTTPClient : AFHTTPClient

/*!
 Singleton instance
 @return id singleton instance of the class
 */
+ (id)sharedHTTPClient;

@end
