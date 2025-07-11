 imapsync Docker Image

This repository provides a `Dockerfile` to create a Docker image containing the `imapsync` utility, a powerful tool for migrating or synchronizing IMAP mailboxes between different servers. The image is based on **Debian Bookworm-slim** and includes all necessary dependencies for `imapsync`.

---
## Usage

### Prerequisites

* Docker installed and running on your system

### 1. Build the Docker Image

Clone this repository (or copy the `Dockerfile` into an empty directory) and then build the image:

```bash
git clone https://github.com/manzolo/imapsync-docker.git
cd imapsync-docker
docker build -t manzolo/imapsync-tool .
```

### 2. Run Migrations with imapsync

Once the image is built, you can run imapsync by passing all necessary parameters directly as arguments to the docker run command.
Basic Usage Example

To display imapsync's help:

```bash
docker run manzolo/imapsync-tool --help
```

### 3. Example Migration from Old Cyrus IMAP to New Dovecot IMAP

```bash
docker run imapsync-tool \
--host1 old.mailserver.com \
--user1 myuser_old \
--pass1 oldpassword \
--port1 143 --nossl1 --notls1 \
--host2 new.mailserver.com \
--user2 myuser_new \
--pass2 newpassword \
--port2 993 --ssl2 \
--syncflags \
--subscribeall \
--dry
```