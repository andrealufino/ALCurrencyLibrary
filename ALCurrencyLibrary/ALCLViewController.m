//
//  ALCLViewController.m
//  ALCurrencyLibrary
//
//  Created by Andrea Mario Lufino on 12/11/13.
//  Copyright (c) 2013 Andrea Mario Lufino. All rights reserved.
//

#import "ALCLViewController.h"
#import "ALCurrency.h"

@interface ALCLViewController ()

@end

@implementation ALCLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [ALCurrency convertFromCurrency:@"USD" toCurrency:@"EUR" value:50 completionBlock:^(BOOL success, CGFloat convertedValue) {
        NSLog(@"Il valore convertito è di %f", convertedValue);
    } failureBlock:^(NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
