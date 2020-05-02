#!/bin/bash
echo "Compiling source"
npm run build
echo "removing old ./docs"
rm -rf ./docs
echo "Copying ./public to ./docs"
cp -r ./public ./docs
echo "Done!"