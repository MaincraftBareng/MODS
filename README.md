# MODS
mod list for maincraft.averism.com
---
## Installation
step by step easy client installation:
- please make sure you already have minecraft forge and run minecraft (with forge enabled) atleast once before installing these mods
  - minecraft forge can be downloaded at http://files.minecraftforge.net/maven/net/minecraftforge/forge/index_1.12.2.html
- open shell enabled terminal (powershell/cygwin/nodejs command prompt/bash)
- please make sure can access git command on your shell
- change your current working directory to your minecraft installation directory (*not minecraft launcher path*)
  - on windows its usually on c:\Users\<username>\appData\.minecraft
  - on linux its usually on /home/<username>/.minecraft
- run `git clone https://github.com/MaincraftBareng/MODS.git maincraftMods`
- run `cd maincraftMods`
- run `sh install.sh client ..`

> :warning: note that this will reset your config and mods folder. Please backup as necessary

## New Mod Suggestion
- fork this repo
- create new branch
- create new md file in the root directory with below specification
- put jar in mods directory
- put config in config/yourmodname directory
- create pull request with compelling description of the new mod, and links detailing the new mod

### new mod md file format
filename: mod_<yourmodname>.md
body:
- mod_name: <yourmodname>
- location_type_server: path | url
- location_server: the jar filename in mods folder if type is path, the url to direct download if type url
- location_client: the jar filename in mods folder

description: 
description of the new mods