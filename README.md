# Headless Fiji

This repository demonstrates how to download, update and run a Fiji script in headless mode, as proof of principle to deploy our scripts to the users of the image analysis facility. This was developed for and tested on a Linux machine.


1. Run the download script to get a fresh Fiji install:
   ``` console
   sh download_fiji.sh myfiji
   ```
2. Change the sites.json file:
   ``` json
   {
       "IJPB-plugins": "IJPB-plugins",
       "Labkit": "Labkit"
   }
   ```
   The first entry (`key`) is the name of the update site, the second (`value`) is the path in the update site. So if in the `add update site` window of Fiji, the name of the site is `Foo` and the update site is `https://sites.imagej.net/bar`, then enter `"Foo": "bar"`.
3. Run the update script:
   ``` console
   sh update_fiji.sh --fiji myfiji/Fiji.app/ --sites sites.json
   ```
4. Run the example script:
   ``` console
   myfiji/Fiji.app/ImageJ-linux64 --ij2 --headless --run  macro.ijm 'output=""'
   ```
   Here output can be an absolute or relative path, always between quotation marks: `"example/path/to/folder"`.
