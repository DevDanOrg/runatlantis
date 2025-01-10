# Run-Atlantis
This project deploys ngrok and atlantis container locally on your computer/host. To understand how atlantis work in details please [see here](https://www.runatlantis.io/guide.html)

There are a number of setup you would need to run to get atlantis working. I have provided an sample-export file you would need to export to your local shell to get this working as expected. I personally added a function in my .zshrc file to export this values.

`NOTE:` For detailed explanation on how to setup atlantis please [see this link](https://www.runatlantis.io/guide/testing-locally.html)

Steps:

- Authenticate to AWS so you have a valid session token in your shell.
- Export those values mentioned in sample-export to your shell
- Run docker compose
- Browse to the ngrok `http://localhost:4040` and copy the ngrok url
- You can stop the atlantis container and update the `ATLANTIS_ATLANTIS_URL` with this value and re-export the env vars before re-starting atlantis container
- Copy add this value to the repo Webhook payload url and add `/events` at the end of the url
- Restart the atlantis container again using `docker compose up -d atlantis`