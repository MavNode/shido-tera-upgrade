# Shido Node Upgrade Script

Automated scripts for upgrading Shido nodes to Tera.

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

- Automatic upgrade — auto-script.sh
Waits until the blockchain reaches the upgrade height, then upgrades automatically.

```
chmod +x auto-script.sh
./auto-script.sh
```

Steps performed:
- Monitors node block height
- Waits until upgrade height is reached
- Automatically performs upgrade steps
- Restarts and verifies the node

Recommended if the upgrade happens while you are offline or sleeping.

## Notes
- The binary is compatible with Ubuntu 20.04, 22.04, and 24.04.
- Ensure your node is fully synced before the upgrade.
- To monitor logs:
```
sudo journalctl -u shidod -f --no-hostname -o cat
```

Upgrade safely and happy validating.
