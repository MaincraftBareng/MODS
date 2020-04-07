# MODS
mod list for maincraft.averism.com
---
to put new mod please create new md file with name pattern: mod_modname.md
and value of the file with format:
- mod_name: the file name of the mod (without the .jar extension)
- location_type_server: url|path
- location_server: the url for the mod or relative path in this repo (note that if its url, it must be accessible by simple wget)
- location_type_client: url|path
- location_client: the url for the mod or relative path in this repo (note that if its url, it must be accessible by simple wget)
then put the related configs on a folder with the same name of the mod_name in the config folder

```diff
! please make sure you already have minecraft forge before installing these mods,
 minecraft forge can be downloaded at http://files.minecraftforge.net/maven/net/minecraftforge/forge/index_1.12.2.html
! please download the latest and install it on your machine and run it at least once before running install.sh
````

to use install.sh in client:
```sh
sh install.sh client yourminecraftpathhere
```
note that this will reset your config and mods folder. Please backup as necessary
