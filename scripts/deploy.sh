#!/bin/bash

# Exit on error
set -e

echo "🚀 Starting Discord bot deployment..."

# Pull the latest changes from the main branch
echo "📥 Pulling latest changes..."
git pull origin main

# Install dependencies
echo "📦 Installing dependencies..."
pnpm install

# Build the application
echo "🔨 Building the application..."
pnpm build

# Install PM2 if not already installed
if ! command -v pm2 &> /dev/null; then
    echo "📦 Installing PM2..."
    npm install -g pm2
fi

# Start/Restart the Discord bot using PM2
echo "🔄 Starting/Restarting Discord bot..."
pm2 restart discord-bot || pm2 start "pnpm start --characters=\"characters/discord.json\"" --name "discord-bot"

echo "✅ Discord bot deployment completed successfully!"