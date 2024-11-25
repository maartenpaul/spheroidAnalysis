#@ File (label = "Input directory", style = "directory") input
#@ String (label = "File suffix", value = ".tif") suffix

// Process a single file
function processFile(input, filename) {
    open(input + File.separator + filename);
    title = getTitle();
    
    channels = getInfo("channels.count");
    if (channels > 1) {  // Handle multi-channel images
        run("Stack to RGB");
        run("8-bit");
        print("Converted " + title + " to 8-bit grayscale");
        saveAs("Tiff", input + File.separator + filename);
    } else if (bitDepth() == 24) {  // Handle RGB images
        run("8-bit");
        print("Converted " + title + " to 8-bit grayscale");
        saveAs("Tiff", input + File.separator + filename);
    } else {
        print(title + " is already grayscale. No conversion needed.");
    }
    close();
}

// Batch process files
function batchProcess(input, suffix) {
    list = getFileList(input);
    for (i = 0; i < list.length; i++) {
        if(endsWith(list[i], suffix)) {
            processFile(input, list[i]);
        }
    }
}

// Run the batch process
batchProcess(input, suffix);
print("Processing complete!");
