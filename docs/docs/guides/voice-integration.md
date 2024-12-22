---
sidebar_position: 10
---

# 🎙️ Voice Integration

This guide covers how to integrate and configure voice capabilities using Eleven Labs with Eliza.

## Setup

### Prerequisites

1. An Eleven Labs API key (get one at [Eleven Labs](https://elevenlabs.io))
2. Eliza properly configured and running

### Environment Configuration

Add your Eleven Labs API key to your `.env` file:

```bash
ELEVEN_LABS_API_KEY=your-api-key-here
```

## Character Configuration

Configure voice settings in your character file:

```json
{
  "name": "YourCharacter",
  "settings": {
    "voice": {
      "model": "en_US-hfc_female-medium",  // Eleven Labs voice model ID
      "stability": 0.5,                     // Optional: Voice stability (0-1)
      "similarity_boost": 0.75              // Optional: Voice clarity boost (0-1)
    }
  }
}
```

### Available Voice Models

Eleven Labs provides several voice models. Here are some commonly used ones:

- `en_US-hfc_female-medium`: Standard female voice
- `en_US-hfc_male-medium`: Standard male voice
- Custom voices: Use your custom voice ID from Eleven Labs

## Usage

Voice generation happens automatically when configured. The system will:

1. Generate text responses as usual
2. Convert the text to speech using Eleven Labs
3. Return both text and audio to supported clients

### Supported Clients

Currently, voice responses work with:

- Discord
- Telegram
- Other clients that support audio messages

## Advanced Configuration

### Fine-tuning Voice Parameters

You can adjust these parameters in your character configuration:

```json
{
  "settings": {
    "voice": {
      "model": "en_US-hfc_female-medium",
      "stability": 0.5,
      "similarity_boost": 0.75,
      "style": 0.6,               // Optional: Speaking style intensity
      "use_speaker_boost": true   // Optional: Enhanced clarity
    }
  }
}
```

### Rate Limiting

To manage API usage, you can configure rate limits:

```json
{
  "settings": {
    "voice": {
      "rate_limit": {
        "requests_per_minute": 50,
        "concurrent_requests": 3
      }
    }
  }
}
```

## Best Practices

1. Cache generated audio files to avoid redundant API calls
2. Keep responses concise to optimize audio generation
3. Test voice settings with sample text before deployment
4. Monitor API usage to stay within your plan limits

## Troubleshooting

Common issues and solutions:

1. No audio output
   - Check API key configuration
   - Verify client supports audio messages
   - Check network connectivity

2. Poor voice quality
   - Adjust stability and similarity_boost parameters
   - Try different voice models
   - Check input text formatting

3. Rate limiting errors
   - Adjust rate limiting configuration
   - Upgrade API plan if needed
   - Implement caching