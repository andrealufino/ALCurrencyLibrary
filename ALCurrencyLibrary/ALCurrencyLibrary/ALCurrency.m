//
//  ALCurrency.m
//  ALCurrencyLibrary
//
//  Created by Andrea Mario Lufino on 12/11/13.
//  Copyright (c) 2013 Andrea Mario Lufino. All rights reserved.
//

#import "ALCurrency.h"
#import "AFNetworking.h"
#import "ALCLHTTPClient.h"

#define kURL @"currency"

//http://rate-exchange.appspot.com/currency?from=USD&to=EUR&q=1

@interface ALCurrency ()

@end

@implementation ALCurrency

+ (NSArray *)commonCurrenciesISOCode {
    NSArray *currencies = [NSLocale commonISOCurrencyCodes];
    return currencies;
}

+ (void)convertFromCurrency:(NSString *)fromCurrency toCurrency:(NSString *)toCurrency value:(CGFloat)value
               completionBlock:(ALCurrencyCompletionBlock)onCompletion failureBlock:(ALCurrencyFailureBlock)onFailure {
    
    NSDictionary *parameters = @{@"from": fromCurrency, @"to": toCurrency, @"q": @(value)};
    
    NSMutableURLRequest *request = [[ALCLHTTPClient sharedHTTPClient] requestWithMethod:@"GET" path:kURL parameters:parameters];
    AFJSONRequestOperation *requestOperation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        onCompletion(YES, [JSON[@"v"] floatValue]);
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"Failed\nResponse = %@\nError = %@\nJSON = %@",response, error, JSON);
        onFailure(error);
    }];
    
    [[ALCLHTTPClient sharedHTTPClient] enqueueHTTPRequestOperation:requestOperation];
}

@end
