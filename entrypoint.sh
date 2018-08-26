#!/bin/bash

APP=/opt/pt-feeder
APPCONFIG=/app/ptf

export PATH="$PATH:$APP"
# Frist Init
if [ ! -d "$APPCONFIG/config" ]; then
   echo "No properties found"
   cp -pr $APP/config $APPCONFIG/config;

   rm -fr $APP/config;

   echo "Create the symlink $APPCONFIG/config to $APP/config"
   ln -sF $APPCONFIG/config .;

   ls -la $APPCONFIG/*
fi

# Start Check
if [[ -L "$APP/config" && -d "$APPCONFIG/config" ]]; then
   echo "$file is a symlink to a directory"
else
   echo "Recreate the symlink"
   rm -fr $APP/config;
   ln -sF $APPCONFIG/config .;
fi

#dotnet publish -p:PublishWithAspNetCoreTargetManifest=false pt-feeder.dll
dotnet pt-feeder.dll
