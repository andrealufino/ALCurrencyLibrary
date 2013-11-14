//
//  ALCurrency.h
//  ALCurrencyLibrary
//
//  Created by Andrea Mario Lufino on 12/11/13.
//  Copyright (c) 2013 Andrea Mario Lufino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALCurrencyCodes.h"

typedef void(^ALCurrencyCompletionBlock)(BOOL success, CGFloat convertedValue);
typedef void(^ALCurrencyFailureBlock)(NSError *error);

/*!
 * This class is useful to convert from currency A to currency and viceversa. It uses the service offered by http://rate-exchange.appspot.com/
 */
@interface ALCurrency : NSObject

/*!
 Get the list of the common currencies iso codes
 @return NSArray with the common currencies iso codes
 */
+ (NSArray *)commonCurrenciesISOCode;

/*!
 Convert the passed value from the first currency to the second
 @param fromCurrency NSString representing the iso code of the currency to convert from
 @param toCurrency NSString representing the iso code of the currency to convert to
 @param value CGFloat number that has to be converted
 @param onCompletion A block of code that has to be performed when the request is completed
 @param onFailure A block of code that has to be performed when the request fails
 */
+ (void)convertFromCurrency:(NSString *)fromCurrency toCurrency:(NSString *)toCurrency value:(CGFloat)value
            completionBlock:(ALCurrencyCompletionBlock)onCompletion failureBlock:(ALCurrencyFailureBlock)onFailure;

@end
