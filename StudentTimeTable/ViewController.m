//
//  ViewController.m
//  StudentTimeTable
//
//  Created by Suresh on 2/23/17.
//  Copyright © 2017 Suresh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defauls = [NSUserDefaults standardUserDefaults];
    for (int i = 0; i < 54 ; i++) {
        NSString *str =[defauls objectForKey:[NSString stringWithFormat:@"%d",i] ];
        [[self.buttonCollection objectAtIndex:i]setTitle:str forState:UIControlStateNormal];
        

    }
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonPressed:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Time Table" message:@"Enter Subject" preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
       textField.placeholder = @"Enter Subject";
    }];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UITextField *name = [alert.textFields objectAtIndex:0];
        [[self.buttonCollection objectAtIndex:[sender tag]]setTitle:name.text forState:UIControlStateNormal] ;
        NSUserDefaults *defauls = [NSUserDefaults standardUserDefaults];
//        ok.enabled = name.text.length>1;
        NSString *str = [NSString stringWithFormat:@"%ld",[sender tag]];
        [defauls setObject:name.text forKey:str];
        [defauls synchronize];
    }];
    UIAlertAction *Cancel = [UIAlertAction actionWithTitle:@"Cancrl" style:UIAlertActionStyleDestructive handler:nil];
    [alert addAction:ok];
    [alert addAction:Cancel];
    [self presentViewController:alert animated:YES completion:nil];
    
    
}
@end
