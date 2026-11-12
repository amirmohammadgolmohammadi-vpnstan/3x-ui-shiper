# 3x-ui Sanaei — Shiper deployment

This package is prepared for deployment on **Shiper** using a Dockerfile.
Shiper officially supports custom Dockerfile deployments.

## Deploy on Shiper

1. Put these files in the root of a GitHub repository.
2. In Shiper, create **Add Project**.
3. Select **Dockerfile** as the deployment method.
4. Keep the Dockerfile path as `Dockerfile`.
5. Deploy the project.
6. Configure the application's exposed/HTTP port as **2053** if Shiper asks for a port.
7. Open the generated Shiper domain.

## Panel version

The Dockerfile uses:

`XUI_VERSION=v3.9.0`

To change the release before building, change the `XUI_VERSION` build argument in the Dockerfile.

## Important persistence note

3x-ui stores its panel database/configuration on disk (commonly under `/etc/x-ui`).
Whether that directory survives redeploys/restarts depends on the storage options available in the Shiper project/instance you use. If persistent storage is available for your deployment, mount it at:

`/etc/x-ui`

## Files

- `Dockerfile` — Shiper-compatible container build
- `README.md` — deployment instructions
- `.dockerignore` — keeps the build context clean

The original panel source is not included in this archive because the uploaded archive itself only contained the Dockerfile and README; the Dockerfile downloads the selected Sanaei release during the image build.
