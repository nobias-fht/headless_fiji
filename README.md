# Headless Fiji

This repository demonstrates how to download, update and run a Fiji script in headless mode, as proof of principle to deploy to the users of the image analysis facility our scripts. This was developed and tested on a Linux machine.


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
3. Run the update script:
   ``` console
   sh update_fiji.sh --fiji myfiji/Fiji.app/ --sites sites.json
   ```
4. Run the example script:
   ``` console
   myfiji/Fiji.app/ImageJ-linux64 --ij2 --headless --run  macro.ijm 'output=""'
   ```
   
