//
//  ViewController.h
//  StudentTimeTable
//
//  Created by Suresh on 2/23/17.
//  Copyright © 2017 Suresh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)buttonPressed:(id)sender;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttonCollection;

@end

