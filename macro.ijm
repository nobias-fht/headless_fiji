#@ File (label = "Ouput directory", style = "directory") output

close("*");

run("Blobs (25K)");
run("Auto Threshold", "method=Default white");

setOption("BlackBackground", true);
run("Convert to Mask");

run("Connected Components Labeling", "connectivity=4 type=[16 bits]");
run("Analyze Regions", "area circularity euler_number ellipse_elong. convexity");

saveAs("Results", output+File.separator+"results.csv");
