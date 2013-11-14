ALCurrencyLibrary
=================

Simple library to convert a value from a specific currency to another. Contains a list of 162 constants representing the common currencies in the world.

Use
=================

The use is very simple. Here is it :

    [ALCurrency convertFromCurrency:ALC_USD toCurrency:ALC_EUR value:100.0 completionBlock:^(BOOL success, CGFloat convertedValue) {
        if (success) {
            // Set the converted value in the label
            NSLog(@"Value converted = %f", convertedValue);
        }
    } failureBlock:^(NSError *error) {
        NSLog(@"Error");
    }];
    
With the method ``` - (NSArray *)commonCurrenciesIsoCodes ``` you can get a list of the 162 common currencies in the world.

In the files ALCurrenciesCodes you can see a list of NSString constants of the 162 currencies.
