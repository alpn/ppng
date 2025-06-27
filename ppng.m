#import <Cocoa/Cocoa.h>

int main(int argc, char * const argv[]) {

    if (argc != 2)
        return 1;

    NSPasteboard *pb = [NSPasteboard generalPasteboard];
    NSImage *image = [[NSImage alloc] initWithPasteboard:pb];

    if (!image)
        return 1;

    NSData *data = [NSBitmapImageRep representationOfImageRepsInArray:[image representations]
                        usingType:NSBitmapImageFileTypeJPEG properties:@{NSImageCompressionFactor: @0.1}];
    [image release];

    if (!data)
        return 1;

    if (![data writeToFile:[NSString stringWithUTF8String:argv[1]] atomically:YES])
        return 1;

    [pb declareTypes:@[] owner:nil];
    [pb release];

    return 0;
}
