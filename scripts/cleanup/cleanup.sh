#!/bin/bash

# Exit on errors
set -e

echo "🧹 Starting full cleanup process..."

# Define RIP graveyard location
GRAVEYARD="/tmp/graveyard-$USER"

# --- Clear System Cache (Skip Protected Directories) ---
echo "🗑️  Clearing system cache..."
find ~/Library/Caches -mindepth 1 -maxdepth 1 \
  ! -name "CloudKit" \
  ! -name "FamilyCircle" \
  ! -name "com.apple.HomeKit" \
  ! -name "com.apple.Safari" \
  ! -name "com.apple.ap.adprivacyd" \
  ! -name "com.apple.containermanagerd" \
  ! -name "com.apple.findmy.fmfcore" \
  ! -name "com.apple.findmy.fmipcore" \
  ! -name "com.apple.findmy.imagecache" \
  ! -name "com.apple.homed" \
  -exec rm -rf {} + 2>/dev/null

# --- Empty MacOS Trash (Forcing ALL Trash Locations) ---
echo "🗑️  Cleaning MacOS Trash..."
# User Trash
rm -rf ~/.Trash/* 2>/dev/null && echo "✅ User Trash cleaned" || echo "⚠️ Skipping protected User Trash items"
# System & External Trash
sudo rm -rf /Volumes/*/.Trashes/* 2>/dev/null && echo "✅ External drive Trash cleaned" || echo "⚠️ Skipping external Trash items"
sudo rm -rf /private/var/root/.Trash/* 2>/dev/null && echo "✅ Root Trash cleaned" || echo "⚠️ Skipping root Trash items"
# Hidden Trash locations used by Finder
sudo rm -rf /private/var/root/.local/share/Trash/* 2>/dev/null && echo "✅ Hidden system Trash cleaned"
sudo rm -rf /Users/*/.Trash/* 2>/dev/null && echo "✅ Other users' Trash cleaned"
sudo rm -rf /System/Volumes/Data/.Trashes/* 2>/dev/null && echo "✅ System Data Trash cleaned"
sudo rm -rf /private/var/.Trashes/* 2>/dev/null && echo "✅ Private system Trash cleaned"

# --- Remove System Logs ---
echo "🗂️  Clearing system logs..."
sudo rm -rf /private/var/log/asl/*.asl 2>/dev/null && echo "✅ System logs cleaned"

# --- Remove .DS_Store Files (SKIP PROTECTED DIRECTORIES) ---
echo "📂 Removing .DS_Store files..."
find "$HOME" -type f -name ".DS_Store" \
  ! -path "$HOME/Library/*" \
  ! -path "$HOME/Library/Application Support/*" \
  ! -path "$HOME/Library/Containers/*" \
  ! -path "$HOME/Library/Group Containers/*" \
  -exec rm -f {} + 2>/dev/null && echo "✅ .DS_Store files removed"

# --- Clear Temporary Files ---
echo "⏳ Clearing temporary files..."
sudo rm -rf /private/var/folders/* 2>/dev/null && echo "✅ Cleared system temp files"
rm -rf /tmp/* 2>/dev/null && echo "✅ Cleared /tmp files"

# --- Clear RIP Graveyard (Permanently Delete) ---
echo "⚰️  Deleting RIP graveyard..."
rip --decompose 2>/dev/null && echo "✅ RIP graveyard cleared" || echo "⚠️ RIP graveyard was already empty"

echo "🎉 Full cleanup complete! 🚀"
