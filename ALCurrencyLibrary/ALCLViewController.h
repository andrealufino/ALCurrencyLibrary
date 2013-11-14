//
//  ALCLViewController.h
//  ALCurrencyLibrary
//
//  Created by Andrea Mario Lufino on 12/11/13.
//  Copyright (c) 2013 Andrea Mario Lufino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALCLViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtValue;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerFrom;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerTo;
@property (weak, nonatomic) IBOutlet UILabel *lblValueConverted;

- (IBAction)convert:(id)sender;

@end
