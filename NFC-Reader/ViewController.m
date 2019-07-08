//
//  ViewController.m
//  NFC-Reader
//
//  Created by 吕俊 on 2019/7/8.
//  Copyright © 2019 吕俊. All rights reserved.
//

#import "ViewController.h"
#import <CoreNFC/CoreNFC.h>

@interface ViewController ()<NFCNDEFReaderSessionDelegate>

@property (nonatomic, strong) NFCNDEFReaderSession *session;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _session = [[NFCNDEFReaderSession alloc] initWithDelegate:self
                                                        queue:nil
                                     invalidateAfterFirstRead:YES];
}

- (IBAction)startScan:(id)sender {
    [_session beginSession];
}

- (IBAction)stopScan:(id)sender {
    [_session invalidateSession];
}

- (void)readerSession:(NFCNDEFReaderSession *)session didDetectNDEFs:(NSArray<NFCNDEFMessage *> *)messages {
    NFCNDEFMessage *message = messages.firstObject;
    NFCNDEFPayload *payload = message.records.firstObject;
    NSLog(@"succeed");
}

- (void)readerSession:(NFCNDEFReaderSession *)session didInvalidateWithError:(NSError *)error {
    NSLog(error.localizedDescription);
}

@end
