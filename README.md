# README

This project configured for HTTPS on the local domain `test-application`.

## Quick start

```bash
./bin/rails-https
```

### For more details check HTTPS_SETUP.md

## Ngrok

For testing webhook from Quiz Arena dev/staging/prod environments you can use ngrok.

Register in Ngrock and see simple documentation for local setup - https://dashboard.ngrok.com/get-started/setup/macos

In console run: `rails s`

In separate console run: `ngrok http 3000`

You will see a terminal with Forwarding, use it to access your app in INTERNET.

#### Note: Ngrok generate random domain on each launch.
If you want to use static domain:
1. Open domains page in Ngrok https://dashboard.ngrok.com/domains 
2. Get your domain and launch ngrok with following command:
```
ngrok http --domain=<your-domain-here>.ngrok-free.dev 3000
Example:
ngrok http --domain=undelinquently-infusorial-arely.ngrok-free.dev 3000
```

in this way you will be able to access your app in INTERNET using your domain and test easily integration with Quiz Arena.


## Webhooks

To test webhooks from Quiz Arena dev/staging/prod environments you can use ngrok + following api
```
POST <your_domain>/webhook
```

Here is a controller for handling webhook requests - app/controllers/api/webhooks_controller.rb

It just logs received data to console and returns 200 status code.

You can modify it if you want to handle requests in some other way.