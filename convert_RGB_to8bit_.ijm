#@ File (label = "Input directory", style = "directory") input
#@ String (label = "File suffix", value = ".tif") suffix

// Function to process a single file
function processFile(input, filename) {
    // Open the image
    open(input + File.separator + filename);
    
    // Get image properties
    title = getTitle();
    
    // Check if the image is RGB
    if (bitDepth() == 24) {  // 24-bit depth indicates RGB
        // Convert to 8-bit grayscale
        run("8-bit");
        print("Converted " + title + " to 8-bit grayscale");
        
        // Save and overwrite the original image
        saveAs("Tiff", input + File.separator + filename);
        print("Overwritten: " + filename);
    } else {
        print(title + " is already grayscale. No conversion needed.");
    }
    
    // Close the image
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