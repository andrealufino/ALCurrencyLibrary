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

@property NSArray *currencies;
@property NSString *from, *to;

@end

@implementation ALCLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Get all common currencies
    self.currencies = [ALCurrency commonCurrenciesISOCode];
    
    // Set delegates and data sources of the two picker views
    self.pickerFrom.dataSource = self;
    self.pickerFrom.delegate = self;
    self.pickerTo.dataSource = self;
    self.pickerTo.delegate = self;
    
    // Set initial values of the pickers
    [self.pickerFrom selectRow:[self.currencies indexOfObject:ALC_EUR] inComponent:0 animated:NO];
    [self.pickerTo selectRow:[self.currencies indexOfObject:ALC_USD] inComponent:0 animated:NO];
    
    // Set initial values of the currencies
    self.from = ALC_EUR;
    self.to = ALC_USD;
    
    // Empty the value converted label
    self.lblValueConverted.text = @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)convert:(id)sender {
    // Start converting
    [ALCurrency convertFromCurrency:self.from toCurrency:self.to value:[self.txtValue.text floatValue] completionBlock:^(BOOL success, CGFloat convertedValue) {
        if (success) {
            // Set the converted value in the label
            self.lblValueConverted.text = [NSString stringWithFormat:@"%f", convertedValue];
        }
    } failureBlock:^(NSError *error) {
        self.lblValueConverted.text = @"Error";
    }];
}

#pragma mark - UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    // Set the fromCurrency and toCurrency values to converting
    if ([pickerView isEqual:self.pickerFrom]) {
        self.from = [self.currencies objectAtIndex:row];
    } else {
        self.to = [self.currencies objectAtIndex:row];
    }
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.currencies.count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.currencies objectAtIndex:row];
}

@end
