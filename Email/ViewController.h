//
//  ViewController.h
//  Email
//
//  Created by Matthew Griffin on 7/9/13.
//  Copyright (c) 2013 Matthew Griffin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate,UITextViewDelegate>

@property IBOutlet UITextField *fromName;

@property IBOutlet UITextField *fromEmail;

@property IBOutlet UITextField *toEmail;

@property IBOutlet UITextField *subject;

@property IBOutlet UITextView *body;

@end
