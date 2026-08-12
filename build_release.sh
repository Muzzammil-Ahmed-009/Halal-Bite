#!/bin/bash
echo "Building Release APK with Obfuscation..."
flutter build apk --release --obfuscate --split-debug-info=build/app/outputs/symbols

echo ""
echo "Building Release AppBundle (AAB) with Obfuscation..."
flutter build appbundle --release --obfuscate --split-debug-info=build/app/outputs/symbols

echo ""
echo "Build complete! Your obfuscated production binaries are ready."
echo "Make sure to backup the 'build/app/outputs/symbols' directory in case you need to de-obfuscate crash logs later."
