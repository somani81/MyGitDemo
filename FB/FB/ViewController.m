//
//  ViewController.m
//  FB
//
//  Created by indianic on 10/07/15.
//  Copyright (c) 2015 indianic. All rights reserved.
//

#import "ViewController.h"
#import <TwitterKit/TwitterKit.h>



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    TWTRLogInButton *logInButton = [TWTRLogInButton buttonWithLogInCompletion:^(TWTRSession *session, NSError *error) {
        // play with Twitter session
    
        if ([[Twitter sharedInstance] session]) {
            TWTRShareEmailViewController* shareEmailViewController = [[TWTRShareEmailViewController alloc] initWithCompletion:^(NSString* email, NSError* error) {
                NSLog(@"Email %@, Error: %@", email, error);
            }];
            [self presentViewController:shareEmailViewController animated:YES completion:nil];
        } else {
            // TODO: Handle user not signed in (e.g. attempt to log in or show an alert)
        }
        
         if ([[Twitter sharedInstance] session])
         {
             [[[Twitter sharedInstance] APIClient] loadUserWithID:[session userID]
                                                       completion:^(TWTRUser *user,
                                                                    NSError *error)
              {
                  // handle the response or error
                  if (![error isEqual:nil]) {
                      NSLog(@"Twitter info   -> user = %@ ",user);
                      NSString *urlString = [[NSString alloc]initWithString:user.profileImageLargeURL];
                      NSURL *url = [[NSURL alloc]initWithString:urlString];
                      NSData *pullTwitterPP = [[NSData alloc]initWithContentsOfURL:url];
                      
                      UIImage *profImage = [UIImage imageWithData:pullTwitterPP];
                      
                      
                  } else {
                      NSLog(@"Twitter error getting profile : %@", [error localizedDescription]);
                  }
              }];
             
             [[[Twitter sharedInstance] APIClient] loadTweetWithID:@"20" completion:^(TWTRTweet *tweet, NSError *error) {
                 // handle the response or error
             }];
             
             NSArray *tweetIDs = @[@"20", @"510908133917487104"];
             [[[Twitter sharedInstance] APIClient] loadTweetsWithIDs:tweetIDs completion:^(NSArray *tweets, NSError *error) {
                 // handle the response or error
             }];
         }
    }];
    logInButton.center = self.view.center;
   // [self.view addSubview:logInButton];

    
    FBSDKLikeControl *button = [[FBSDKLikeControl alloc]  initWithFrame:CGRectMake(150, 150, 50, 50)];
    CGRect bounds = self.view.bounds;
    button.center = CGPointMake(
                                CGRectGetMidX(bounds), CGRectGetMidY(bounds)
                                );
    button.likeControlStyle = FBSDKLikeControlStyleBoxCount;
    button.objectID = @"93693583250";
    button.objectType = FBSDKLikeObjectTypePage;
    [self.view addSubview:button];
}

-(IBAction)buttonLogin:(id)sender
{
  /*  TWTRComposer *composer = [[TWTRComposer alloc] init];
    
    [composer setText:@"just setting up my Fabric"];
    [composer setImage:[UIImage imageNamed:@"favourate_count_bg-1.png"]];
    
    // Called from a UIViewController
    [composer showFromViewController:self completion:^(TWTRComposerResult result) {
        if (result == TWTRComposerResultCancelled) {
            NSLog(@"Tweet composition cancelled");
        }
        else {
            NSLog(@"Sending Tweet!");
        }
    }];
   */
    
//    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
//    [login logInWithReadPermissions:@[@"email"] handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
//        if (error) {
//            // Process error
//        } else if (result.isCancelled) {
//            // Handle cancellations
//        } else {
//            // If you ask for multiple permissions at once, you
//            // should check if specific permissions missing
//            if ([result.grantedPermissions containsObject:@"email"]) {
//                // Do work
//            }
//        }
//    }];
    
    
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    login.loginBehavior = FBSDKLoginBehaviorSystemAccount;
    [login logInWithPublishPermissions:@[@"publish_actions"] handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            // Process error
        } else if (result.isCancelled) {
            // Handle cancellations
        } else {
            if ([[FBSDKAccessToken currentAccessToken] hasGranted:@"publish_actions"])
            {
            
                
//                NSMutableDictionary * params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                                                aStrQuestion, @"message",
//                                                imageData, @"source",
//                                                nil];
//                
//                [FBRequestConnection startWithGraphPath:@"me/photos"
//                                             parameters:params
//                                             HTTPMethod:@"POST"
//                                      completionHandler:^(FBRequestConnection *connection, id result, NSError *error)
//                 {
//                    
//                 }];
                
//                NSDictionary *dictFBSharePRM = @{@"picture":@"http://www.gettyimages.co.uk/gi-resources/images/Homepage/Category-Creative/UK/UK_Creative_462809583.jpg",
//                                                 @"caption":@"CheckD FloorPlan",
//                                                 @"description":@"Hello World",
//                                                 @"name":@"CheckD FloorPlan",
//                                                 @"link":@"http://www.whitelotuscorporation.com/team.html"
//                                                 };
//                                [[[FBSDKGraphRequest alloc]
//                                  initWithGraphPath:@"me/feed"
//                                  parameters: dictFBSharePRM
//                                  HTTPMethod:@"POST"]
//                                 startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
//                                     if (!error) {
//                                         NSLog(@"Post id:%@", result[@"id"]);
//                                     }
//                                 }];

//                [[[FBSDKGraphRequest alloc]
//                  initWithGraphPath:@"me/feed"
//                  parameters: @{ @"message" : @"hello world"}
//                  HTTPMethod:@"POST"]
//                 startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
//                     if (!error) {
//                         NSLog(@"Post id:%@", result[@"id"]);
//                     }
//                 }];
//                
//                UIImage *someImage = [UIImage imageNamed:@"favourate_count_bg-1"];
//                FBSDKSharePhotoContent *content = [[FBSDKSharePhotoContent alloc] init];
//                content.photos = @[[FBSDKSharePhoto photoWithImage:someImage userGenerated:YES] ];
//                content.contentURL =  [NSURL URLWithString:@"http://www.indianic.com/"];
//                [FBSDKShareAPI shareWithContent:content delegate:self];
                
            
                
//                FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
//                content.imageURL = [NSURL URLWithString:@"http://www.gettyimages.co.uk/gi-resources/images/Homepage/Category-Creative/UK/UK_Creative_462809583.jpg"];
//                content.contentTitle = @"Hiii";
//                content.contentDescription = @"Hello World";
//                content.contentURL = [NSURL URLWithString:@"http://www.indianic.com/"];
//                [FBSDKShareDialog showFromViewController:self withContent:content delegate:self];
                
            }
        }
    }];
  
}

- (void)sharer:(id<FBSDKSharing>)sharer didCompleteWithResults:(NSDictionary *)results
{
    
}
- (void)sharer:(id<FBSDKSharing>)sharer didFailWithError:(NSError *)error
{
    
}
- (void)sharerDidCancel:(id<FBSDKSharing>)sharer
{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
