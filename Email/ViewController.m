//
//  ViewController.m
//  Email
//
//  Created by Matthew Griffin on 7/9/13.
//  Copyright (c) 2013 Matthew Griffin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property CGRect frame;

@end

@implementation ViewController

@synthesize fromEmail,fromName,subject,toEmail,body,frame;

- (void)viewDidLoad
{
    [super viewDidLoad];
    body.text = @"Message Here";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(IBAction)send {
    [super didReceiveMemoryWarning];
    NSMutableString *post = [NSMutableString stringWithString:@""];
    [post appendFormat:@"fromName=%@&fromEmail=%@&toEmail=%@&subject=%@&body=%@",fromName.text,fromEmail.text,toEmail.text,subject.text,body.text];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    //NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:*INSERT WEB FORM HERE*]];
    [request setHTTPMethod:@"POST"];
    //[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    //[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSHTTPURLResponse *response;
    NSError *error;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    body.text = [NSString stringWithFormat:@"response: %@",response.allHeaderFields];
    if(error) {
        body.text = [NSString stringWithFormat:@"Error: %@",error];
    }
}

-(IBAction)done {
    [body resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)textViewDidBeginEditing:(UITextView *)textView {
    frame = body.frame;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    textView.frame = CGRectMake(textView.frame.origin.x, 44, textView.frame.size.width, 416);
    [UIView commitAnimations];
}

-(void)textViewDidEndEditing:(UITextView *)textView {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    textView.frame = frame;
    [UIView commitAnimations];
}

@end
