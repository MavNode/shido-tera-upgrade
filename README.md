# Shido Node Upgrade Script

Automated scripts for upgrading Shido nodes to TERA v3.3.1.

This repository provides two upgrade options:

- **script.sh** — performs the upgrade immediately.
- **auto-script.sh** — waits for the upgrade block height and performs the upgrade automatically.

---

## Installation

Clone the repository:

```
git clone https://github.com/MavNode/shido-tera-upgrade
cd shido-tera-upgrade
```

## Usage
- Manual upgrade — script.sh
Runs the upgrade immediately.

```
chmod +x script.sh
./script.sh
```

Steps performed:
- Stops the node
- Removes old binary
- Downloads new binary
- Installs updated binary
- Restarts the node
- Verifies service status

Use this option if you are online during the upgrade.

---

- Automatic upgrade — auto-script.sh
This option waits until the blockchain reaches the upgrade height and then performs the upgrade automatically.

It is recommended to run the script inside a screen session, so it keeps running even if you close your terminal or disconnect.

- Step 1 — Start a screen session
```
screen -S tera
```

Step 2 — Run the upgrade script
```
chmod +x auto-script.sh
./auto-script.sh
```

The script will:
- Monitor node block height
- Wait for the upgrade height
- Perform the upgrade automatically
- Restart and verify the node

Step 3 — Detach from screen (leave it running)

Press:
Ctrl + A, then D

You can now safely close your terminal or go offline.

Returning later

To reconnect to the running session:
```
screen -r tera
```

To see available sessions:
```
screen -ls
```

After the upgrade
Once the upgrade finishes, you can monitor logs:
```
sudo journalctl -u shidod -f --no-hostname -o cat
```

Check that:
- the node service is running,
- blocks continue syncing,
- no repeated errors appear.

When finished, you can exit screen normally:
```
exit
```

## Notes
- The binary is compatible with Ubuntu 20.04, 22.04, and 24.04.
- Ensure your node is fully synced before the upgrade.
- To monitor logs:
```
sudo journalctl -u shidod -f --no-hostname -o cat
```

Upgrade safely and happy validating.
