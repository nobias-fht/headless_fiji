#@ File (label = "Ouput directory", style = "directory") output
print("Output folder: "+output);

close("*");
setBatchMode(true);

run("Blobs (25K)");
run("Auto Threshold", "method=Default white");

setOption("BlackBackground", true);
run("Convert to Mask");

run("Connected Components Labeling", "connectivity=4 type=[16 bits]");

path=output + File.separator + "labels.tif";
print("Saving results to: "+path); 
saveAs("Tiff", path);
