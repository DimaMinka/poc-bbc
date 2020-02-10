Bitbucket Cloud - POC scripts
=============================

Create `config.sh` by copying from `config.sh.example`,
and follow the steps in comments to set your credentials to make authenticated requests.

Run `./get-access-token.sh` to generate an access token.

- The script will ask you to navigate to a page in your browser,
  where you can authorize access to your **OAuth consumer**,
  and get redirected to a URL that contains a *code*.

- The script will ask you to paste the code.
  It will use the code to generate an access token,
  and save its value in a local work file, to use by the other helper scripts.

Use the `./get.sh`, `./put.sh` and `./delete.sh` scripts to make authenticated calls easily to API endpoints.
Run a script without parameters to get a usage message, which explain the required parameters with examples.

See the `examples` directory for example JSON payloads.

Links
-----

- [Bitbucket API authentication](https://developer.atlassian.com/bitbucket/api/2/reference/meta/authentication)
- [Code Reports API](https://developer.atlassian.com/bitbucket/api/2/reference/resource/repositories/%7Bworkspace%7D/%7Brepo_slug%7D/commit/%7Bcommit%7D/reports)
- [Example Pull Request with Code Reports](https://bitbucket.org/extended-demo-time/code-reports/pull-requests/1)
